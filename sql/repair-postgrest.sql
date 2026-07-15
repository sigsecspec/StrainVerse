-- QUICK FIX: "could not query the database for the schema cache" / can't log in
-- Run this ENTIRE file in Supabase SQL Editor (creates the function, then runs it).
--
-- Do NOT run only: select repair_postgrest_schemas('StrainVerse');
-- That fails until this script creates the function first.

create schema if not exists "StrainVerse";

drop function if exists public.repair_postgrest_schemas(text);

create or replace function public.repair_postgrest_schemas(required_schema text default 'StrainVerse')
returns text
language plpgsql
security definer
set search_path = public
as $$
declare
  config_entry text;
  db_schemas text := 'public';
  cleaned text;
begin
  for config_entry in
    select unnest(rolconfig)
    from pg_roles
    where rolname = 'authenticator'
  loop
    if config_entry like 'pgrst.db_schemas=%' then
      db_schemas := substring(config_entry from 'pgrst.db_schemas=(.*)$');
    end if;
  end loop;

  cleaned := array_to_string(
    array(
      select distinct trim(part)
      from unnest(string_to_array(db_schemas, ',')) as part
      where trim(part) <> ''
        and lower(trim(part)) not in ('pg_pgrst_no_exposed_schemas', 'strain', 'strainverse')
        and exists (select 1 from pg_namespace n where n.nspname = trim(part))
    ),
    ','
  );

  if required_schema is not null
     and exists (select 1 from pg_namespace where nspname = required_schema)
     and not exists (
       select 1
       from unnest(string_to_array(cleaned, ',')) as existing(part)
       where trim(existing.part) = required_schema
     ) then
    cleaned := trim(both ',' from coalesce(nullif(cleaned, ''), 'public') || ',' || required_schema);
  end if;

  if cleaned is null or cleaned = '' then
    cleaned := 'public';
    if required_schema is not null and exists (select 1 from pg_namespace where nspname = required_schema) then
      cleaned := cleaned || ',' || required_schema;
    end if;
  end if;

  execute format('alter role authenticator set pgrst.db_schemas = %L', cleaned);
  perform pg_notify('pgrst', 'reload config');
  perform pg_notify('pgrst', 'reload schema');

  return cleaned;
end;
$$;

grant execute on function public.repair_postgrest_schemas(text) to authenticated, service_role;

-- Creates function above, then repairs exposed schemas (returns the new schema list)
select public.repair_postgrest_schemas('StrainVerse'::text) as postgrest_schemas;

notify pgrst, 'reload schema';
