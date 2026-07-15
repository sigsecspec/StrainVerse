-- Quick fix: "could not find table strainverse.profiles"
-- Run this entire file in Supabase SQL Editor.
-- Schema name must be "StrainVerse" (capital S and V), not strainverse.

-- Fix accidental lowercase schema from dashboard/tools
DO $$
BEGIN
  IF EXISTS (SELECT 1 FROM pg_namespace WHERE nspname = 'strainverse')
     AND NOT EXISTS (SELECT 1 FROM pg_namespace WHERE nspname = 'StrainVerse') THEN
    ALTER SCHEMA strainverse RENAME TO "StrainVerse";
  END IF;
END $$;

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
        AND NOT (lower(trim(part)) = 'strainverse' AND app_schema = 'StrainVerse')
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

  RETURN db_schemas;
END;
$$;

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

GRANT USAGE ON SCHEMA "StrainVerse" TO anon, authenticated, service_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON "StrainVerse".profiles TO authenticated, service_role;
GRANT SELECT ON "StrainVerse".profiles TO anon;

-- Backfill profiles for existing auth users (Cookbook / shared Verse accounts)
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

-- Expose schema to Supabase Data API (requires register_app_schema from sql/update.sql)
SELECT public.register_app_schema('StrainVerse');
NOTIFY pgrst, 'reload schema';

-- Verify (should return one row)
SELECT schemaname, tablename
FROM pg_tables
WHERE schemaname = 'StrainVerse' AND tablename = 'profiles';
