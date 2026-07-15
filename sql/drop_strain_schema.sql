-- Drop legacy `strain` schema and switch to canonical "StrainVerse"
-- Run this in Supabase SQL Editor FIRST, then run sql/update.sql
--
-- Old setup used schema: strain  (wrong)
-- App expects schema:  StrainVerse (correct, case-sensitive)

CREATE SCHEMA IF NOT EXISTS "StrainVerse";

CREATE OR REPLACE FUNCTION public.register_app_schema(app_schema text)
RETURNS text
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  config_entry text;
  db_schemas text := 'public';
  schema_parts text[];
  schema_part text;
  already_listed boolean := false;
BEGIN
  IF app_schema IS NULL OR length(trim(app_schema)) = 0 THEN
    RAISE EXCEPTION 'register_app_schema: schema name is required';
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_namespace WHERE nspname = app_schema) THEN
    RAISE EXCEPTION 'Invalid schema "%". Create it first.', app_schema;
  END IF;

  FOR config_entry IN
    SELECT unnest(rolconfig) FROM pg_roles WHERE rolname = 'authenticator'
  LOOP
    IF config_entry LIKE 'pgrst.db_schemas=%' THEN
      db_schemas := substring(config_entry FROM 'pgrst.db_schemas=(.*)$');
    END IF;
  END LOOP;

  schema_parts := string_to_array(db_schemas, ',');
  db_schemas := array_to_string(
    ARRAY(
      SELECT DISTINCT trim(part)
      FROM unnest(schema_parts) AS part
      WHERE trim(part) <> ''
        AND NOT (
          app_schema = 'StrainVerse'
          AND lower(trim(part)) IN ('strain', 'strainverse')
        )
    ),
    ','
  );

  schema_parts := string_to_array(db_schemas, ',');
  FOREACH schema_part IN ARRAY schema_parts LOOP
    IF trim(schema_part) = app_schema THEN
      already_listed := true;
      EXIT;
    END IF;
  END LOOP;

  IF NOT already_listed THEN
    db_schemas := trim(both ',' FROM db_schemas || ',' || app_schema);
    EXECUTE format('ALTER ROLE authenticator SET pgrst.db_schemas = %L', db_schemas);
    PERFORM pg_notify('pgrst', 'reload config');
    PERFORM pg_notify('pgrst', 'reload schema');
  END IF;

  EXECUTE format('GRANT USAGE ON SCHEMA %I TO anon, authenticated, service_role', app_schema);
  EXECUTE format('GRANT ALL ON ALL TABLES IN SCHEMA %I TO anon, authenticated, service_role', app_schema);
  EXECUTE format('GRANT ALL ON ALL SEQUENCES IN SCHEMA %I TO anon, authenticated, service_role', app_schema);
  EXECUTE format('GRANT ALL ON ALL ROUTINES IN SCHEMA %I TO anon, authenticated, service_role', app_schema);

  RETURN db_schemas;
END;
$$;

GRANT EXECUTE ON FUNCTION public.register_app_schema(text) TO authenticated, service_role;

-- Minimal profiles table so we can migrate users before dropping legacy schema
CREATE TABLE IF NOT EXISTS "StrainVerse".profiles (
  id uuid PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  name text NOT NULL,
  handle text NOT NULL UNIQUE,
  avatar text,
  bio text,
  widgets jsonb DEFAULT '[]'::jsonb,
  latitude float8,
  longitude float8,
  distance_radius float8,
  fav_strains jsonb DEFAULT '[]'::jsonb,
  smoking_style text,
  city text,
  state text,
  badges jsonb DEFAULT '[]'::jsonb,
  custom_css text,
  custom_js text,
  date_of_birth date,
  status text DEFAULT 'active',
  created_at timestamptz DEFAULT now()
);

ALTER TABLE "StrainVerse".profiles ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Public profiles are viewable by everyone." ON "StrainVerse".profiles;
CREATE POLICY "Public profiles are viewable by everyone." ON "StrainVerse".profiles
  FOR SELECT USING (true);
DROP POLICY IF EXISTS "Users can insert their own profile." ON "StrainVerse".profiles;
CREATE POLICY "Users can insert their own profile." ON "StrainVerse".profiles
  FOR INSERT WITH CHECK (auth.uid() = id);
DROP POLICY IF EXISTS "Users can update their own profile." ON "StrainVerse".profiles;
CREATE POLICY "Users can update their own profile." ON "StrainVerse".profiles
  FOR UPDATE USING (auth.uid() = id);

-- Copy any user profiles from legacy strain schema before drop
DO $$
BEGIN
  IF to_regclass('strain.profiles') IS NOT NULL THEN
    INSERT INTO "StrainVerse".profiles (id, name, handle, avatar, bio)
    SELECT
      p.id,
      p.name,
      p.handle,
      p.avatar,
      COALESCE(p.bio, 'Ready to connect.')
    FROM strain.profiles p
    ON CONFLICT (id) DO NOTHING;

    RAISE NOTICE 'Migrated profiles from strain -> StrainVerse';
  END IF;
EXCEPTION
  WHEN undefined_column THEN
    RAISE NOTICE 'strain.profiles has different columns; skipped profile migration';
END $$;

-- Remove legacy schemas from Supabase Data API before dropping them
DO $$
DECLARE
  config_entry text;
  db_schemas text := 'public';
  cleaned text;
BEGIN
  FOR config_entry IN
    SELECT unnest(rolconfig) FROM pg_roles WHERE rolname = 'authenticator'
  LOOP
    IF config_entry LIKE 'pgrst.db_schemas=%' THEN
      db_schemas := substring(config_entry FROM 'pgrst.db_schemas=(.*)$');
    END IF;
  END LOOP;

  cleaned := array_to_string(
    ARRAY(
      SELECT trim(part)
      FROM unnest(string_to_array(db_schemas, ',')) AS part
      WHERE trim(part) <> ''
        AND lower(trim(part)) NOT IN ('strain', 'strainverse')
    ),
    ','
  );

  EXECUTE format('ALTER ROLE authenticator SET pgrst.db_schemas = %L', cleaned);
  PERFORM pg_notify('pgrst', 'reload config');
  PERFORM pg_notify('pgrst', 'reload schema');

  RAISE NOTICE 'Removed strain/strainverse from Data API. Current schemas: %', cleaned;
END $$;

-- Drop the old schema (and everything in it)
DROP SCHEMA IF EXISTS strain CASCADE;
DROP SCHEMA IF EXISTS strainverse CASCADE;

-- Register canonical schema with the Data API
SELECT public.register_app_schema('StrainVerse');
NOTIFY pgrst, 'reload schema';

-- Backfill any auth users still missing profiles
INSERT INTO "StrainVerse".profiles (id, name, handle, avatar, bio)
SELECT
  au.id,
  COALESCE(au.raw_user_meta_data->>'name', split_part(au.email, '@', 1)) AS name,
  COALESCE(
    au.raw_user_meta_data->>'handle',
    split_part(au.email, '@', 1) || '_' || substr(md5(random()::text), 1, 4)
  ) AS handle,
  'https://api.dicebear.com/7.x/avataaars/svg?seed=' || au.id AS avatar,
  'Ready to connect.' AS bio
FROM auth.users au
LEFT JOIN "StrainVerse".profiles p ON au.id = p.id
WHERE p.id IS NULL
ON CONFLICT (id) DO NOTHING;

GRANT USAGE ON SCHEMA "StrainVerse" TO anon, authenticated, service_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA "StrainVerse" TO authenticated, service_role;
GRANT SELECT ON ALL TABLES IN SCHEMA "StrainVerse" TO anon;

-- Verify: strain should be gone, StrainVerse.profiles should exist
SELECT nspname AS schema_name
FROM pg_namespace
WHERE nspname IN ('strain', 'strainverse', 'StrainVerse')
ORDER BY nspname;

SELECT schemaname, tablename
FROM pg_tables
WHERE schemaname = 'StrainVerse' AND tablename = 'profiles';

-- NEXT STEP: run the full sql/update.sql to create posts, strains, and all other tables.
