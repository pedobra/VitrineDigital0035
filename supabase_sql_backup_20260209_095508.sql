--
-- PostgreSQL database dump
--

\restrict x1NfRcPp0mbluLRymn8Joa78tehW9FFzw12UnNcedIl8atMfzY8bKChZFzyWyn2

-- Dumped from database version 17.6
-- Dumped by pg_dump version 18.1

-- Started on 2026-02-09 09:55:08

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 38 (class 2615 OID 16494)
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- TOC entry 24 (class 2615 OID 16388)
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- TOC entry 36 (class 2615 OID 16574)
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- TOC entry 35 (class 2615 OID 16563)
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- TOC entry 13 (class 2615 OID 16386)
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- TOC entry 15 (class 2615 OID 16555)
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- TOC entry 39 (class 2615 OID 16542)
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- TOC entry 33 (class 2615 OID 16603)
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- TOC entry 6 (class 3079 OID 16639)
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- TOC entry 4309 (class 0 OID 0)
-- Dependencies: 6
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- TOC entry 2 (class 3079 OID 16389)
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- TOC entry 4310 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- TOC entry 4 (class 3079 OID 16443)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- TOC entry 4311 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 5 (class 3079 OID 16604)
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- TOC entry 4312 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- TOC entry 7 (class 3079 OID 17654)
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- TOC entry 4313 (class 0 OID 0)
-- Dependencies: 7
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- TOC entry 3 (class 3079 OID 16432)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- TOC entry 4314 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- TOC entry 1169 (class 1247 OID 16738)
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- TOC entry 1193 (class 1247 OID 16879)
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- TOC entry 1166 (class 1247 OID 16732)
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- TOC entry 1163 (class 1247 OID 16727)
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- TOC entry 1211 (class 1247 OID 16982)
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


ALTER TYPE auth.oauth_authorization_status OWNER TO supabase_auth_admin;

--
-- TOC entry 1223 (class 1247 OID 17055)
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


ALTER TYPE auth.oauth_client_type OWNER TO supabase_auth_admin;

--
-- TOC entry 1205 (class 1247 OID 16960)
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- TOC entry 1214 (class 1247 OID 16992)
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


ALTER TYPE auth.oauth_response_type OWNER TO supabase_auth_admin;

--
-- TOC entry 1199 (class 1247 OID 16921)
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- TOC entry 1241 (class 1247 OID 17122)
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- TOC entry 1232 (class 1247 OID 17082)
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- TOC entry 1235 (class 1247 OID 17097)
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- TOC entry 1247 (class 1247 OID 17164)
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- TOC entry 1244 (class 1247 OID 17135)
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- TOC entry 1268 (class 1247 OID 17334)
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS',
    'VECTOR'
);


ALTER TYPE storage.buckettype OWNER TO supabase_storage_admin;

--
-- TOC entry 446 (class 1255 OID 16540)
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- TOC entry 4315 (class 0 OID 0)
-- Dependencies: 446
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- TOC entry 465 (class 1255 OID 16709)
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- TOC entry 445 (class 1255 OID 16539)
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- TOC entry 4318 (class 0 OID 0)
-- Dependencies: 445
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- TOC entry 444 (class 1255 OID 16538)
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- TOC entry 4320 (class 0 OID 0)
-- Dependencies: 444
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- TOC entry 447 (class 1255 OID 16547)
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- TOC entry 4336 (class 0 OID 0)
-- Dependencies: 447
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- TOC entry 451 (class 1255 OID 16568)
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- TOC entry 4338 (class 0 OID 0)
-- Dependencies: 451
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- TOC entry 448 (class 1255 OID 16549)
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- TOC entry 4340 (class 0 OID 0)
-- Dependencies: 448
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- TOC entry 449 (class 1255 OID 16559)
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- TOC entry 450 (class 1255 OID 16560)
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- TOC entry 452 (class 1255 OID 16570)
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- TOC entry 4369 (class 0 OID 0)
-- Dependencies: 452
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- TOC entry 394 (class 1255 OID 16387)
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO ''
    AS $_$
  BEGIN
      RAISE DEBUG 'PgBouncer auth request: %', p_usename;

      RETURN QUERY
      SELECT
          rolname::text,
          CASE WHEN rolvaliduntil < now()
              THEN null
              ELSE rolpassword::text
          END
      FROM pg_authid
      WHERE rolname=$1 and rolcanlogin;
  END;
  $_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- TOC entry 515 (class 1255 OID 17664)
-- Name: garantir_uma_capa(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.garantir_uma_capa() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
  if new.is_capa = true then
    update imoveis_fotos
    set is_capa = false
    where imovel_id = new.imovel_id
      and id <> new.id;
  end if;

  return new;
end;
$$;


ALTER FUNCTION public.garantir_uma_capa() OWNER TO postgres;

--
-- TOC entry 508 (class 1255 OID 17651)
-- Name: gerar_codigo_imovel(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.gerar_codigo_imovel() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
  if new.codigo_imovel is null then
    new.codigo_imovel := to_char(now(), 'YYMMDDHH24MI');
  end if;
  return new;
end;
$$;


ALTER FUNCTION public.gerar_codigo_imovel() OWNER TO postgres;

--
-- TOC entry 509 (class 1255 OID 17653)
-- Name: gerar_slug_imovel(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.gerar_slug_imovel() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
  if new.slug is null or new.slug = '' then
    new.slug :=
      regexp_replace(
        lower(unaccent(new.titulo)),
        '[^a-z0-9]+',
        '-',
        'g'
      );
  end if;
  return new;
end;
$$;


ALTER FUNCTION public.gerar_slug_imovel() OWNER TO postgres;

--
-- TOC entry 514 (class 1255 OID 17662)
-- Name: limitar_fotos_imovel(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.limitar_fotos_imovel() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
  total_fotos integer;
begin
  select count(*) into total_fotos
  from imoveis_fotos
  where imovel_id = new.imovel_id;

  if total_fotos >= 15 then
    raise exception 'Limite máximo de 15 fotos por imóvel atingido';
  end if;

  return new;
end;
$$;


ALTER FUNCTION public.limitar_fotos_imovel() OWNER TO postgres;

--
-- TOC entry 516 (class 1255 OID 17667)
-- Name: limitar_imoveis_destaque(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.limitar_imoveis_destaque() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
  total integer;
begin
  if new.destaque = true then
    select count(*) into total
    from imoveis
    where destaque = true
      and id <> new.id
      and ativo = true;

    if total >= 6 then
      raise exception 'Limite máximo de imóveis em destaque atingido';
    end if;
  end if;

  return new;
end;
$$;


ALTER FUNCTION public.limitar_imoveis_destaque() OWNER TO postgres;

--
-- TOC entry 507 (class 1255 OID 17648)
-- Name: set_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.set_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
  new.updated_at = now();
  return new;
end;
$$;


ALTER FUNCTION public.set_updated_at() OWNER TO postgres;

--
-- TOC entry 471 (class 1255 OID 17157)
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_
        -- Filter by action early - only get subscriptions interested in this action
        -- action_filter column can be: '*' (all), 'INSERT', 'UPDATE', or 'DELETE'
        and (subs.action_filter = '*' or subs.action_filter = action::text);

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- TOC entry 506 (class 1255 OID 17464)
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- TOC entry 473 (class 1255 OID 17169)
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- TOC entry 469 (class 1255 OID 17119)
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- TOC entry 468 (class 1255 OID 17114)
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- TOC entry 472 (class 1255 OID 17165)
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- TOC entry 503 (class 1255 OID 17404)
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- TOC entry 467 (class 1255 OID 17113)
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- TOC entry 505 (class 1255 OID 17463)
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
  final_payload jsonb;
BEGIN
  BEGIN
    -- Generate a new UUID for the id
    generated_id := gen_random_uuid();

    -- Check if payload has an 'id' key, if not, add the generated UUID
    IF payload ? 'id' THEN
      final_payload := payload;
    ELSE
      final_payload := jsonb_set(payload, '{id}', to_jsonb(generated_id));
    END IF;

    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (id, payload, event, topic, private, extension)
    VALUES (generated_id, final_payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- TOC entry 466 (class 1255 OID 17111)
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- TOC entry 470 (class 1255 OID 17146)
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- TOC entry 504 (class 1255 OID 17457)
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- TOC entry 486 (class 1255 OID 17312)
-- Name: add_prefixes(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.add_prefixes(_bucket_id text, _name text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    prefixes text[];
BEGIN
    prefixes := "storage"."get_prefixes"("_name");

    IF array_length(prefixes, 1) > 0 THEN
        INSERT INTO storage.prefixes (name, bucket_id)
        SELECT UNNEST(prefixes) as name, "_bucket_id" ON CONFLICT DO NOTHING;
    END IF;
END;
$$;


ALTER FUNCTION storage.add_prefixes(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 479 (class 1255 OID 17237)
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- TOC entry 498 (class 1255 OID 17353)
-- Name: delete_leaf_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_rows_deleted integer;
BEGIN
    LOOP
        WITH candidates AS (
            SELECT DISTINCT
                t.bucket_id,
                unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        ),
        uniq AS (
             SELECT
                 bucket_id,
                 name,
                 storage.get_level(name) AS level
             FROM candidates
             WHERE name <> ''
             GROUP BY bucket_id, name
        ),
        leaf AS (
             SELECT
                 p.bucket_id,
                 p.name,
                 p.level
             FROM storage.prefixes AS p
                  JOIN uniq AS u
                       ON u.bucket_id = p.bucket_id
                           AND u.name = p.name
                           AND u.level = p.level
             WHERE NOT EXISTS (
                 SELECT 1
                 FROM storage.objects AS o
                 WHERE o.bucket_id = p.bucket_id
                   AND o.level = p.level + 1
                   AND o.name COLLATE "C" LIKE p.name || '/%'
             )
             AND NOT EXISTS (
                 SELECT 1
                 FROM storage.prefixes AS c
                 WHERE c.bucket_id = p.bucket_id
                   AND c.level = p.level + 1
                   AND c.name COLLATE "C" LIKE p.name || '/%'
             )
        )
        DELETE
        FROM storage.prefixes AS p
            USING leaf AS l
        WHERE p.bucket_id = l.bucket_id
          AND p.name = l.name
          AND p.level = l.level;

        GET DIAGNOSTICS v_rows_deleted = ROW_COUNT;
        EXIT WHEN v_rows_deleted = 0;
    END LOOP;
END;
$$;


ALTER FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- TOC entry 487 (class 1255 OID 17313)
-- Name: delete_prefix(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix(_bucket_id text, _name text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    -- Check if we can delete the prefix
    IF EXISTS(
        SELECT FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name") + 1
          AND "prefixes"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    )
    OR EXISTS(
        SELECT FROM "storage"."objects"
        WHERE "objects"."bucket_id" = "_bucket_id"
          AND "storage"."get_level"("objects"."name") = "storage"."get_level"("_name") + 1
          AND "objects"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    ) THEN
    -- There are sub-objects, skip deletion
    RETURN false;
    ELSE
        DELETE FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name")
          AND "prefixes"."name" = "_name";
        RETURN true;
    END IF;
END;
$$;


ALTER FUNCTION storage.delete_prefix(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 490 (class 1255 OID 17316)
-- Name: delete_prefix_hierarchy_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix_hierarchy_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    prefix text;
BEGIN
    prefix := "storage"."get_prefix"(OLD."name");

    IF coalesce(prefix, '') != '' THEN
        PERFORM "storage"."delete_prefix"(OLD."bucket_id", prefix);
    END IF;

    RETURN OLD;
END;
$$;


ALTER FUNCTION storage.delete_prefix_hierarchy_trigger() OWNER TO supabase_storage_admin;

--
-- TOC entry 495 (class 1255 OID 17331)
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


ALTER FUNCTION storage.enforce_bucket_name_length() OWNER TO supabase_storage_admin;

--
-- TOC entry 476 (class 1255 OID 17211)
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    SELECT string_to_array(name, '/') INTO _parts;
    SELECT _parts[array_length(_parts,1)] INTO _filename;
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 475 (class 1255 OID 17210)
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 474 (class 1255 OID 17209)
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 483 (class 1255 OID 17294)
-- Name: get_level(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_level(name text) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT array_length(string_to_array("name", '/'), 1);
$$;


ALTER FUNCTION storage.get_level(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 484 (class 1255 OID 17310)
-- Name: get_prefix(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefix(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT
    CASE WHEN strpos("name", '/') > 0 THEN
             regexp_replace("name", '[\/]{1}[^\/]+\/?$', '')
         ELSE
             ''
        END;
$_$;


ALTER FUNCTION storage.get_prefix(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 485 (class 1255 OID 17311)
-- Name: get_prefixes(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefixes(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
DECLARE
    parts text[];
    prefixes text[];
    prefix text;
BEGIN
    -- Split the name into parts by '/'
    parts := string_to_array("name", '/');
    prefixes := '{}';

    -- Construct the prefixes, stopping one level below the last part
    FOR i IN 1..array_length(parts, 1) - 1 LOOP
            prefix := array_to_string(parts[1:i], '/');
            prefixes := array_append(prefixes, prefix);
    END LOOP;

    RETURN prefixes;
END;
$$;


ALTER FUNCTION storage.get_prefixes(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 493 (class 1255 OID 17329)
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- TOC entry 481 (class 1255 OID 17276)
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- TOC entry 480 (class 1255 OID 17239)
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- TOC entry 497 (class 1255 OID 17352)
-- Name: lock_top_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket text;
    v_top text;
BEGIN
    FOR v_bucket, v_top IN
        SELECT DISTINCT t.bucket_id,
            split_part(t.name, '/', 1) AS top
        FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        WHERE t.name <> ''
        ORDER BY 1, 2
        LOOP
            PERFORM pg_advisory_xact_lock(hashtextextended(v_bucket || '/' || v_top, 0));
        END LOOP;
END;
$$;


ALTER FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- TOC entry 499 (class 1255 OID 17354)
-- Name: objects_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.objects_delete_cleanup() OWNER TO supabase_storage_admin;

--
-- TOC entry 489 (class 1255 OID 17315)
-- Name: objects_insert_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_insert_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    NEW.level := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_insert_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- TOC entry 500 (class 1255 OID 17355)
-- Name: objects_update_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    -- NEW - OLD (destinations to create prefixes for)
    v_add_bucket_ids text[];
    v_add_names      text[];

    -- OLD - NEW (sources to prune)
    v_src_bucket_ids text[];
    v_src_names      text[];
BEGIN
    IF TG_OP <> 'UPDATE' THEN
        RETURN NULL;
    END IF;

    -- 1) Compute NEW−OLD (added paths) and OLD−NEW (moved-away paths)
    WITH added AS (
        SELECT n.bucket_id, n.name
        FROM new_rows n
        WHERE n.name <> '' AND position('/' in n.name) > 0
        EXCEPT
        SELECT o.bucket_id, o.name FROM old_rows o WHERE o.name <> ''
    ),
    moved AS (
         SELECT o.bucket_id, o.name
         FROM old_rows o
         WHERE o.name <> ''
         EXCEPT
         SELECT n.bucket_id, n.name FROM new_rows n WHERE n.name <> ''
    )
    SELECT
        -- arrays for ADDED (dest) in stable order
        COALESCE( (SELECT array_agg(a.bucket_id ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        COALESCE( (SELECT array_agg(a.name      ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        -- arrays for MOVED (src) in stable order
        COALESCE( (SELECT array_agg(m.bucket_id ORDER BY m.bucket_id, m.name) FROM moved m), '{}' ),
        COALESCE( (SELECT array_agg(m.name      ORDER BY m.bucket_id, m.name) FROM moved m), '{}' )
    INTO v_add_bucket_ids, v_add_names, v_src_bucket_ids, v_src_names;

    -- Nothing to do?
    IF (array_length(v_add_bucket_ids, 1) IS NULL) AND (array_length(v_src_bucket_ids, 1) IS NULL) THEN
        RETURN NULL;
    END IF;

    -- 2) Take per-(bucket, top) locks: ALL prefixes in consistent global order to prevent deadlocks
    DECLARE
        v_all_bucket_ids text[];
        v_all_names text[];
    BEGIN
        -- Combine source and destination arrays for consistent lock ordering
        v_all_bucket_ids := COALESCE(v_src_bucket_ids, '{}') || COALESCE(v_add_bucket_ids, '{}');
        v_all_names := COALESCE(v_src_names, '{}') || COALESCE(v_add_names, '{}');

        -- Single lock call ensures consistent global ordering across all transactions
        IF array_length(v_all_bucket_ids, 1) IS NOT NULL THEN
            PERFORM storage.lock_top_prefixes(v_all_bucket_ids, v_all_names);
        END IF;
    END;

    -- 3) Create destination prefixes (NEW−OLD) BEFORE pruning sources
    IF array_length(v_add_bucket_ids, 1) IS NOT NULL THEN
        WITH candidates AS (
            SELECT DISTINCT t.bucket_id, unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(v_add_bucket_ids, v_add_names) AS t(bucket_id, name)
            WHERE name <> ''
        )
        INSERT INTO storage.prefixes (bucket_id, name)
        SELECT c.bucket_id, c.name
        FROM candidates c
        ON CONFLICT DO NOTHING;
    END IF;

    -- 4) Prune source prefixes bottom-up for OLD−NEW
    IF array_length(v_src_bucket_ids, 1) IS NOT NULL THEN
        -- re-entrancy guard so DELETE on prefixes won't recurse
        IF current_setting('storage.gc.prefixes', true) <> '1' THEN
            PERFORM set_config('storage.gc.prefixes', '1', true);
        END IF;

        PERFORM storage.delete_leaf_prefixes(v_src_bucket_ids, v_src_names);
    END IF;

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.objects_update_cleanup() OWNER TO supabase_storage_admin;

--
-- TOC entry 502 (class 1255 OID 17360)
-- Name: objects_update_level_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_level_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Set the new level
        NEW."level" := "storage"."get_level"(NEW."name");
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_level_trigger() OWNER TO supabase_storage_admin;

--
-- TOC entry 494 (class 1255 OID 17330)
-- Name: objects_update_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    old_prefixes TEXT[];
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Retrieve old prefixes
        old_prefixes := "storage"."get_prefixes"(OLD."name");

        -- Remove old prefixes that are only used by this object
        WITH all_prefixes as (
            SELECT unnest(old_prefixes) as prefix
        ),
        can_delete_prefixes as (
             SELECT prefix
             FROM all_prefixes
             WHERE NOT EXISTS (
                 SELECT 1 FROM "storage"."objects"
                 WHERE "bucket_id" = OLD."bucket_id"
                   AND "name" <> OLD."name"
                   AND "name" LIKE (prefix || '%')
             )
         )
        DELETE FROM "storage"."prefixes" WHERE name IN (SELECT prefix FROM can_delete_prefixes);

        -- Add new prefixes
        PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    END IF;
    -- Set the new level
    NEW."level" := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- TOC entry 482 (class 1255 OID 17293)
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- TOC entry 501 (class 1255 OID 17356)
-- Name: prefixes_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.prefixes_delete_cleanup() OWNER TO supabase_storage_admin;

--
-- TOC entry 488 (class 1255 OID 17314)
-- Name: prefixes_insert_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.prefixes_insert_trigger() OWNER TO supabase_storage_admin;

--
-- TOC entry 477 (class 1255 OID 17226)
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql
    AS $$
declare
    can_bypass_rls BOOLEAN;
begin
    SELECT rolbypassrls
    INTO can_bypass_rls
    FROM pg_roles
    WHERE rolname = coalesce(nullif(current_setting('role', true), 'none'), current_user);

    IF can_bypass_rls THEN
        RETURN QUERY SELECT * FROM storage.search_v1_optimised(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    ELSE
        RETURN QUERY SELECT * FROM storage.search_legacy_v1(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    END IF;
end;
$$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- TOC entry 492 (class 1255 OID 17327)
-- Name: search_legacy_v1(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select path_tokens[$1] as folder
           from storage.objects
             where objects.name ilike $2 || $3 || ''%''
               and bucket_id = $4
               and array_length(objects.path_tokens, 1) <> $1
           group by folder
           order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- TOC entry 491 (class 1255 OID 17326)
-- Name: search_v1_optimised(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select (string_to_array(name, ''/''))[level] as name
           from storage.prefixes
             where lower(prefixes.name) like lower($2 || $3) || ''%''
               and bucket_id = $4
               and level = $1
           order by name ' || v_sort_order || '
     )
     (select name,
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[level] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where lower(objects.name) like lower($2 || $3) || ''%''
       and bucket_id = $4
       and level = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- TOC entry 496 (class 1255 OID 17351)
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    sort_col text;
    sort_ord text;
    cursor_op text;
    cursor_expr text;
    sort_expr text;
BEGIN
    -- Validate sort_order
    sort_ord := lower(sort_order);
    IF sort_ord NOT IN ('asc', 'desc') THEN
        sort_ord := 'asc';
    END IF;

    -- Determine cursor comparison operator
    IF sort_ord = 'asc' THEN
        cursor_op := '>';
    ELSE
        cursor_op := '<';
    END IF;
    
    sort_col := lower(sort_column);
    -- Validate sort column  
    IF sort_col IN ('updated_at', 'created_at') THEN
        cursor_expr := format(
            '($5 = '''' OR ROW(date_trunc(''milliseconds'', %I), name COLLATE "C") %s ROW(COALESCE(NULLIF($6, '''')::timestamptz, ''epoch''::timestamptz), $5))',
            sort_col, cursor_op
        );
        sort_expr := format(
            'COALESCE(date_trunc(''milliseconds'', %I), ''epoch''::timestamptz) %s, name COLLATE "C" %s',
            sort_col, sort_ord, sort_ord
        );
    ELSE
        cursor_expr := format('($5 = '''' OR name COLLATE "C" %s $5)', cursor_op);
        sort_expr := format('name COLLATE "C" %s', sort_ord);
    END IF;

    RETURN QUERY EXECUTE format(
        $sql$
        SELECT * FROM (
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    NULL::uuid AS id,
                    updated_at,
                    created_at,
                    NULL::timestamptz AS last_accessed_at,
                    NULL::jsonb AS metadata
                FROM storage.prefixes
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
            UNION ALL
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    id,
                    updated_at,
                    created_at,
                    last_accessed_at,
                    metadata
                FROM storage.objects
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
        ) obj
        ORDER BY %s
        LIMIT $3
        $sql$,
        cursor_expr,    -- prefixes WHERE
        sort_expr,      -- prefixes ORDER BY
        cursor_expr,    -- objects WHERE
        sort_expr,      -- objects ORDER BY
        sort_expr       -- final ORDER BY
    )
    USING prefix, bucket_name, limits, levels, start_after, sort_column_after;
END;
$_$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text) OWNER TO supabase_storage_admin;

--
-- TOC entry 478 (class 1255 OID 17227)
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 333 (class 1259 OID 16525)
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- TOC entry 4409 (class 0 OID 0)
-- Dependencies: 333
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- TOC entry 347 (class 1259 OID 16883)
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text,
    code_challenge_method auth.code_challenge_method,
    code_challenge text,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone,
    invite_token text,
    referrer text,
    oauth_client_state_id uuid,
    linking_target_id uuid,
    email_optional boolean DEFAULT false NOT NULL
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- TOC entry 4411 (class 0 OID 0)
-- Dependencies: 347
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'Stores metadata for all OAuth/SSO login flows';


--
-- TOC entry 338 (class 1259 OID 16681)
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- TOC entry 4413 (class 0 OID 0)
-- Dependencies: 338
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- TOC entry 4414 (class 0 OID 0)
-- Dependencies: 338
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- TOC entry 332 (class 1259 OID 16518)
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- TOC entry 4416 (class 0 OID 0)
-- Dependencies: 332
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- TOC entry 342 (class 1259 OID 16770)
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- TOC entry 4418 (class 0 OID 0)
-- Dependencies: 342
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- TOC entry 341 (class 1259 OID 16758)
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- TOC entry 4420 (class 0 OID 0)
-- Dependencies: 341
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- TOC entry 340 (class 1259 OID 16745)
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid,
    last_webauthn_challenge_data jsonb
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- TOC entry 4422 (class 0 OID 0)
-- Dependencies: 340
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- TOC entry 4423 (class 0 OID 0)
-- Dependencies: 340
-- Name: COLUMN mfa_factors.last_webauthn_challenge_data; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.mfa_factors.last_webauthn_challenge_data IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- TOC entry 350 (class 1259 OID 16995)
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    nonce text,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_nonce_length CHECK ((char_length(nonce) <= 255)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


ALTER TABLE auth.oauth_authorizations OWNER TO supabase_auth_admin;

--
-- TOC entry 352 (class 1259 OID 17068)
-- Name: oauth_client_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_client_states (
    id uuid NOT NULL,
    provider_type text NOT NULL,
    code_verifier text,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE auth.oauth_client_states OWNER TO supabase_auth_admin;

--
-- TOC entry 4426 (class 0 OID 0)
-- Dependencies: 352
-- Name: TABLE oauth_client_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.oauth_client_states IS 'Stores OAuth states for third-party provider authentication flows where Supabase acts as the OAuth client.';


--
-- TOC entry 349 (class 1259 OID 16965)
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    token_endpoint_auth_method text NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048)),
    CONSTRAINT oauth_clients_token_endpoint_auth_method_check CHECK ((token_endpoint_auth_method = ANY (ARRAY['client_secret_basic'::text, 'client_secret_post'::text, 'none'::text])))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- TOC entry 351 (class 1259 OID 17028)
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


ALTER TABLE auth.oauth_consents OWNER TO supabase_auth_admin;

--
-- TOC entry 348 (class 1259 OID 16933)
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- TOC entry 331 (class 1259 OID 16507)
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- TOC entry 4431 (class 0 OID 0)
-- Dependencies: 331
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- TOC entry 330 (class 1259 OID 16506)
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- TOC entry 4433 (class 0 OID 0)
-- Dependencies: 330
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- TOC entry 345 (class 1259 OID 16812)
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- TOC entry 4435 (class 0 OID 0)
-- Dependencies: 345
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- TOC entry 346 (class 1259 OID 16830)
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- TOC entry 4437 (class 0 OID 0)
-- Dependencies: 346
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- TOC entry 334 (class 1259 OID 16533)
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- TOC entry 4439 (class 0 OID 0)
-- Dependencies: 334
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- TOC entry 339 (class 1259 OID 16711)
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid,
    refresh_token_hmac_key text,
    refresh_token_counter bigint,
    scopes text,
    CONSTRAINT sessions_scopes_length CHECK ((char_length(scopes) <= 4096))
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- TOC entry 4441 (class 0 OID 0)
-- Dependencies: 339
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- TOC entry 4442 (class 0 OID 0)
-- Dependencies: 339
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- TOC entry 4443 (class 0 OID 0)
-- Dependencies: 339
-- Name: COLUMN sessions.refresh_token_hmac_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_hmac_key IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- TOC entry 4444 (class 0 OID 0)
-- Dependencies: 339
-- Name: COLUMN sessions.refresh_token_counter; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_counter IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- TOC entry 344 (class 1259 OID 16797)
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- TOC entry 4446 (class 0 OID 0)
-- Dependencies: 344
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- TOC entry 343 (class 1259 OID 16788)
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- TOC entry 4448 (class 0 OID 0)
-- Dependencies: 343
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- TOC entry 4449 (class 0 OID 0)
-- Dependencies: 343
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- TOC entry 329 (class 1259 OID 16495)
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- TOC entry 4451 (class 0 OID 0)
-- Dependencies: 329
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- TOC entry 4452 (class 0 OID 0)
-- Dependencies: 329
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- TOC entry 381 (class 1259 OID 17639)
-- Name: configuracoes_fotos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.configuracoes_fotos (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    tipo character varying(50),
    url text NOT NULL,
    ordem integer,
    ativo boolean DEFAULT true
);


ALTER TABLE public.configuracoes_fotos OWNER TO postgres;

--
-- TOC entry 380 (class 1259 OID 17629)
-- Name: configuracoes_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.configuracoes_site (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    hero_titulo character varying(255),
    hero_subtitulo text,
    hero_cta_texto character varying(100),
    hero_cta_link text,
    header_logo_url text,
    header_whatsapp character varying(30),
    header_telefone character varying(30),
    sobre_titulo character varying(255),
    sobre_texto text,
    rodape_texto text,
    rodape_instagram text,
    rodape_facebook text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    header_nome_site character varying,
    header_mostrar_telefone boolean DEFAULT true,
    hero_bg_desktop_url text,
    hero_bg_mobile_url text,
    hero_overlay_opacity numeric(3,2) DEFAULT 0.55,
    hero_blur integer DEFAULT 12,
    hero_card_background character varying DEFAULT 'rgba(255,255,255,0.15)'::character varying,
    hero_card_blur integer DEFAULT 16,
    hero_card_shadow character varying DEFAULT '0 20px 40px rgba(0,0,0,0.25)'::character varying,
    home_titulo_oportunidades character varying,
    home_subtitulo_oportunidades text,
    tema_padrao character varying DEFAULT 'light'::character varying,
    cor_primaria character varying,
    cor_secundaria character varying,
    cor_fundo_claro character varying,
    cor_fundo_escuro character varying,
    cor_texto_claro character varying,
    cor_texto_escuro character varying,
    imovel_cta_texto character varying,
    imovel_cta_whatsapp character varying,
    color_scheme text,
    footer_titulo text,
    footer_bio text,
    footer_telefone character varying(20),
    footer_creci text,
    footer_instagram_url text,
    footer_tiktok_url text,
    footer_x_url text,
    footer_linkedin_url text,
    footer_copyright text,
    titulo_formulario_footer text,
    subtitulo_formulario_footer text,
    whatsapp_header text,
    whatsapp_floating text,
    whatsapp_imovel text,
    whatsapp_msg_header text,
    whatsapp_msg_floating text,
    whatsapp_msg_imovel text,
    logo_header text
);


ALTER TABLE public.configuracoes_site OWNER TO postgres;

--
-- TOC entry 369 (class 1259 OID 17489)
-- Name: imoveis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imoveis (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    codigo_imovel character varying(10) NOT NULL,
    referencia character varying(100),
    titulo character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    descricao text,
    tipo_imovel character varying(50),
    status_imovel character varying(50),
    valor_venda numeric(12,2),
    valor_locacao numeric(12,2),
    dormitorios integer,
    suites integer,
    banheiros integer,
    vagas_garagem integer,
    area_privativa numeric(10,2),
    area_total numeric(10,2),
    ativo boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    destaque boolean DEFAULT false,
    ordem_destaque integer,
    area_m2 numeric,
    bairro character varying,
    cidade character varying,
    uf character varying,
    caracteristicas_imovel text[],
    caracteristicas_condominio text[],
    opcoes_pagamento text[],
    garantias_locacao text[],
    finalidade text
);


ALTER TABLE public.imoveis OWNER TO postgres;

--
-- TOC entry 4458 (class 0 OID 0)
-- Dependencies: 369
-- Name: COLUMN imoveis.finalidade; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.imoveis.finalidade IS 'Finalidade do imóvel: Venda ou Aluguel';


--
-- TOC entry 373 (class 1259 OID 17547)
-- Name: imoveis_caracteristicas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imoveis_caracteristicas (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    nome character varying(100) NOT NULL,
    ativo boolean DEFAULT true
);


ALTER TABLE public.imoveis_caracteristicas OWNER TO postgres;

--
-- TOC entry 374 (class 1259 OID 17554)
-- Name: imoveis_caracteristicas_rel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imoveis_caracteristicas_rel (
    imovel_id uuid NOT NULL,
    caracteristica_id uuid NOT NULL
);


ALTER TABLE public.imoveis_caracteristicas_rel OWNER TO postgres;

--
-- TOC entry 375 (class 1259 OID 17569)
-- Name: imoveis_comodidades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imoveis_comodidades (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    nome character varying(100) NOT NULL,
    ativo boolean DEFAULT true
);


ALTER TABLE public.imoveis_comodidades OWNER TO postgres;

--
-- TOC entry 376 (class 1259 OID 17576)
-- Name: imoveis_comodidades_rel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imoveis_comodidades_rel (
    imovel_id uuid NOT NULL,
    comodidade_id uuid NOT NULL
);


ALTER TABLE public.imoveis_comodidades_rel OWNER TO postgres;

--
-- TOC entry 370 (class 1259 OID 17504)
-- Name: imoveis_fotos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imoveis_fotos (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    imovel_id uuid NOT NULL,
    url text NOT NULL,
    ordem integer NOT NULL,
    is_capa boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.imoveis_fotos OWNER TO postgres;

--
-- TOC entry 372 (class 1259 OID 17534)
-- Name: imoveis_informacoes_adicionais; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imoveis_informacoes_adicionais (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    imovel_id uuid NOT NULL,
    area_terreno numeric(10,2),
    valor_condominio numeric(10,2),
    valor_iptu numeric(10,2)
);


ALTER TABLE public.imoveis_informacoes_adicionais OWNER TO postgres;

--
-- TOC entry 371 (class 1259 OID 17519)
-- Name: imoveis_localizacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imoveis_localizacao (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    imovel_id uuid NOT NULL,
    estado character varying(2),
    cidade character varying(100),
    bairro character varying(100),
    rua character varying(150),
    numero character varying(20),
    complemento character varying(100),
    cep character varying(15),
    latitude numeric(10,7),
    longitude numeric(10,7)
);


ALTER TABLE public.imoveis_localizacao OWNER TO postgres;

--
-- TOC entry 378 (class 1259 OID 17600)
-- Name: imoveis_negociacao_opcoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imoveis_negociacao_opcoes (
    imovel_id uuid NOT NULL,
    negociacao_opcao_id uuid NOT NULL
);


ALTER TABLE public.imoveis_negociacao_opcoes OWNER TO postgres;

--
-- TOC entry 379 (class 1259 OID 17615)
-- Name: leads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.leads (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    nome character varying(100),
    telefone character varying(30),
    email character varying(150),
    mensagem text,
    origem character varying(50) NOT NULL,
    imovel_id uuid,
    pagina_origem text,
    created_at timestamp with time zone DEFAULT now(),
    imovel_interesse character varying(100)
);


ALTER TABLE public.leads OWNER TO postgres;

--
-- TOC entry 377 (class 1259 OID 17591)
-- Name: negociacao_opcoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.negociacao_opcoes (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    slug character varying(50) NOT NULL,
    nome character varying(100) NOT NULL,
    ativo boolean DEFAULT true
);


ALTER TABLE public.negociacao_opcoes OWNER TO postgres;

--
-- TOC entry 368 (class 1259 OID 17467)
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- TOC entry 353 (class 1259 OID 17076)
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- TOC entry 356 (class 1259 OID 17099)
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    action_filter text DEFAULT '*'::text,
    CONSTRAINT subscription_action_filter_check CHECK ((action_filter = ANY (ARRAY['*'::text, 'INSERT'::text, 'UPDATE'::text, 'DELETE'::text])))
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- TOC entry 355 (class 1259 OID 17098)
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 360 (class 1259 OID 17181)
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- TOC entry 4474 (class 0 OID 0)
-- Dependencies: 360
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- TOC entry 365 (class 1259 OID 17340)
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_analytics (
    name text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE storage.buckets_analytics OWNER TO supabase_storage_admin;

--
-- TOC entry 366 (class 1259 OID 17367)
-- Name: buckets_vectors; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_vectors (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'VECTOR'::storage.buckettype NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.buckets_vectors OWNER TO supabase_storage_admin;

--
-- TOC entry 359 (class 1259 OID 17173)
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- TOC entry 361 (class 1259 OID 17191)
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb,
    level integer
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- TOC entry 4478 (class 0 OID 0)
-- Dependencies: 361
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- TOC entry 364 (class 1259 OID 17295)
-- Name: prefixes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.prefixes (
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    level integer GENERATED ALWAYS AS (storage.get_level(name)) STORED NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE storage.prefixes OWNER TO supabase_storage_admin;

--
-- TOC entry 362 (class 1259 OID 17241)
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- TOC entry 363 (class 1259 OID 17255)
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- TOC entry 367 (class 1259 OID 17377)
-- Name: vector_indexes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.vector_indexes (
    id text DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    bucket_id text NOT NULL,
    data_type text NOT NULL,
    dimension integer NOT NULL,
    distance_metric text NOT NULL,
    metadata_configuration jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.vector_indexes OWNER TO supabase_storage_admin;

--
-- TOC entry 3726 (class 2604 OID 16510)
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- TOC entry 4256 (class 0 OID 16525)
-- Dependencies: 333
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- TOC entry 4267 (class 0 OID 16883)
-- Dependencies: 347
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at, invite_token, referrer, oauth_client_state_id, linking_target_id, email_optional) FROM stdin;
\.


--
-- TOC entry 4258 (class 0 OID 16681)
-- Dependencies: 338
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
a2205a76-3970-4a15-9553-1de0b89f7905	a2205a76-3970-4a15-9553-1de0b89f7905	{"sub": "a2205a76-3970-4a15-9553-1de0b89f7905", "email": "meu@meu.com", "email_verified": false, "phone_verified": false}	email	2026-02-04 12:58:16.252326+00	2026-02-04 12:58:16.252382+00	2026-02-04 12:58:16.252382+00	3b89e79b-e24a-49f3-af19-d992fd4bab86
\.


--
-- TOC entry 4255 (class 0 OID 16518)
-- Dependencies: 332
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4262 (class 0 OID 16770)
-- Dependencies: 342
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
8b737408-d9df-4369-8a25-838fba48f31a	2026-02-06 23:20:54.236064+00	2026-02-06 23:20:54.236064+00	password	60aa1805-5d16-42e7-b718-74085cacd7d2
994e9146-b2b0-48be-a969-7a866934d4ce	2026-02-07 13:49:41.773144+00	2026-02-07 13:49:41.773144+00	password	94d0e8cf-c768-46d6-9cff-57c3fbd54286
\.


--
-- TOC entry 4261 (class 0 OID 16758)
-- Dependencies: 341
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- TOC entry 4260 (class 0 OID 16745)
-- Dependencies: 340
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid, last_webauthn_challenge_data) FROM stdin;
\.


--
-- TOC entry 4270 (class 0 OID 16995)
-- Dependencies: 350
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at, nonce) FROM stdin;
\.


--
-- TOC entry 4272 (class 0 OID 17068)
-- Dependencies: 352
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_client_states (id, provider_type, code_verifier, created_at) FROM stdin;
\.


--
-- TOC entry 4269 (class 0 OID 16965)
-- Dependencies: 349
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type, token_endpoint_auth_method) FROM stdin;
\.


--
-- TOC entry 4271 (class 0 OID 17028)
-- Dependencies: 351
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- TOC entry 4268 (class 0 OID 16933)
-- Dependencies: 348
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4254 (class 0 OID 16507)
-- Dependencies: 331
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	71	nolrflggbfqi	a2205a76-3970-4a15-9553-1de0b89f7905	t	2026-02-07 13:49:41.745424+00	2026-02-07 18:43:35.109442+00	\N	994e9146-b2b0-48be-a969-7a866934d4ce
00000000-0000-0000-0000-000000000000	70	5pav6fryyhwx	a2205a76-3970-4a15-9553-1de0b89f7905	t	2026-02-06 23:20:54.215396+00	2026-02-08 03:07:10.326929+00	\N	8b737408-d9df-4369-8a25-838fba48f31a
00000000-0000-0000-0000-000000000000	73	6zcociwmug3u	a2205a76-3970-4a15-9553-1de0b89f7905	t	2026-02-08 03:07:10.35917+00	2026-02-08 04:37:12.102093+00	5pav6fryyhwx	8b737408-d9df-4369-8a25-838fba48f31a
00000000-0000-0000-0000-000000000000	74	2ephxzmazmcy	a2205a76-3970-4a15-9553-1de0b89f7905	f	2026-02-08 04:37:12.128572+00	2026-02-08 04:37:12.128572+00	6zcociwmug3u	8b737408-d9df-4369-8a25-838fba48f31a
00000000-0000-0000-0000-000000000000	72	kq5hum5zjahd	a2205a76-3970-4a15-9553-1de0b89f7905	t	2026-02-07 18:43:35.140967+00	2026-02-08 14:19:09.650792+00	nolrflggbfqi	994e9146-b2b0-48be-a969-7a866934d4ce
00000000-0000-0000-0000-000000000000	75	6gc637doh24r	a2205a76-3970-4a15-9553-1de0b89f7905	t	2026-02-08 14:19:09.670384+00	2026-02-08 18:02:45.739276+00	kq5hum5zjahd	994e9146-b2b0-48be-a969-7a866934d4ce
00000000-0000-0000-0000-000000000000	76	3vw3rzxba3ne	a2205a76-3970-4a15-9553-1de0b89f7905	f	2026-02-08 18:02:45.771621+00	2026-02-08 18:02:45.771621+00	6gc637doh24r	994e9146-b2b0-48be-a969-7a866934d4ce
\.


--
-- TOC entry 4265 (class 0 OID 16812)
-- Dependencies: 345
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- TOC entry 4266 (class 0 OID 16830)
-- Dependencies: 346
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- TOC entry 4257 (class 0 OID 16533)
-- Dependencies: 334
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
20250925093508
20251007112900
20251104100000
20251111201300
20251201000000
20260115000000
20260121000000
\.


--
-- TOC entry 4259 (class 0 OID 16711)
-- Dependencies: 339
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter, scopes) FROM stdin;
8b737408-d9df-4369-8a25-838fba48f31a	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 23:20:54.183859+00	2026-02-08 04:37:12.15405+00	\N	aal1	\N	2026-02-08 04:37:12.153921	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	177.37.143.129	\N	\N	\N	\N	\N
994e9146-b2b0-48be-a969-7a866934d4ce	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-07 13:49:41.713891+00	2026-02-08 18:02:45.803192+00	\N	aal1	\N	2026-02-08 18:02:45.803078	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36	177.51.4.148	\N	\N	\N	\N	\N
\.


--
-- TOC entry 4264 (class 0 OID 16797)
-- Dependencies: 344
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4263 (class 0 OID 16788)
-- Dependencies: 343
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- TOC entry 4252 (class 0 OID 16495)
-- Dependencies: 329
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	a2205a76-3970-4a15-9553-1de0b89f7905	authenticated	authenticated	meu@meu.com	$2a$10$d2AvR02AWH6rWWm1FwqpDewmX2DR/S/FIfDaJauhfxFuZIC40MNWO	2026-02-04 12:58:16.25862+00	\N		\N		\N			\N	2026-02-07 13:49:41.713789+00	{"provider": "email", "providers": ["email"]}	{"email_verified": true}	\N	2026-02-04 12:58:16.244375+00	2026-02-08 18:02:45.789849+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- TOC entry 4297 (class 0 OID 17639)
-- Dependencies: 381
-- Data for Name: configuracoes_fotos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configuracoes_fotos (id, tipo, url, ordem, ativo) FROM stdin;
\.


--
-- TOC entry 4296 (class 0 OID 17629)
-- Dependencies: 380
-- Data for Name: configuracoes_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configuracoes_site (id, hero_titulo, hero_subtitulo, hero_cta_texto, hero_cta_link, header_logo_url, header_whatsapp, header_telefone, sobre_titulo, sobre_texto, rodape_texto, rodape_instagram, rodape_facebook, created_at, updated_at, header_nome_site, header_mostrar_telefone, hero_bg_desktop_url, hero_bg_mobile_url, hero_overlay_opacity, hero_blur, hero_card_background, hero_card_blur, hero_card_shadow, home_titulo_oportunidades, home_subtitulo_oportunidades, tema_padrao, cor_primaria, cor_secundaria, cor_fundo_claro, cor_fundo_escuro, cor_texto_claro, cor_texto_escuro, imovel_cta_texto, imovel_cta_whatsapp, color_scheme, footer_titulo, footer_bio, footer_telefone, footer_creci, footer_instagram_url, footer_tiktok_url, footer_x_url, footer_linkedin_url, footer_copyright, titulo_formulario_footer, subtitulo_formulario_footer, whatsapp_header, whatsapp_floating, whatsapp_imovel, whatsapp_msg_header, whatsapp_msg_floating, whatsapp_msg_imovel, logo_header) FROM stdin;
5dbca9dc-c71d-4905-bdb9-de5ce02251af	Seu imóvel do jeito certo.	Encontre o imóvel ideal para você.	Buscar		\N	+5585999924721	\N	\N	\N	MARLOS SALES - CORRETOR DE IMÓVEIS - CRECI: 1111111111 - (83) 99999-9999	\N	\N	2026-02-04 12:13:04.573295+00	2026-02-08 03:12:51.113045+00	Marlon Sales	t	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/assets/hero_bd937261-2560-448f-8619-20b51fabd9dc.webp	\N	0.55	12	rgba(255,255,255,0.15)	16	0 20px 40px rgba(0,0,0,0.25)	Oportunidades Exclusivas.	Aprecie nossa vitrine.	light	\N	\N	\N	\N	\N	\N	Agendar uma Visita.	+5585999924721	carbon-black	Marlon Sales	Marlon Sales é o corretor de imóveis que une expertise estratégica a um atendimento dinâmico e humano, transformando a complexa jornada imobiliária em uma experiência de sucesso. Focado em entender as necessidades individuais de cada cliente, ele utiliza seu profundo conhecimento de mercado para conectar pessoas a oportunidades únicas, garantindo não apenas um bom negócio, mas a realização de um importante projeto de vida.\n\n\n\n	8332210008	CRECI: 4567891011	https://www.instagram.com/@marlonmarlonmarlon	https://www.instagram.com/@marlonmarlonmarlon	\N	https://www.instagram.com/@marlonmarlonmarlon	© Marlon Sales - Todos os direitos reservados	Não encontrou seu imóvel? / Quer vender seu imóvel?	Deixe-nos uma mensagem, nós retornaremos.	85999924721	85999924721	85999924721	\N	\N	\N	\N
\.


--
-- TOC entry 4285 (class 0 OID 17489)
-- Dependencies: 369
-- Data for Name: imoveis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imoveis (id, codigo_imovel, referencia, titulo, slug, descricao, tipo_imovel, status_imovel, valor_venda, valor_locacao, dormitorios, suites, banheiros, vagas_garagem, area_privativa, area_total, ativo, created_at, updated_at, destaque, ordem_destaque, area_m2, bairro, cidade, uf, caracteristicas_imovel, caracteristicas_condominio, opcoes_pagamento, garantias_locacao, finalidade) FROM stdin;
a0255084-11c7-4064-8615-05f43c3c0b65	2602041203	CS-002	Flat	flat	Excelente estado, pronto para morar	apartamento	ativo	\N	1600.00	3	2	3	2	150.00	150.00	t	2026-02-04 15:04:57.538+00	2026-02-06 20:39:17.240097+00	f	\N	150	Bessa	João Pessoa	PB	{"Área de serviço","Ar condicionado","Sala de estar","Armário na cozinha","Armário no quarto","WC serviço","Quarto de empregada",Nascente,"Pé-direito alto","Energia solar",Jardim,Quintal,"Caixa d’água","Escritório / Home office",Closet,Lavabo,"Tela na varanda","Varanda na sala",Cisterna,"Dependência de empregada","Rua asfaltada","Piscina privativa",Churrasqueira,"Sala de jantar","Sala de visita",Varanda,"Box no banheiro","Armários projetados"}	{"Poço artesiano","Espaço gourmet","Acessível para deficientes",Brinquedoteca,Coworking,"Mercado interno",Gerador,Elevador,"Salão de festas","Rua asfaltada (condomínio)","Condomínio fechado",Playground,"Piscina (condomínio)","Portaria 24h",Guarita,"Portão eletrônico","Quadra poliesportiva (condomínio)",Academia,"Pet place","Campo de futebol (condomínio)",Bicicletário}	{fgts,permuta,carta_credito,financiamento}	{fiador,caucao}	Aluguel
5ba23056-8710-479f-b37b-1f1596a35ddb	2602041941	CS-003	Apartamento 5º Andar	apartamento-5-andar	Excelente Perfeito	apartamento	ativo	850000.00	\N	5	2	3	2	165.00	165.00	t	2026-02-04 22:41:22.021538+00	2026-02-06 20:36:56.957987+00	f	\N	165	Madalena	Recife	PE	{"Área de serviço","Ar condicionado","Armário na cozinha","Armário no quarto","WC serviço","Quarto de empregada",Nascente,"Pé-direito alto","Energia solar",Jardim,Quintal,"Caixa d’água","Varanda na sala","Escritório / Home office","Sala de estar","Sala de jantar",Churrasqueira,"Piscina privativa","Dependência de empregada","Armários projetados","Box no banheiro","Sala de visita",Varanda,Lavabo,Closet,"Tela na varanda","Rua asfaltada"}	{"Poço artesiano","Espaço gourmet","Acessível para deficientes",Brinquedoteca,Coworking,"Mercado interno","Portaria 24h",Guarita,"Portão eletrônico",Gerador,Bicicletário,"Campo de futebol (condomínio)","Pet place","Quadra poliesportiva (condomínio)",Academia}	{fgts,financiamento,carta_credito,permuta}	{fiador,caucao}	Venda
ece781bd-da12-455a-a75b-852ca243fc0e	2602041943	CS-001	Apartamento	apartamento	Excelente Perfeito	apartamento	ativo	\N	1750.00	3	2	3	2	63.00	63.00	t	2026-02-04 22:43:51.095202+00	2026-02-06 20:32:40.292312+00	t	\N	63	Bessa	João Pessoa	PB	{"Área de serviço","Ar condicionado","Sala de estar","Armário na cozinha","Armário no quarto","WC serviço","Quarto de empregada",Nascente,"Pé-direito alto","Energia solar",Jardim,Quintal,"Caixa d’água"}	{"Poço artesiano","Espaço gourmet","Acessível para deficientes",Brinquedoteca,Coworking,"Mercado interno"}	{fgts,permuta}	{fiador,caucao}	Aluguel
0a8b3af9-366d-4a82-a85c-987da532e01b	2602041939	CS-001	Casa Duplex	casa-duplex	Casa a menos de 200 metros do mar	casa	ativo	2500000.00	\N	8	4	6	10	690.00	690.00	t	2026-02-04 22:39:17.424334+00	2026-02-06 21:45:25.771579+00	t	\N	690	Intermares	Cabedelo	PB	{"Área de serviço","Ar condicionado","Sala de estar","Armário na cozinha","Armário no quarto","WC serviço","Quarto de empregada",Nascente,"Pé-direito alto","Energia solar",Jardim,Quintal,"Caixa d’água","Armários projetados",Churrasqueira,"Sala de jantar","Sala de visita",Varanda,"Varanda na sala","Tela na varanda","Escritório / Home office",Closet,Lavabo,Cisterna,"Dependência de empregada","Box no banheiro","Piscina privativa","Rua asfaltada"}	{"Poço artesiano","Espaço gourmet","Acessível para deficientes",Brinquedoteca,Coworking,"Mercado interno",Guarita,"Quadra poliesportiva (condomínio)",Gerador,"Salão de festas","Condomínio fechado"}	{fgts,financiamento,carta_credito,permuta}	{fiador,caucao}	Venda
\.


--
-- TOC entry 4289 (class 0 OID 17547)
-- Dependencies: 373
-- Data for Name: imoveis_caracteristicas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imoveis_caracteristicas (id, nome, ativo) FROM stdin;
\.


--
-- TOC entry 4290 (class 0 OID 17554)
-- Dependencies: 374
-- Data for Name: imoveis_caracteristicas_rel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imoveis_caracteristicas_rel (imovel_id, caracteristica_id) FROM stdin;
\.


--
-- TOC entry 4291 (class 0 OID 17569)
-- Dependencies: 375
-- Data for Name: imoveis_comodidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imoveis_comodidades (id, nome, ativo) FROM stdin;
\.


--
-- TOC entry 4292 (class 0 OID 17576)
-- Dependencies: 376
-- Data for Name: imoveis_comodidades_rel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imoveis_comodidades_rel (imovel_id, comodidade_id) FROM stdin;
\.


--
-- TOC entry 4286 (class 0 OID 17504)
-- Dependencies: 370
-- Data for Name: imoveis_fotos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imoveis_fotos (id, imovel_id, url, ordem, is_capa, created_at) FROM stdin;
76c9f261-f5be-4820-8502-ba8af8a016c2	ece781bd-da12-455a-a75b-852ca243fc0e	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/ece781bd-da12-455a-a75b-852ca243fc0e/f162e207-5428-46ed-a824-e7193d746214.webp	0	t	2026-02-06 20:32:41.446709+00
1f38f364-93a7-4f17-9f1b-2063c7c46295	ece781bd-da12-455a-a75b-852ca243fc0e	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/ece781bd-da12-455a-a75b-852ca243fc0e/c75a71be-7a64-41c8-8a7e-c6beb2de9a69.webp	1	f	2026-02-06 20:32:42.010903+00
1bda2b17-5116-4ac5-8e37-61a55673f6d1	ece781bd-da12-455a-a75b-852ca243fc0e	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/ece781bd-da12-455a-a75b-852ca243fc0e/9c1d9a65-3f84-4e40-bdb9-787eb6b5127f.webp	2	f	2026-02-06 20:32:42.552408+00
e39caa2f-12b4-4fc2-aec5-533da576dc41	ece781bd-da12-455a-a75b-852ca243fc0e	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/ece781bd-da12-455a-a75b-852ca243fc0e/ffe5d3eb-bd82-4814-92f5-f411b48c68e2.webp	3	f	2026-02-06 20:32:43.112988+00
fb88a8b9-cdc8-4961-8b82-8991ecb462e7	ece781bd-da12-455a-a75b-852ca243fc0e	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/ece781bd-da12-455a-a75b-852ca243fc0e/623131d3-1d64-4464-8193-13a1f2cb7fcc.webp	4	f	2026-02-06 20:32:43.72354+00
a794ba26-9758-4430-9a47-1e3b3bc223e5	a0255084-11c7-4064-8615-05f43c3c0b65	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/a0255084-11c7-4064-8615-05f43c3c0b65/2a644676-5ac2-4ea5-b9ea-d6982a475f37.webp	0	t	2026-02-06 20:35:18.153925+00
56a9ac49-1232-499f-9a21-fe8436887212	a0255084-11c7-4064-8615-05f43c3c0b65	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/a0255084-11c7-4064-8615-05f43c3c0b65/cadde145-73da-479f-b79a-34b3d10696c6.webp	1	f	2026-02-06 20:35:18.699825+00
c3bd2403-6ab9-4400-88d2-89479361330a	a0255084-11c7-4064-8615-05f43c3c0b65	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/a0255084-11c7-4064-8615-05f43c3c0b65/ff904554-7811-4ac8-894d-44d73797b6af.webp	2	f	2026-02-06 20:35:19.267235+00
3817b111-72e9-412a-9d56-ee47d2bbc50e	a0255084-11c7-4064-8615-05f43c3c0b65	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/a0255084-11c7-4064-8615-05f43c3c0b65/4a55d484-2f3b-475a-bea8-3e2f45d4f8bb.webp	3	f	2026-02-06 20:35:19.839227+00
e427d33d-0ba9-44a2-9aaf-0aae11c1a9e6	a0255084-11c7-4064-8615-05f43c3c0b65	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/a0255084-11c7-4064-8615-05f43c3c0b65/4ae4aa3a-8a5d-4178-9df8-77d99d218cbf.webp	4	f	2026-02-06 20:35:20.396616+00
94bf0671-4b1c-4fce-947f-8abbc1c22ec2	5ba23056-8710-479f-b37b-1f1596a35ddb	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/5ba23056-8710-479f-b37b-1f1596a35ddb/291ffc85-090d-4b63-9f40-7eab3e2b10a4.webp	0	t	2026-02-06 20:36:58.20723+00
cb2d226a-3a33-4e25-8871-499e9f8acc1c	5ba23056-8710-479f-b37b-1f1596a35ddb	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/5ba23056-8710-479f-b37b-1f1596a35ddb/6f004d5b-ad68-41ea-9c74-53d1a6fe5e81.webp	1	f	2026-02-06 20:36:58.792749+00
d6b7af29-0340-4807-b6f8-0a5a60b1b349	5ba23056-8710-479f-b37b-1f1596a35ddb	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/5ba23056-8710-479f-b37b-1f1596a35ddb/24752978-bf96-4e71-8382-e951abbc89ae.webp	2	f	2026-02-06 20:36:59.401896+00
8ea85bc9-22c4-421e-bdd5-3c052b381bcb	5ba23056-8710-479f-b37b-1f1596a35ddb	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/5ba23056-8710-479f-b37b-1f1596a35ddb/9b4f1393-1f89-4048-a15d-87cdee9a6773.webp	3	f	2026-02-06 20:36:59.950655+00
a0c7bc92-dfee-495e-9368-861022f04567	5ba23056-8710-479f-b37b-1f1596a35ddb	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/5ba23056-8710-479f-b37b-1f1596a35ddb/138ab27d-a60d-4a7d-b462-f8882e8e56af.webp	4	f	2026-02-06 20:37:00.507886+00
66791ac3-bee3-4bc1-b0dc-6254ebafd119	0a8b3af9-366d-4a82-a85c-987da532e01b	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/0a8b3af9-366d-4a82-a85c-987da532e01b/bfc4dde5-6884-40e4-8c8e-e3a648055ffc.webp	0	t	2026-02-06 20:38:56.837897+00
a60b0083-7195-4f4f-b2f8-f3fb06ad69e3	0a8b3af9-366d-4a82-a85c-987da532e01b	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/0a8b3af9-366d-4a82-a85c-987da532e01b/b6e38372-60c9-4154-af77-40fc9a930f94.webp	1	f	2026-02-06 20:38:57.370695+00
a089dc5f-ca6c-475a-8bae-42b77f2027ed	0a8b3af9-366d-4a82-a85c-987da532e01b	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/0a8b3af9-366d-4a82-a85c-987da532e01b/e3f4874a-563a-47cb-ba0b-7f0a61403e8a.webp	2	f	2026-02-06 20:38:57.921657+00
4fc0d740-dc83-416e-801d-2fa9fa8ac55f	0a8b3af9-366d-4a82-a85c-987da532e01b	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/0a8b3af9-366d-4a82-a85c-987da532e01b/fd455a90-2504-4732-b93a-a8ab5af22544.webp	3	f	2026-02-06 20:38:58.467189+00
6a138222-c56c-42f9-b64a-937c46311043	0a8b3af9-366d-4a82-a85c-987da532e01b	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/0a8b3af9-366d-4a82-a85c-987da532e01b/6b459d86-9594-4cd3-a81c-2279e79b5d38.webp	4	f	2026-02-06 20:38:59.021241+00
949262ef-1772-49b2-81cf-8a3096824ab0	0a8b3af9-366d-4a82-a85c-987da532e01b	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/0a8b3af9-366d-4a82-a85c-987da532e01b/3b9b48ad-bb3b-45db-91ac-4258eb0b42a0.webp	5	f	2026-02-06 20:38:59.602259+00
d09f47e2-4102-4292-b245-368531d9f815	0a8b3af9-366d-4a82-a85c-987da532e01b	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/0a8b3af9-366d-4a82-a85c-987da532e01b/1b5e55d4-2b7d-4ced-baa3-4ec42c5c14bf.webp	6	f	2026-02-06 20:39:00.118682+00
5b2a7ade-1e69-42d5-8303-6a9bd83c3afe	0a8b3af9-366d-4a82-a85c-987da532e01b	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/0a8b3af9-366d-4a82-a85c-987da532e01b/51154a7c-9798-4667-96a2-324618282996.webp	7	f	2026-02-06 20:39:00.700643+00
7c37d190-3f7e-423d-80b6-7a7c11f5e340	0a8b3af9-366d-4a82-a85c-987da532e01b	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/0a8b3af9-366d-4a82-a85c-987da532e01b/582bc1a9-2c28-46c3-81be-fefa12ca245b.webp	8	f	2026-02-06 20:39:01.237792+00
3f3cec8f-b37f-4378-b190-9602a2198a87	0a8b3af9-366d-4a82-a85c-987da532e01b	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/0a8b3af9-366d-4a82-a85c-987da532e01b/5cc66b39-a4b5-49e2-be48-9cf246aa752d.webp	9	f	2026-02-06 20:39:01.908716+00
4ce727d8-246f-437d-8a0c-c4f4c0a7330b	0a8b3af9-366d-4a82-a85c-987da532e01b	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/0a8b3af9-366d-4a82-a85c-987da532e01b/d4e984e1-ffba-4439-be41-b6a9cfb121e3.webp	10	f	2026-02-06 20:39:02.569868+00
6641cd55-8a3d-45bc-a662-93582290671a	0a8b3af9-366d-4a82-a85c-987da532e01b	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/0a8b3af9-366d-4a82-a85c-987da532e01b/366c9bc0-e646-4727-8d8d-540aadf33f1e.webp	11	f	2026-02-06 20:39:03.68159+00
1b184951-eeed-4a39-b076-a9881a723615	0a8b3af9-366d-4a82-a85c-987da532e01b	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/0a8b3af9-366d-4a82-a85c-987da532e01b/b5e9e88f-1190-4e29-8752-53fdc3d822f2.webp	12	f	2026-02-06 20:39:04.214998+00
305ca3c1-4b1e-4ac7-a5c1-80a2ba833887	0a8b3af9-366d-4a82-a85c-987da532e01b	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/0a8b3af9-366d-4a82-a85c-987da532e01b/d7a34f86-f3eb-47df-96d7-21a936505d96.webp	13	f	2026-02-06 20:39:04.810994+00
dab125ef-094e-4519-95d0-4d5266af19e0	0a8b3af9-366d-4a82-a85c-987da532e01b	https://urcrpzbxxomluvyxucvj.supabase.co/storage/v1/object/public/imoveis/0a8b3af9-366d-4a82-a85c-987da532e01b/57f06661-c5ac-4241-80ec-4c12e8027292.webp	14	f	2026-02-06 20:39:05.398174+00
\.


--
-- TOC entry 4288 (class 0 OID 17534)
-- Dependencies: 372
-- Data for Name: imoveis_informacoes_adicionais; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imoveis_informacoes_adicionais (id, imovel_id, area_terreno, valor_condominio, valor_iptu) FROM stdin;
\.


--
-- TOC entry 4287 (class 0 OID 17519)
-- Dependencies: 371
-- Data for Name: imoveis_localizacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imoveis_localizacao (id, imovel_id, estado, cidade, bairro, rua, numero, complemento, cep, latitude, longitude) FROM stdin;
\.


--
-- TOC entry 4294 (class 0 OID 17600)
-- Dependencies: 378
-- Data for Name: imoveis_negociacao_opcoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imoveis_negociacao_opcoes (imovel_id, negociacao_opcao_id) FROM stdin;
\.


--
-- TOC entry 4295 (class 0 OID 17615)
-- Dependencies: 379
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.leads (id, nome, telefone, email, mensagem, origem, imovel_id, pagina_origem, created_at, imovel_interesse) FROM stdin;
4801a6e5-80ce-47e7-bc11-4b3753c5ebf5	Pedro	(81) 98888-8888	\N	\N	pagina	\N	\N	2026-02-06 04:32:58.03+00	Interesse Geral (Captura Automática)
3676799e-45fc-4c46-8bef-a5e2f773b80e	João	(81) 98888-7777	joao@joao.com	Quero um imóvel	Footer - Imóvel desejado	\N	\N	2026-02-06 05:41:07.2+00	Busca personalizada (Footer)
db5efdf1-81d3-44ee-99f7-b80fa59d7e37	miguel	(81) 97777-6666	miguel@miguel.com	Quero um apartamento	Footer - Imóvel desejado	\N	\N	2026-02-06 05:42:45.728+00	Busca personalizada (Footer)
7a320c45-25c0-4769-ab56-ffa13c16d5d6	Pedro Henrique	(85) 91111-2222	pedro@pedro.com	Quero uma casa	Footer - Imóvel desejado	\N	\N	2026-02-06 05:52:16.149+00	Busca personalizada (Footer)
cda049c1-1d5f-4d9a-a9bf-c5fe02c10c22	Guga	(81) 2322-2212	guga@guga.com	Teste	Footer - Busca Personalizada	\N	\N	2026-02-06 06:05:26.897+00	Footer
e0984e20-a2d4-4adc-ab55-b6ed14316a71	Maria	(85) 9988-7441	\N	\N	popup	\N	\N	2026-02-06 13:59:37.833+00	Interesse via Popup Inteligente
e6da9ae6-cea8-45b8-b4bd-050524430749	Paulo	(85) 95555-1111	Paulo@paulo.com	Quero imóvel	footer	\N	\N	2026-02-06 18:48:43.293+00	Footer
b9a984f1-7aaf-43b6-83f4-23ce879003df	Fernando	(85) 93333-3333	fernando@fernando.com	Testando	footer - Buscar Imóvel	\N	\N	2026-02-06 19:14:32.802+00	Buscar Imóvel
11f8f862-9126-4052-b520-e84268cba13e	Lucas	(85) 99998-8888	\N	\N	popup	\N	\N	2026-02-06 19:54:26.376+00	Interesse via Popup Inteligente
6a51b630-8926-4358-970a-dd54c112edcc	Gabriel Marques Fialho 	85982272814	\N	\N	pagina	\N	\N	2026-02-06 22:32:01.444+00	Interesse Geral
4f3ab10c-0597-48ba-b2f4-3c042ce09413	Gabriel Marques Fialho 	(85) 98227-2814	gabrielmarqfialho33@gmail.com	Apartamento 	footer - Buscar Imóvel	\N	\N	2026-02-06 22:35:25.054+00	Buscar Imóvel
850d1b1c-8942-4c9a-be29-a0f37910ccd1	Diogenes	81996872598	\N	\N	pagina	\N	\N	2026-02-07 18:48:52.108+00	Interesse Geral
\.


--
-- TOC entry 4293 (class 0 OID 17591)
-- Dependencies: 377
-- Data for Name: negociacao_opcoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.negociacao_opcoes (id, slug, nome, ativo) FROM stdin;
361adb27-c519-4b3c-887a-63c5bc5a28d6	financiamento	Financiamento	t
aca5b426-ea77-481a-8223-7f6d735714fd	fgts	FGTS	t
9c6e5459-5030-4b07-a53e-8ab113ccb6e6	carta_credito	Carta de Crédito	t
6793c042-2b85-4644-bade-cc31d718d3a5	permuta	Permuta	t
bdcb3d03-1b70-4a96-9f07-1ffe4e9277ae	fiador	Fiador	t
e7bc5725-04ee-43fc-87d5-babcef9cf3c8	caucao	Caução	t
\.


--
-- TOC entry 4273 (class 0 OID 17076)
-- Dependencies: 353
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2026-02-04 07:48:46
20211116045059	2026-02-04 07:48:46
20211116050929	2026-02-04 07:48:46
20211116051442	2026-02-04 07:48:46
20211116212300	2026-02-04 07:48:47
20211116213355	2026-02-04 07:48:47
20211116213934	2026-02-04 07:48:47
20211116214523	2026-02-04 07:48:47
20211122062447	2026-02-04 07:48:48
20211124070109	2026-02-04 07:48:48
20211202204204	2026-02-04 07:48:48
20211202204605	2026-02-04 07:48:48
20211210212804	2026-02-04 07:48:49
20211228014915	2026-02-04 07:48:49
20220107221237	2026-02-04 07:48:49
20220228202821	2026-02-04 07:48:49
20220312004840	2026-02-04 07:48:50
20220603231003	2026-02-04 07:48:50
20220603232444	2026-02-04 07:48:50
20220615214548	2026-02-04 07:48:50
20220712093339	2026-02-04 07:48:50
20220908172859	2026-02-04 07:48:51
20220916233421	2026-02-04 07:48:51
20230119133233	2026-02-04 07:48:51
20230128025114	2026-02-04 07:48:51
20230128025212	2026-02-04 07:48:52
20230227211149	2026-02-04 07:48:52
20230228184745	2026-02-04 07:48:52
20230308225145	2026-02-04 07:48:52
20230328144023	2026-02-04 07:48:52
20231018144023	2026-02-04 07:48:53
20231204144023	2026-02-04 07:48:53
20231204144024	2026-02-04 07:48:53
20231204144025	2026-02-04 07:48:53
20240108234812	2026-02-04 07:48:53
20240109165339	2026-02-04 07:48:54
20240227174441	2026-02-04 07:48:54
20240311171622	2026-02-04 07:48:54
20240321100241	2026-02-04 07:48:55
20240401105812	2026-02-04 07:48:55
20240418121054	2026-02-04 07:48:55
20240523004032	2026-02-04 07:48:56
20240618124746	2026-02-04 07:48:56
20240801235015	2026-02-04 07:48:57
20240805133720	2026-02-04 07:48:57
20240827160934	2026-02-04 07:48:57
20240919163303	2026-02-04 07:48:57
20240919163305	2026-02-04 07:48:57
20241019105805	2026-02-04 07:48:58
20241030150047	2026-02-04 07:48:58
20241108114728	2026-02-04 07:48:59
20241121104152	2026-02-04 07:48:59
20241130184212	2026-02-04 07:48:59
20241220035512	2026-02-04 07:48:59
20241220123912	2026-02-04 07:48:59
20241224161212	2026-02-04 07:49:00
20250107150512	2026-02-04 07:49:00
20250110162412	2026-02-04 07:49:00
20250123174212	2026-02-04 07:49:00
20250128220012	2026-02-04 07:49:00
20250506224012	2026-02-04 07:49:01
20250523164012	2026-02-04 07:49:01
20250714121412	2026-02-04 07:49:01
20250905041441	2026-02-04 07:49:01
20251103001201	2026-02-04 07:49:01
20251120212548	2026-02-04 07:49:02
20251120215549	2026-02-04 07:49:02
\.


--
-- TOC entry 4275 (class 0 OID 17099)
-- Dependencies: 356
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at, action_filter) FROM stdin;
\.


--
-- TOC entry 4277 (class 0 OID 17181)
-- Dependencies: 360
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
imoveis	imoveis	\N	2026-02-04 14:24:38.951986+00	2026-02-04 14:24:38.951986+00	t	f	\N	\N	\N	STANDARD
assets	assets	\N	2026-02-05 01:03:51.579792+00	2026-02-05 01:03:51.579792+00	t	f	\N	\N	\N	STANDARD
\.


--
-- TOC entry 4282 (class 0 OID 17340)
-- Dependencies: 365
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_analytics (name, type, format, created_at, updated_at, id, deleted_at) FROM stdin;
\.


--
-- TOC entry 4283 (class 0 OID 17367)
-- Dependencies: 366
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_vectors (id, type, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4276 (class 0 OID 17173)
-- Dependencies: 359
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2026-02-04 07:48:51.86699
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2026-02-04 07:48:51.872194
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2026-02-04 07:48:51.877296
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2026-02-04 07:48:51.891255
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2026-02-04 07:48:51.897413
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2026-02-04 07:48:51.900017
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2026-02-04 07:48:51.903132
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2026-02-04 07:48:51.906768
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2026-02-04 07:48:51.910568
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2026-02-04 07:48:51.913687
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2026-02-04 07:48:51.916699
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2026-02-04 07:48:51.920036
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2026-02-04 07:48:51.923236
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2026-02-04 07:48:51.927277
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2026-02-04 07:48:51.930371
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2026-02-04 07:48:51.951749
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2026-02-04 07:48:51.956484
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2026-02-04 07:48:51.961123
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2026-02-04 07:48:51.964393
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2026-02-04 07:48:51.96959
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2026-02-04 07:48:51.972773
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2026-02-04 07:48:51.97783
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2026-02-04 07:48:51.988179
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2026-02-04 07:48:51.997871
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2026-02-04 07:48:52.000881
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2026-02-04 07:48:52.003795
26	objects-prefixes	ef3f7871121cdc47a65308e6702519e853422ae2	2026-02-04 07:48:52.007113
27	search-v2	33b8f2a7ae53105f028e13e9fcda9dc4f356b4a2	2026-02-04 07:48:52.016304
28	object-bucket-name-sorting	ba85ec41b62c6a30a3f136788227ee47f311c436	2026-02-04 07:48:52.056686
29	create-prefixes	a7b1a22c0dc3ab630e3055bfec7ce7d2045c5b7b	2026-02-04 07:48:52.06283
30	update-object-levels	6c6f6cc9430d570f26284a24cf7b210599032db7	2026-02-04 07:48:52.067898
31	objects-level-index	33f1fef7ec7fea08bb892222f4f0f5d79bab5eb8	2026-02-04 07:48:52.07396
32	backward-compatible-index-on-objects	2d51eeb437a96868b36fcdfb1ddefdf13bef1647	2026-02-04 07:48:52.080543
33	backward-compatible-index-on-prefixes	fe473390e1b8c407434c0e470655945b110507bf	2026-02-04 07:48:52.086622
34	optimize-search-function-v1	82b0e469a00e8ebce495e29bfa70a0797f7ebd2c	2026-02-04 07:48:52.08823
35	add-insert-trigger-prefixes	63bb9fd05deb3dc5e9fa66c83e82b152f0caf589	2026-02-04 07:48:52.092347
36	optimise-existing-functions	81cf92eb0c36612865a18016a38496c530443899	2026-02-04 07:48:52.095148
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2026-02-04 07:48:52.101216
38	iceberg-catalog-flag-on-buckets	19a8bd89d5dfa69af7f222a46c726b7c41e462c5	2026-02-04 07:48:52.104788
39	add-search-v2-sort-support	39cf7d1e6bf515f4b02e41237aba845a7b492853	2026-02-04 07:48:52.112695
40	fix-prefix-race-conditions-optimized	fd02297e1c67df25a9fc110bf8c8a9af7fb06d1f	2026-02-04 07:48:52.11817
41	add-object-level-update-trigger	44c22478bf01744b2129efc480cd2edc9a7d60e9	2026-02-04 07:48:52.124233
42	rollback-prefix-triggers	f2ab4f526ab7f979541082992593938c05ee4b47	2026-02-04 07:48:52.127744
43	fix-object-level	ab837ad8f1c7d00cc0b7310e989a23388ff29fc6	2026-02-04 07:48:52.132699
44	vector-bucket-type	99c20c0ffd52bb1ff1f32fb992f3b351e3ef8fb3	2026-02-04 07:48:52.136208
45	vector-buckets	049e27196d77a7cb76497a85afae669d8b230953	2026-02-04 07:48:52.139257
46	buckets-objects-grants	fedeb96d60fefd8e02ab3ded9fbde05632f84aed	2026-02-04 07:48:52.148824
47	iceberg-table-metadata	649df56855c24d8b36dd4cc1aeb8251aa9ad42c2	2026-02-04 07:48:52.153857
48	iceberg-catalog-ids	2666dff93346e5d04e0a878416be1d5fec345d6f	2026-02-04 07:48:52.156334
49	buckets-objects-grants-postgres	072b1195d0d5a2f888af6b2302a1938dd94b8b3d	2026-02-04 07:48:52.170431
\.


--
-- TOC entry 4278 (class 0 OID 17191)
-- Dependencies: 361
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata, level) FROM stdin;
a12be59e-9442-40ac-ab32-26d5ee000006	imoveis	4d42cd76-760b-4055-9f91-9b7d7d6cd423/85a8ade6-17b5-4f14-b1db-426e40718086.jpg	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 14:50:50.757239+00	2026-02-04 14:50:50.757239+00	2026-02-04 14:50:50.757239+00	{"eTag": "\\"1302b9c471d22e42e05a09df7c2a7bd1\\"", "size": 192843, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T14:50:51.000Z", "contentLength": 192843, "httpStatusCode": 200}	f32f201f-4ff7-4320-b3fc-096256046563	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
abf00fc6-75fb-44cc-b4c0-c05ad0c785cb	assets	fotor-202602050732.jpg	\N	2026-02-05 03:08:33.116647+00	2026-02-05 03:08:33.116647+00	2026-02-05 03:08:33.116647+00	{"eTag": "\\"d9f30a2999e8f2b23efd60c7e99e20df-1\\"", "size": 773212, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-05T03:08:33.000Z", "contentLength": 773212, "httpStatusCode": 200}	f2e1f84f-38b6-41f3-92bc-2c18b6b09724	\N	\N	1
41ebb8c2-628e-44ce-847e-aa692e604680	imoveis	4d42cd76-760b-4055-9f91-9b7d7d6cd423/5d770240-7365-46c1-a4b6-20b6ba174aab.jpg	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 14:50:51.826866+00	2026-02-04 14:50:51.826866+00	2026-02-04 14:50:51.826866+00	{"eTag": "\\"50534a466c6ae288a7e545657dc70e1a\\"", "size": 196528, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T14:50:52.000Z", "contentLength": 196528, "httpStatusCode": 200}	20b1082c-08d0-4071-9c29-08af7e48daa8	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
0c473158-ba35-4455-ad45-b6a4296d28b9	imoveis	4d42cd76-760b-4055-9f91-9b7d7d6cd423/3cdf2ff3-245c-44aa-bc41-2f7de4dc9e52.jpg	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 14:50:52.822248+00	2026-02-04 14:50:52.822248+00	2026-02-04 14:50:52.822248+00	{"eTag": "\\"97cc1490a9b48d831dc515b4fba1ab9a\\"", "size": 202368, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T14:50:53.000Z", "contentLength": 202368, "httpStatusCode": 200}	fd7e9dbd-1950-403a-844f-c53ce9b1a905	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
288b2c00-e2af-4a41-8fa1-4578c19d1021	assets	icone_whatsapp.png	\N	2026-02-06 17:54:37.165684+00	2026-02-06 17:54:37.165684+00	2026-02-06 17:54:37.165684+00	{"eTag": "\\"08eb30daa207957a072b79549df7575b-1\\"", "size": 241870, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T17:54:37.000Z", "contentLength": 241870, "httpStatusCode": 200}	e6916797-4d78-48e2-b86c-8132a7deb886	\N	\N	1
d157f5fa-899d-448e-881f-5dc8dabeb614	imoveis	4d42cd76-760b-4055-9f91-9b7d7d6cd423/729a2b1b-ea3f-4369-b5b8-f33f1cec4f52.jpeg	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 14:50:53.494472+00	2026-02-04 14:50:53.494472+00	2026-02-04 14:50:53.494472+00	{"eTag": "\\"4b56263860f38d82018140d13fa1370f\\"", "size": 60258, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T14:50:54.000Z", "contentLength": 60258, "httpStatusCode": 200}	803181f0-2613-489f-9642-cb3b8f58b333	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
b0259bf3-8731-4aac-978a-8f240505f39b	imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b/e3f4874a-563a-47cb-ba0b-7f0a61403e8a.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:38:57.680684+00	2026-02-06 20:38:57.680684+00	2026-02-06 20:38:57.680684+00	{"eTag": "\\"aa56120277c62f012987abfe5163221a\\"", "size": 14674, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:38:58.000Z", "contentLength": 14674, "httpStatusCode": 200}	0a05af6d-f1ca-4d42-8ab8-3f3b114b92c4	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
8ce1aaad-0176-4276-976d-3ab7b829ecf2	imoveis	4d42cd76-760b-4055-9f91-9b7d7d6cd423/1f06d6c4-be48-4027-8c21-387056961475.jpg	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 14:50:54.482746+00	2026-02-04 14:50:54.482746+00	2026-02-04 14:50:54.482746+00	{"eTag": "\\"1e0c347501236b4cac9f385d8b9baf3b\\"", "size": 311812, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T14:50:55.000Z", "contentLength": 311812, "httpStatusCode": 200}	74b161e6-f464-4a74-93e8-55b6b5bebc54	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
cd1abd12-35dd-4177-96ed-6181caaca23f	imoveis	4d42cd76-760b-4055-9f91-9b7d7d6cd423/f4631c66-fa44-4b18-b9d4-987321851c7a.jpg	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 14:50:55.409896+00	2026-02-04 14:50:55.409896+00	2026-02-04 14:50:55.409896+00	{"eTag": "\\"a7e7e4fdfbb9fd3015f877d34b06123a\\"", "size": 246420, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T14:50:56.000Z", "contentLength": 246420, "httpStatusCode": 200}	0a3363f3-6c30-4fc8-a354-4cfa88a4fabb	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
1875608d-101e-4102-817f-c5cce62ec1b5	imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b/fd455a90-2504-4732-b93a-a8ab5af22544.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:38:58.240828+00	2026-02-06 20:38:58.240828+00	2026-02-06 20:38:58.240828+00	{"eTag": "\\"b7d0b40825e4219ac13c9e553ef52586\\"", "size": 10554, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:38:59.000Z", "contentLength": 10554, "httpStatusCode": 200}	3775f740-a1a1-46ae-9751-16b57c6fe5e8	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
c7c9ed38-d2d7-49a9-b5f6-dff1a1942ca3	imoveis	4d42cd76-760b-4055-9f91-9b7d7d6cd423/4eaf3092-68c5-45eb-805c-de5e40c9c2cf.jpg	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 14:50:56.429967+00	2026-02-04 14:50:56.429967+00	2026-02-04 14:50:56.429967+00	{"eTag": "\\"dbad6f657f6d9c8ffcf465ad3ca22bee\\"", "size": 324553, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T14:50:57.000Z", "contentLength": 324553, "httpStatusCode": 200}	d4ee8792-dae5-4b4c-b4e5-6a6d04913d31	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
bdeb4dea-5dd2-4bd2-85da-b8419f927651	imoveis	4d42cd76-760b-4055-9f91-9b7d7d6cd423/5e44cd65-d38f-4c85-bebf-6507b345a446.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 14:50:58.231178+00	2026-02-04 14:50:58.231178+00	2026-02-04 14:50:58.231178+00	{"eTag": "\\"391b5f48483e0af3b73db6e7b2d5db05\\"", "size": 1512785, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T14:50:59.000Z", "contentLength": 1512785, "httpStatusCode": 200}	c22dc95b-7f7d-47eb-b52d-13529c7029d6	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
0a9d538e-438e-45ca-8d41-8803bab011a7	imoveis	4d42cd76-760b-4055-9f91-9b7d7d6cd423/3aeacecc-7b18-4c85-9d39-bc0d0b89d073.jpeg	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 14:50:59.194351+00	2026-02-04 14:50:59.194351+00	2026-02-04 14:50:59.194351+00	{"eTag": "\\"46d2ed911c40d2ec468ea76c5cad6399\\"", "size": 741002, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T14:51:00.000Z", "contentLength": 741002, "httpStatusCode": 200}	6ae9f125-eefe-4f72-938b-657e09629195	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
82880a91-a807-4a40-a15d-ef9d96fb0017	imoveis	4d42cd76-760b-4055-9f91-9b7d7d6cd423/124d4593-f7ed-4e7b-8363-05cec70a5af6.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 14:51:00.403653+00	2026-02-04 14:51:00.403653+00	2026-02-04 14:51:00.403653+00	{"eTag": "\\"99c3dfc9eb0c329fac81ccb4f285f410\\"", "size": 1586917, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T14:51:01.000Z", "contentLength": 1586917, "httpStatusCode": 200}	cdd7ef7f-a43f-401b-9bb8-6851cb6aee54	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
72f35a3a-c09b-493a-92b0-51eebb1391ef	assets	hero/hero-desktop-1770263176877.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-05 03:46:18.757136+00	2026-02-05 03:46:18.757136+00	2026-02-05 03:46:18.757136+00	{"eTag": "\\"52ab5b27e6f0eca4b5f7008753e59095\\"", "size": 1411807, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-05T03:46:19.000Z", "contentLength": 1411807, "httpStatusCode": 200}	f818e877-8810-44f5-9d7d-b71447bf56f9	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
48f89994-6d43-4773-81df-640cf9f093d0	imoveis	4d42cd76-760b-4055-9f91-9b7d7d6cd423/7a473634-85a5-411e-9812-31aa7e5cd0e4.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 14:51:01.636553+00	2026-02-04 14:51:01.636553+00	2026-02-04 14:51:01.636553+00	{"eTag": "\\"e2e0a7452a333418082d2afd1e171907\\"", "size": 1666164, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T14:51:02.000Z", "contentLength": 1666164, "httpStatusCode": 200}	9841767b-5974-4883-b125-8eec048558a8	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
c858f856-4f0c-4ed7-aad6-e0d3aafda82c	imoveis	4d42cd76-760b-4055-9f91-9b7d7d6cd423/9d19fda8-7ee9-49f9-b495-5d0f09cdc1db.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 14:51:03.062684+00	2026-02-04 14:51:03.062684+00	2026-02-04 14:51:03.062684+00	{"eTag": "\\"44b8d4eb0b2fdc915403396ec30cf70a\\"", "size": 2425022, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T14:51:03.000Z", "contentLength": 2425022, "httpStatusCode": 200}	36dae10e-fea7-4e88-962c-d6bc441bc031	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
dcaf493f-9dc0-4a34-88d4-c9ab06d7b418	imoveis	ece781bd-da12-455a-a75b-852ca243fc0e/f162e207-5428-46ed-a824-e7193d746214.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:32:41.179598+00	2026-02-06 20:32:41.179598+00	2026-02-06 20:32:41.179598+00	{"eTag": "\\"e2ed8aa06d7f47eb61f518b6aa972321\\"", "size": 12886, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:32:42.000Z", "contentLength": 12886, "httpStatusCode": 200}	aa03e074-2f2f-4478-84c8-580bbda9d987	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
fc9cf03e-99c0-451f-8b64-fe018509dc12	imoveis	4d42cd76-760b-4055-9f91-9b7d7d6cd423/99898fc6-8fd2-4df6-94da-6c31dc626761.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 14:51:04.456526+00	2026-02-04 14:51:04.456526+00	2026-02-04 14:51:04.456526+00	{"eTag": "\\"1c25e9f4c7de572e259dc07070b7283b\\"", "size": 2432807, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T14:51:05.000Z", "contentLength": 2432807, "httpStatusCode": 200}	47056632-bf36-4073-8099-dbbca726cf72	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
ed4a2b0c-287c-474c-ad88-69a234d8a164	imoveis	4d42cd76-760b-4055-9f91-9b7d7d6cd423/c091ff77-2407-422d-a28c-62ae6f2c5212.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 14:51:05.727876+00	2026-02-04 14:51:05.727876+00	2026-02-04 14:51:05.727876+00	{"eTag": "\\"caf5af137f6ecde2b8b6ab94c44d3ac5\\"", "size": 2378881, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T14:51:06.000Z", "contentLength": 2378881, "httpStatusCode": 200}	bfb4cd11-9a4c-4cdb-a62f-9669ebf3db36	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
112bd4b4-b528-4a07-8ca0-7cf1690924f5	imoveis	ece781bd-da12-455a-a75b-852ca243fc0e/c75a71be-7a64-41c8-8a7e-c6beb2de9a69.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:32:41.782309+00	2026-02-06 20:32:41.782309+00	2026-02-06 20:32:41.782309+00	{"eTag": "\\"e2d5f401860ea57eb84d8f250c494eb2\\"", "size": 11446, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:32:42.000Z", "contentLength": 11446, "httpStatusCode": 200}	0ba3acb9-a1f1-46bb-81a7-3dee90ed7b2f	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
8db3a950-1163-4b6b-9abe-fbfcbaa2eac9	imoveis	4d42cd76-760b-4055-9f91-9b7d7d6cd423/63404698-67bf-4c47-a848-0ee3c1c43397.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 14:51:06.953929+00	2026-02-04 14:51:06.953929+00	2026-02-04 14:51:06.953929+00	{"eTag": "\\"45e1c3ae4cc5d7ae04c2424363e7abe9\\"", "size": 2402140, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T14:51:07.000Z", "contentLength": 2402140, "httpStatusCode": 200}	e730011e-b6ff-40ad-8cb4-e640dce1f883	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
3e6fe27f-825c-4720-895c-74b1bba83ce5	imoveis	a0255084-11c7-4064-8615-05f43c3c0b65/844eec24-42da-49fa-9281-ab0c48a2519e.jpg	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 15:04:59.226773+00	2026-02-04 15:04:59.226773+00	2026-02-04 15:04:59.226773+00	{"eTag": "\\"dbad6f657f6d9c8ffcf465ad3ca22bee\\"", "size": 324553, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T15:05:00.000Z", "contentLength": 324553, "httpStatusCode": 200}	2013d32e-7353-4ea9-9d65-637cacdef22a	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
91c09b5f-2bf5-4b74-86ab-70e7c89de7da	imoveis	a0255084-11c7-4064-8615-05f43c3c0b65/956ad06b-120b-4529-b367-5e8937787d9b.jpg	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 15:05:00.349144+00	2026-02-04 15:05:00.349144+00	2026-02-04 15:05:00.349144+00	{"eTag": "\\"1e0c347501236b4cac9f385d8b9baf3b\\"", "size": 311812, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T15:05:01.000Z", "contentLength": 311812, "httpStatusCode": 200}	f39b72d9-04ac-42dc-b40b-c5cf16a341aa	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
4d657590-f88b-4107-a818-24e7447c1b56	imoveis	a0255084-11c7-4064-8615-05f43c3c0b65/5c30779e-707a-44b3-9c7e-7a76c3416055.jpg	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 15:05:01.299768+00	2026-02-04 15:05:01.299768+00	2026-02-04 15:05:01.299768+00	{"eTag": "\\"a7e7e4fdfbb9fd3015f877d34b06123a\\"", "size": 246420, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T15:05:02.000Z", "contentLength": 246420, "httpStatusCode": 200}	89ba3e83-6649-4933-ac4c-716807f12de8	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
8693d8c3-fdb5-46f7-a8f5-0c3a290d89d6	assets	hero/hero-desktop-1770264645360.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-05 04:10:47.035923+00	2026-02-05 04:10:47.035923+00	2026-02-05 04:10:47.035923+00	{"eTag": "\\"52ab5b27e6f0eca4b5f7008753e59095\\"", "size": 1411807, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-05T04:10:47.000Z", "contentLength": 1411807, "httpStatusCode": 200}	8a8e1306-cc8d-4585-89e0-0890d0b6a44b	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
48c4a81c-ee7d-4794-9b2a-4ad3abad69e0	imoveis	d2e58f70-1388-4d3d-a5d4-b77200b949b4/2029071e-ec5c-47be-a403-1fe41727dc2a.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 20:52:47.008879+00	2026-02-04 20:52:47.008879+00	2026-02-04 20:52:47.008879+00	{"eTag": "\\"44b8d4eb0b2fdc915403396ec30cf70a\\"", "size": 2425022, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T20:52:47.000Z", "contentLength": 2425022, "httpStatusCode": 200}	4c3ebc8d-87f9-4932-9f5b-264117bce2b0	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
f05a80ba-cf77-40bc-805f-a0b222e0dc82	imoveis	d2e58f70-1388-4d3d-a5d4-b77200b949b4/347942fd-5905-4e40-a85f-13211963e97f.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 20:52:51.330355+00	2026-02-04 20:52:51.330355+00	2026-02-04 20:52:51.330355+00	{"eTag": "\\"1c25e9f4c7de572e259dc07070b7283b\\"", "size": 2432807, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T20:52:52.000Z", "contentLength": 2432807, "httpStatusCode": 200}	335008d1-304e-4a9a-9a89-1f3d4ba846da	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
6c368be7-9414-4223-b4d2-34c3d7a00d8e	assets	hero/hero-desktop-1770264714842.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-05 04:11:56.523585+00	2026-02-05 04:11:56.523585+00	2026-02-05 04:11:56.523585+00	{"eTag": "\\"52ab5b27e6f0eca4b5f7008753e59095\\"", "size": 1411807, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-05T04:11:57.000Z", "contentLength": 1411807, "httpStatusCode": 200}	7bad0212-667a-42df-8b54-2efd057884fa	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
8ba6006a-e686-4a44-bfb2-df576e441990	imoveis	ece781bd-da12-455a-a75b-852ca243fc0e/c64d41d3-426d-42dc-a1fc-6d33a569b3ef.jpg	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 22:47:19.677524+00	2026-02-04 22:47:19.677524+00	2026-02-04 22:47:19.677524+00	{"eTag": "\\"fd8fdd54a09c5963ac7246d5063d5efd\\"", "size": 137854, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T22:47:20.000Z", "contentLength": 137854, "httpStatusCode": 200}	9170811a-88ed-4997-8418-1f636bf7f9ce	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
6be9ae17-474c-4f39-adb2-55d181c3bb6d	imoveis	ece781bd-da12-455a-a75b-852ca243fc0e/5b69f710-b87c-4cda-a4e5-a35b864e6b9c.jpg	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 22:47:20.295568+00	2026-02-04 22:47:20.295568+00	2026-02-04 22:47:20.295568+00	{"eTag": "\\"822da923df9435d7e7ea5d86da35c88a\\"", "size": 31934, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T22:47:21.000Z", "contentLength": 31934, "httpStatusCode": 200}	f7b8f21d-155d-4f83-bb08-ada4f94eee55	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
c63c827b-70cb-4fd8-9100-b789d0f01149	assets	hero/hero-desktop-1770264725686.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-05 04:12:06.331735+00	2026-02-05 04:12:06.331735+00	2026-02-05 04:12:06.331735+00	{"eTag": "\\"52ab5b27e6f0eca4b5f7008753e59095\\"", "size": 1411807, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-05T04:12:07.000Z", "contentLength": 1411807, "httpStatusCode": 200}	6ad5b6e4-d3bd-4752-9d90-a19f0ebb40ce	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
4e33e230-fe14-4b27-829a-0270d30b85a8	imoveis	ece781bd-da12-455a-a75b-852ca243fc0e/4c3364e3-1f25-4019-8701-6b4bbcfd3d59.jpg	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 22:47:21.045542+00	2026-02-04 22:47:21.045542+00	2026-02-04 22:47:21.045542+00	{"eTag": "\\"df21b53d53d8378749f39afe0f3c3b8a\\"", "size": 82855, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T22:47:21.000Z", "contentLength": 82855, "httpStatusCode": 200}	cf741cac-fa2a-4893-9812-57c99efbcfcf	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
730a7edb-638a-4302-ac82-3091f0f2d521	imoveis	ece781bd-da12-455a-a75b-852ca243fc0e/05ccde54-93ca-4512-b5e7-d79d9e662ddd.jpg	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 22:47:21.805653+00	2026-02-04 22:47:21.805653+00	2026-02-04 22:47:21.805653+00	{"eTag": "\\"bebd43afbf7cb95befdc0f40a57a1844\\"", "size": 88309, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T22:47:22.000Z", "contentLength": 88309, "httpStatusCode": 200}	8868ef73-aec4-4ae9-947d-e7fa33390082	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
54f73f93-fa76-4b97-a4cf-d47a6a53f4c6	imoveis	ece781bd-da12-455a-a75b-852ca243fc0e/9c1d9a65-3f84-4e40-bdb9-787eb6b5127f.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:32:42.330512+00	2026-02-06 20:32:42.330512+00	2026-02-06 20:32:42.330512+00	{"eTag": "\\"d18249214b130c614e2a462cfdc4a87f\\"", "size": 6072, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:32:43.000Z", "contentLength": 6072, "httpStatusCode": 200}	410c7286-b5b6-4f9d-9bec-bf3efb5c8d28	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
a6263c07-9842-4435-a345-1504de7c6274	imoveis	ece781bd-da12-455a-a75b-852ca243fc0e/68bc2127-03cc-43a4-87e5-6f7e07dd9e6c.jpg	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 22:47:22.638063+00	2026-02-04 22:47:22.638063+00	2026-02-04 22:47:22.638063+00	{"eTag": "\\"40bdba67c9c70f3cd4f1a84eddfd86df\\"", "size": 212511, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T22:47:23.000Z", "contentLength": 212511, "httpStatusCode": 200}	734c898c-9c0d-42da-89aa-0d9b7b6e9bab	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
d1230d31-95ba-4c63-9a63-e6abe3c63d1d	imoveis	ece781bd-da12-455a-a75b-852ca243fc0e/a22de954-c8a8-46cb-b6b0-24f4fdfa4538.jpg	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 22:47:23.454299+00	2026-02-04 22:47:23.454299+00	2026-02-04 22:47:23.454299+00	{"eTag": "\\"4a854a2eba74bfe83eecf83b4fa655cd\\"", "size": 284646, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T22:47:24.000Z", "contentLength": 284646, "httpStatusCode": 200}	5e5f65b6-05d9-49cd-9f3a-0b96ef1ef27b	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
9a81e80d-bbb3-4436-8dd0-b7d160882d15	imoveis	ece781bd-da12-455a-a75b-852ca243fc0e/6fc03a90-8d05-4e50-ae12-bbcc09383ad5.jpg	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 22:47:24.215428+00	2026-02-04 22:47:24.215428+00	2026-02-04 22:47:24.215428+00	{"eTag": "\\"ec9d8bbbafe1e35a05f019d36faee6e8\\"", "size": 158197, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T22:47:25.000Z", "contentLength": 158197, "httpStatusCode": 200}	9254d592-4ba1-45c5-85b1-ce16288a4800	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
fdd68ae4-87d4-4a6b-9e00-d905af815741	assets	hero/hero-desktop-1770304709538.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-05 15:18:30.646711+00	2026-02-05 15:18:30.646711+00	2026-02-05 15:18:30.646711+00	{"eTag": "\\"52ab5b27e6f0eca4b5f7008753e59095\\"", "size": 1411807, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-05T15:18:31.000Z", "contentLength": 1411807, "httpStatusCode": 200}	cac63011-d452-411e-b229-d141e6d205d5	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
660280a5-7216-458d-b296-af033a8bfa32	imoveis	ece781bd-da12-455a-a75b-852ca243fc0e/1180570b-b136-4206-8560-b6e94c814b3c.jpg	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 22:47:25.047936+00	2026-02-04 22:47:25.047936+00	2026-02-04 22:47:25.047936+00	{"eTag": "\\"677e24c553e3c37dabdcf8490265a290\\"", "size": 261754, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T22:47:25.000Z", "contentLength": 261754, "httpStatusCode": 200}	42c5c88e-6a91-49c6-94b2-bfa5de04a44f	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
6c73f335-2fa2-4e7f-a6da-c9d6bf7b12d9	imoveis	5ba23056-8710-479f-b37b-1f1596a35ddb/10e3e7bc-4061-4c64-aabc-bc8d395db328.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 22:48:06.249162+00	2026-02-04 22:48:06.249162+00	2026-02-04 22:48:06.249162+00	{"eTag": "\\"e2c1fe93b9f29338d2880c348087a77a\\"", "size": 995582, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T22:48:07.000Z", "contentLength": 995582, "httpStatusCode": 200}	db6471b6-81fd-46af-90a7-8df5deb6d092	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
f0225d01-fb6d-4cfb-b1ca-82dfa33f3035	imoveis	ece781bd-da12-455a-a75b-852ca243fc0e/ffe5d3eb-bd82-4814-92f5-f411b48c68e2.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:32:42.89959+00	2026-02-06 20:32:42.89959+00	2026-02-06 20:32:42.89959+00	{"eTag": "\\"b7d0b40825e4219ac13c9e553ef52586\\"", "size": 10554, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:32:43.000Z", "contentLength": 10554, "httpStatusCode": 200}	33333fcc-a6e1-40c6-8919-6aaa1f2806cc	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
ea586d6a-6fc6-489e-87fa-71dd1ec2a9f9	imoveis	5ba23056-8710-479f-b37b-1f1596a35ddb/5e4e5941-e64d-48f0-8b9c-8b3e7597ce0a.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 22:48:07.320766+00	2026-02-04 22:48:07.320766+00	2026-02-04 22:48:07.320766+00	{"eTag": "\\"aee304cf17e380be6a9a27f2cb90a890\\"", "size": 1190347, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T22:48:08.000Z", "contentLength": 1190347, "httpStatusCode": 200}	69c05eb0-8924-431b-bc0d-47856d5f2f31	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
57e08b67-f2c0-4ca8-a516-4e267b89dfec	imoveis	5ba23056-8710-479f-b37b-1f1596a35ddb/d9e9c71c-95e3-4a16-9e3f-022a93430a55.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 22:48:08.257595+00	2026-02-04 22:48:08.257595+00	2026-02-04 22:48:08.257595+00	{"eTag": "\\"bd69ee0eaee34c15023a39b32b2c83d9\\"", "size": 1156499, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T22:48:09.000Z", "contentLength": 1156499, "httpStatusCode": 200}	4f7ff66d-0c01-4153-811f-f256708ee2d6	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
a163a64c-b832-4454-85fb-41c4e4984ce6	imoveis	ece781bd-da12-455a-a75b-852ca243fc0e/623131d3-1d64-4464-8193-13a1f2cb7fcc.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:32:43.483486+00	2026-02-06 20:32:43.483486+00	2026-02-06 20:32:43.483486+00	{"eTag": "\\"aa56120277c62f012987abfe5163221a\\"", "size": 14674, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:32:44.000Z", "contentLength": 14674, "httpStatusCode": 200}	3869c129-4d75-4c82-838f-efcad7545b71	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
fcb91333-d88f-47f8-8147-8037b5b63961	imoveis	5ba23056-8710-479f-b37b-1f1596a35ddb/25850a22-d902-406a-978c-7aa9e8294258.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 22:48:09.305709+00	2026-02-04 22:48:09.305709+00	2026-02-04 22:48:09.305709+00	{"eTag": "\\"133d2e415ff5bee546370384499ad7ea\\"", "size": 1896778, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T22:48:10.000Z", "contentLength": 1896778, "httpStatusCode": 200}	d730b2a2-7900-4825-9f72-42e5bc0ce6e6	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
58269a63-a984-4d51-807a-6d9084dd3b97	imoveis	5ba23056-8710-479f-b37b-1f1596a35ddb/b359f136-a6b0-4eb2-9ccf-5684a8ef9b83.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 22:48:10.38857+00	2026-02-04 22:48:10.38857+00	2026-02-04 22:48:10.38857+00	{"eTag": "\\"a43240cc672b8c2ea0ddf2e8e70dd4af\\"", "size": 1845106, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T22:48:11.000Z", "contentLength": 1845106, "httpStatusCode": 200}	b634ad5a-788e-4706-ae28-0c97849024cc	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
e85b5292-4f2f-4d4d-a47c-5588561569da	imoveis	5ba23056-8710-479f-b37b-1f1596a35ddb/46fb4437-8f42-429e-ace5-47ff01679e6b.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 22:48:11.47519+00	2026-02-04 22:48:11.47519+00	2026-02-04 22:48:11.47519+00	{"eTag": "\\"d0cd3550c76299c1fa325f8f904598f0\\"", "size": 1785119, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T22:48:12.000Z", "contentLength": 1785119, "httpStatusCode": 200}	b4deda41-714b-402b-9d90-7cdf88c64ebe	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
46898bd9-2757-488d-b06f-b67eae9d0855	imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b/9d9b819b-4da6-4f64-9b95-7272ea8bc02a.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 22:51:56.548601+00	2026-02-04 22:51:56.548601+00	2026-02-04 22:51:56.548601+00	{"eTag": "\\"68973c66ecf41831b98a83c28b11643a\\"", "size": 172111, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T22:51:57.000Z", "contentLength": 172111, "httpStatusCode": 200}	3aaaedee-a0a0-4c4d-8cca-bc5b292f4825	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
99e81836-75c2-4466-9296-61fa66f93aa8	assets	hero/hero-desktop-1770306523774.jpg	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-05 15:48:44.344739+00	2026-02-05 15:48:44.344739+00	2026-02-05 15:48:44.344739+00	{"eTag": "\\"8ced0ca4af9f5bd405da683ae44547cd\\"", "size": 773212, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-05T15:48:45.000Z", "contentLength": 773212, "httpStatusCode": 200}	57e48efd-262d-4386-9d53-17fb32e55ea2	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
819b2f7b-ba76-4379-b2b0-22469fe01037	imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b/0fb8003c-1388-4d17-aab4-a0cade4ae954.jpeg	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 22:51:57.41965+00	2026-02-04 22:51:57.41965+00	2026-02-04 22:51:57.41965+00	{"eTag": "\\"0c8c408674c9d1fd862093e22804f317\\"", "size": 184071, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T22:51:58.000Z", "contentLength": 184071, "httpStatusCode": 200}	4c9654ee-2338-4c5f-9a5f-e073cde90754	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
94163f4a-d3c7-47d4-9d13-b4a634a27f36	imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b/d8bd8f35-e8e5-45aa-9e67-4c9387b45778.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 22:51:58.878265+00	2026-02-04 22:51:58.878265+00	2026-02-04 22:51:58.878265+00	{"eTag": "\\"491dbfb369e5dd0e92be3456607a206e\\"", "size": 1490911, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T22:51:59.000Z", "contentLength": 1490911, "httpStatusCode": 200}	89219666-2228-4481-8e4b-1a67b5128f7f	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
8185ec5a-0704-4daf-a03b-de0bbda47342	imoveis	a0255084-11c7-4064-8615-05f43c3c0b65/2a644676-5ac2-4ea5-b9ea-d6982a475f37.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:35:17.917638+00	2026-02-06 20:35:17.917638+00	2026-02-06 20:35:17.917638+00	{"eTag": "\\"18240f648467903fd0cabc02af5e858f\\"", "size": 29056, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:35:18.000Z", "contentLength": 29056, "httpStatusCode": 200}	06f032c7-900f-4d5f-8ba9-cb46e46e31ef	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
27e9cd10-1ea3-4880-ae38-beff2381e6a0	imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b/d0c9650a-6dfc-4561-ab01-7d4a47e32203.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 22:52:00.059016+00	2026-02-04 22:52:00.059016+00	2026-02-04 22:52:00.059016+00	{"eTag": "\\"0204540955dd0b2de6fbd81f488c4057\\"", "size": 2263874, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T22:52:01.000Z", "contentLength": 2263874, "httpStatusCode": 200}	a8401488-8b0c-484a-8691-6addecf2141c	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
18b99bb0-24a9-4bbd-990c-b3a46f10be09	imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b/d89a148a-85c6-4d6b-9534-3fac98b9b6ac.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 22:52:01.310102+00	2026-02-04 22:52:01.310102+00	2026-02-04 22:52:01.310102+00	{"eTag": "\\"1fa73e4660cb4ead3198f4eb36a7e5fb\\"", "size": 1332668, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T22:52:02.000Z", "contentLength": 1332668, "httpStatusCode": 200}	cc560bb1-77fe-4b1f-a339-564d56546e10	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
26ec5dcb-af42-4ca0-ba4f-b457035b2efa	imoveis	a0255084-11c7-4064-8615-05f43c3c0b65/cadde145-73da-479f-b79a-34b3d10696c6.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:35:18.483977+00	2026-02-06 20:35:18.483977+00	2026-02-06 20:35:18.483977+00	{"eTag": "\\"06f768379a8e2312b3ecd164388220ce\\"", "size": 6066, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:35:19.000Z", "contentLength": 6066, "httpStatusCode": 200}	f3b15e07-e039-48fa-8c82-80e40c02c7c1	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
4b519284-10ac-4843-aa27-7de19cf14168	imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b/6c20710b-120e-4849-a653-08f7a409224d.jpg	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 22:52:03.686008+00	2026-02-04 22:52:03.686008+00	2026-02-04 22:52:03.686008+00	{"eTag": "\\"b1f650b7c9585184c11da17f04d09500\\"", "size": 1787230, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T22:52:04.000Z", "contentLength": 1787230, "httpStatusCode": 200}	a67bfe24-3914-4950-b9bb-d70c3eba659e	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
cc79ac47-fc8c-41a8-837f-c4f6f17df965	imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b/1bc9c8a6-e80d-4b08-b18f-accb5a971f30.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 22:52:04.937838+00	2026-02-04 22:52:04.937838+00	2026-02-04 22:52:04.937838+00	{"eTag": "\\"424d69241445ac73206c0ab4e68138f6\\"", "size": 2402509, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T22:52:05.000Z", "contentLength": 2402509, "httpStatusCode": 200}	c1c26118-9d93-4820-af15-c9c262f5951e	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
75b7c6fe-8cf7-4972-9ba7-ab4e6495d233	imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b/0e6c8031-72cf-4d3e-b2b6-3e0a49fd04a9.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-04 22:52:06.114255+00	2026-02-04 22:52:06.114255+00	2026-02-04 22:52:06.114255+00	{"eTag": "\\"a3978385aec59042e451d259c19535b2\\"", "size": 3097088, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T22:52:07.000Z", "contentLength": 3097088, "httpStatusCode": 200}	8d1be4b0-26bc-40f0-b1b7-3e25282134ca	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
2e25021b-1fbf-4f1f-8957-73698d77d4ef	imoveis	a0255084-11c7-4064-8615-05f43c3c0b65/ff904554-7811-4ac8-894d-44d73797b6af.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:35:19.047274+00	2026-02-06 20:35:19.047274+00	2026-02-06 20:35:19.047274+00	{"eTag": "\\"bb4133f0fc6e8428b38dfbc69fa1dedc\\"", "size": 48616, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:35:20.000Z", "contentLength": 48616, "httpStatusCode": 200}	bd5e159c-d07c-45b3-b014-a3c54c571897	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
da0bdf51-e073-46d2-a745-b03bbf385681	imoveis	a0255084-11c7-4064-8615-05f43c3c0b65/4a55d484-2f3b-475a-bea8-3e2f45d4f8bb.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:35:19.607983+00	2026-02-06 20:35:19.607983+00	2026-02-06 20:35:19.607983+00	{"eTag": "\\"623a90422935dd139123914dcb72237a\\"", "size": 21304, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:35:20.000Z", "contentLength": 21304, "httpStatusCode": 200}	8eb92989-47ca-474b-a509-cd05af188f67	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
02fa5b55-8110-46a8-a00f-1c1cb8eba073	imoveis	a0255084-11c7-4064-8615-05f43c3c0b65/4ae4aa3a-8a5d-4178-9df8-77d99d218cbf.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:35:20.169324+00	2026-02-06 20:35:20.169324+00	2026-02-06 20:35:20.169324+00	{"eTag": "\\"e2ed8aa06d7f47eb61f518b6aa972321\\"", "size": 12886, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:35:21.000Z", "contentLength": 12886, "httpStatusCode": 200}	23e93730-2892-4619-8fe3-817f79534980	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
c18acc0c-74fd-41a0-a7ab-53568aadeca4	assets	.emptyFolderPlaceholder	\N	2026-02-05 03:06:25.059295+00	2026-02-05 03:06:25.059295+00	2026-02-05 03:06:25.059295+00	{"eTag": "\\"d41d8cd98f00b204e9800998ecf8427e\\"", "size": 0, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2026-02-05T03:06:25.066Z", "contentLength": 0, "httpStatusCode": 200}	52fad1fd-c10e-47ce-9f75-1355bf794f40	\N	{}	1
195e7752-96db-43db-9048-8d33d6647d81	imoveis	5ba23056-8710-479f-b37b-1f1596a35ddb/291ffc85-090d-4b63-9f40-7eab3e2b10a4.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:36:57.97347+00	2026-02-06 20:36:57.97347+00	2026-02-06 20:36:57.97347+00	{"eTag": "\\"9900b52445580fab49cf1b2bcc1626e6\\"", "size": 17306, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:36:58.000Z", "contentLength": 17306, "httpStatusCode": 200}	b25660aa-9453-4c5d-9c59-9c68788f0ffd	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
4a000bdd-c062-4050-94ae-bdc5f5605a09	imoveis	5ba23056-8710-479f-b37b-1f1596a35ddb/6f004d5b-ad68-41ea-9c74-53d1a6fe5e81.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:36:58.559606+00	2026-02-06 20:36:58.559606+00	2026-02-06 20:36:58.559606+00	{"eTag": "\\"5ba73b7325dc81dd445cb902c624a961\\"", "size": 22630, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:36:59.000Z", "contentLength": 22630, "httpStatusCode": 200}	eb0b76b6-6d62-4451-9c4a-17615494e101	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
ca58794c-ea46-45ac-bb72-ec8bae4405a3	imoveis	5ba23056-8710-479f-b37b-1f1596a35ddb/24752978-bf96-4e71-8382-e951abbc89ae.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:36:59.170843+00	2026-02-06 20:36:59.170843+00	2026-02-06 20:36:59.170843+00	{"eTag": "\\"fcb607be6eca8cfe363fc5f2ef4bea95\\"", "size": 22560, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:37:00.000Z", "contentLength": 22560, "httpStatusCode": 200}	57b44e7d-0b26-49cb-b275-fc31af01e6a2	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
1b1caafe-2a8b-486b-a09e-6e4fa20336aa	imoveis	5ba23056-8710-479f-b37b-1f1596a35ddb/9b4f1393-1f89-4048-a15d-87cdee9a6773.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:36:59.725441+00	2026-02-06 20:36:59.725441+00	2026-02-06 20:36:59.725441+00	{"eTag": "\\"3bf7b2bd60b2f130a6a520de1782931f\\"", "size": 26216, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:37:00.000Z", "contentLength": 26216, "httpStatusCode": 200}	09ce2b43-cdb8-453b-b7b5-727e89007d32	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
dd878018-24d2-405d-8764-5c0e43c3e080	imoveis	5ba23056-8710-479f-b37b-1f1596a35ddb/138ab27d-a60d-4a7d-b462-f8882e8e56af.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:37:00.278465+00	2026-02-06 20:37:00.278465+00	2026-02-06 20:37:00.278465+00	{"eTag": "\\"16a847159cebbc0b4aea8839ee62be74\\"", "size": 21648, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:37:01.000Z", "contentLength": 21648, "httpStatusCode": 200}	ce4ef934-b982-4214-b143-5e223f7378e9	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
c38f373b-2216-448a-bb55-c3f428589f11	imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b/bfc4dde5-6884-40e4-8c8e-e3a648055ffc.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:38:56.607278+00	2026-02-06 20:38:56.607278+00	2026-02-06 20:38:56.607278+00	{"eTag": "\\"e2d5f401860ea57eb84d8f250c494eb2\\"", "size": 11446, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:38:57.000Z", "contentLength": 11446, "httpStatusCode": 200}	39d3c42b-ff0e-4759-b3f5-9534750e2319	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
64f09f24-0eda-4644-a9cf-7c14cb71d907	imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b/b6e38372-60c9-4154-af77-40fc9a930f94.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:38:57.154045+00	2026-02-06 20:38:57.154045+00	2026-02-06 20:38:57.154045+00	{"eTag": "\\"e2ed8aa06d7f47eb61f518b6aa972321\\"", "size": 12886, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:38:58.000Z", "contentLength": 12886, "httpStatusCode": 200}	1514e347-67df-48ef-9a40-aa0899067cc9	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
d763d4b2-c716-4d6e-99e4-f208779cd53a	imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b/6b459d86-9594-4cd3-a81c-2279e79b5d38.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:38:58.785879+00	2026-02-06 20:38:58.785879+00	2026-02-06 20:38:58.785879+00	{"eTag": "\\"d18249214b130c614e2a462cfdc4a87f\\"", "size": 6072, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:38:59.000Z", "contentLength": 6072, "httpStatusCode": 200}	d03412d7-838e-4328-a4ea-6ad89952b840	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
060ccf1c-91ac-49af-b41f-16b996a0f87f	imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b/3b9b48ad-bb3b-45db-91ac-4258eb0b42a0.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:38:59.371001+00	2026-02-06 20:38:59.371001+00	2026-02-06 20:38:59.371001+00	{"eTag": "\\"18240f648467903fd0cabc02af5e858f\\"", "size": 29056, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:39:00.000Z", "contentLength": 29056, "httpStatusCode": 200}	be6c95fa-8749-4d51-bd21-9f73b458bc92	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
2ac9c1fd-e871-4a66-805e-197965231c57	imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b/1b5e55d4-2b7d-4ced-baa3-4ec42c5c14bf.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:38:59.900341+00	2026-02-06 20:38:59.900341+00	2026-02-06 20:38:59.900341+00	{"eTag": "\\"06f768379a8e2312b3ecd164388220ce\\"", "size": 6066, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:39:00.000Z", "contentLength": 6066, "httpStatusCode": 200}	924ef53a-3604-4198-bc70-5754bfaf87c6	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
e79c49e1-f828-4947-a58a-ec91e47328ca	imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b/51154a7c-9798-4667-96a2-324618282996.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:39:00.462781+00	2026-02-06 20:39:00.462781+00	2026-02-06 20:39:00.462781+00	{"eTag": "\\"bb4133f0fc6e8428b38dfbc69fa1dedc\\"", "size": 48616, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:39:01.000Z", "contentLength": 48616, "httpStatusCode": 200}	b72bfe5b-d42c-4531-bb23-947301c29712	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
e2432acc-dae8-4b79-a579-b47c03cc92ef	imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b/582bc1a9-2c28-46c3-81be-fefa12ca245b.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:39:01.023425+00	2026-02-06 20:39:01.023425+00	2026-02-06 20:39:01.023425+00	{"eTag": "\\"c92e305fb28bd7bc36757454cd93a085\\"", "size": 23070, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:39:01.000Z", "contentLength": 23070, "httpStatusCode": 200}	6cbaa2b0-9779-46d4-8960-338928459a28	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
665a922f-0ffc-42bf-bf0c-3bb4b49fb6c3	imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b/5cc66b39-a4b5-49e2-be48-9cf246aa752d.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:39:01.621853+00	2026-02-06 20:39:01.621853+00	2026-02-06 20:39:01.621853+00	{"eTag": "\\"623a90422935dd139123914dcb72237a\\"", "size": 21304, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:39:02.000Z", "contentLength": 21304, "httpStatusCode": 200}	bd63d57c-a815-4bc0-8506-2119aedb5962	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
3ff5cf0a-028f-46e1-a704-96d066e828f2	imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b/d4e984e1-ffba-4439-be41-b6a9cfb121e3.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:39:02.282156+00	2026-02-06 20:39:02.282156+00	2026-02-06 20:39:02.282156+00	{"eTag": "\\"5ba73b7325dc81dd445cb902c624a961\\"", "size": 22630, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:39:03.000Z", "contentLength": 22630, "httpStatusCode": 200}	42be4ed3-594c-4ca9-9abe-bb3d80387981	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
6ed8775e-beb5-481e-b900-9e35afa9607e	imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b/366c9bc0-e646-4727-8d8d-540aadf33f1e.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:39:03.434933+00	2026-02-06 20:39:03.434933+00	2026-02-06 20:39:03.434933+00	{"eTag": "\\"3bf7b2bd60b2f130a6a520de1782931f\\"", "size": 26216, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:39:04.000Z", "contentLength": 26216, "httpStatusCode": 200}	b8ad3af1-0204-41f6-a760-14c9fae9d990	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
4399afbc-e4fc-4849-9a69-58484d6f4148	imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b/b5e9e88f-1190-4e29-8752-53fdc3d822f2.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:39:03.99544+00	2026-02-06 20:39:03.99544+00	2026-02-06 20:39:03.99544+00	{"eTag": "\\"fcb607be6eca8cfe363fc5f2ef4bea95\\"", "size": 22560, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:39:04.000Z", "contentLength": 22560, "httpStatusCode": 200}	643e1039-9396-42f7-81ff-db944da75b0c	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
f89655ed-b925-481c-8aea-1f1b4ebd0436	imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b/d7a34f86-f3eb-47df-96d7-21a936505d96.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:39:04.588073+00	2026-02-06 20:39:04.588073+00	2026-02-06 20:39:04.588073+00	{"eTag": "\\"974f8c58cb518e4f3de1ef57335107a2\\"", "size": 22576, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:39:05.000Z", "contentLength": 22576, "httpStatusCode": 200}	4b2f9a99-364f-4160-9b7d-ed8a8a205161	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
17f1d370-3060-4525-8d8e-e3bc0dba40c3	imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b/57f06661-c5ac-4241-80ec-4c12e8027292.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 20:39:05.152526+00	2026-02-06 20:39:05.152526+00	2026-02-06 20:39:05.152526+00	{"eTag": "\\"16a847159cebbc0b4aea8839ee62be74\\"", "size": 21648, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T20:39:06.000Z", "contentLength": 21648, "httpStatusCode": 200}	52cf645d-be04-484c-bde1-472cec524f5f	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
7a4646ae-a32c-4c5f-9587-f99dbff98263	imoveis	assets/hero_raw_fcd0a284-d4b2-45a9-bb06-5c037541549f.png	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 21:44:53.981619+00	2026-02-06 21:44:53.981619+00	2026-02-06 21:44:53.981619+00	{"eTag": "\\"52ab5b27e6f0eca4b5f7008753e59095\\"", "size": 1411807, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T21:44:54.000Z", "contentLength": 1411807, "httpStatusCode": 200}	2ce41c77-f4b9-4804-a42d-b5dcc1bf4f49	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
9aa32c98-7c23-4ce1-be76-c0d46d5f019f	imoveis	assets/hero_fcd0a284-d4b2-45a9-bb06-5c037541549f.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 21:44:54.354643+00	2026-02-06 21:44:54.354643+00	2026-02-06 21:44:54.354643+00	{"eTag": "\\"e63a3e6c08ba678f718b64f4fbdca0ab\\"", "size": 47406, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T21:44:55.000Z", "contentLength": 47406, "httpStatusCode": 200}	c19eda58-97ce-484e-a906-8d68765d33a2	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
a2663ad0-db1c-4e26-981b-527c6a4d9ce9	imoveis	assets/hero_raw_bd937261-2560-448f-8619-20b51fabd9dc.jpg	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 21:46:14.948282+00	2026-02-06 21:46:14.948282+00	2026-02-06 21:46:14.948282+00	{"eTag": "\\"8ced0ca4af9f5bd405da683ae44547cd\\"", "size": 773212, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T21:46:15.000Z", "contentLength": 773212, "httpStatusCode": 200}	7b49d3ab-fddf-4d5f-8e40-7cc760748c41	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
c2050163-9012-4b2e-88cf-f4ed33af5f50	imoveis	assets/hero_bd937261-2560-448f-8619-20b51fabd9dc.webp	a2205a76-3970-4a15-9553-1de0b89f7905	2026-02-06 21:46:15.322003+00	2026-02-06 21:46:15.322003+00	2026-02-06 21:46:15.322003+00	{"eTag": "\\"4a1dfcc97f2650813c0b0d78a26b9795\\"", "size": 35260, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-06T21:46:16.000Z", "contentLength": 35260, "httpStatusCode": 200}	977f91c9-3658-4c30-8170-3c17d9e17fcb	a2205a76-3970-4a15-9553-1de0b89f7905	{}	2
02dfad0b-21aa-4fa0-9405-1c484b25e96a	assets	hero-bgr.png	\N	2026-02-08 00:19:08.002888+00	2026-02-08 00:19:08.002888+00	2026-02-08 00:19:08.002888+00	{"eTag": "\\"df74d3205483db6797a6a4e38427641c-1\\"", "size": 1833767, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-08T00:19:07.000Z", "contentLength": 1833767, "httpStatusCode": 200}	0c496d98-1095-42a8-8651-f5d9d963b3ea	\N	\N	1
e155c2a7-2121-4d5b-a241-e2e39a526c80	assets	MONELOS.otf	\N	2026-02-08 00:54:40.32663+00	2026-02-08 00:54:40.32663+00	2026-02-08 00:54:40.32663+00	{"eTag": "\\"bb4aef49af92ba5675b5bf1d684e74b4-1\\"", "size": 123320, "mimetype": "font/otf", "cacheControl": "max-age=3600", "lastModified": "2026-02-08T00:54:40.000Z", "contentLength": 123320, "httpStatusCode": 200}	1fd7fe8c-be15-4535-8766-9ae64b6af2ea	\N	\N	1
cc72fed1-ee9a-4edc-a8ae-9dfc5c9a5494	assets	GalileaSansBoldItalic.otf	\N	2026-02-08 01:20:47.434304+00	2026-02-08 01:20:47.434304+00	2026-02-08 01:20:47.434304+00	{"eTag": "\\"4a0a6fb7e678cc98d207399046bc2363-1\\"", "size": 375180, "mimetype": "font/otf", "cacheControl": "max-age=3600", "lastModified": "2026-02-08T01:20:47.000Z", "contentLength": 375180, "httpStatusCode": 200}	2ba602b5-a85e-4f8f-a5f8-96f0aa2fc15e	\N	\N	1
\.


--
-- TOC entry 4281 (class 0 OID 17295)
-- Dependencies: 364
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.prefixes (bucket_id, name, created_at, updated_at) FROM stdin;
imoveis	4d42cd76-760b-4055-9f91-9b7d7d6cd423	2026-02-04 14:50:50.757239+00	2026-02-04 14:50:50.757239+00
imoveis	a0255084-11c7-4064-8615-05f43c3c0b65	2026-02-04 15:04:59.226773+00	2026-02-04 15:04:59.226773+00
imoveis	d2e58f70-1388-4d3d-a5d4-b77200b949b4	2026-02-04 20:52:47.008879+00	2026-02-04 20:52:47.008879+00
imoveis	ece781bd-da12-455a-a75b-852ca243fc0e	2026-02-04 22:47:19.677524+00	2026-02-04 22:47:19.677524+00
imoveis	5ba23056-8710-479f-b37b-1f1596a35ddb	2026-02-04 22:48:06.249162+00	2026-02-04 22:48:06.249162+00
imoveis	0a8b3af9-366d-4a82-a85c-987da532e01b	2026-02-04 22:51:56.548601+00	2026-02-04 22:51:56.548601+00
assets	hero	2026-02-05 03:46:18.757136+00	2026-02-05 03:46:18.757136+00
imoveis	assets	2026-02-06 21:44:53.981619+00	2026-02-06 21:44:53.981619+00
\.


--
-- TOC entry 4279 (class 0 OID 17241)
-- Dependencies: 362
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- TOC entry 4280 (class 0 OID 17255)
-- Dependencies: 363
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- TOC entry 4284 (class 0 OID 17377)
-- Dependencies: 367
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.vector_indexes (id, name, bucket_id, data_type, dimension, distance_metric, metadata_configuration, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3716 (class 0 OID 16608)
-- Dependencies: 335
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4486 (class 0 OID 0)
-- Dependencies: 330
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 76, true);


--
-- TOC entry 4487 (class 0 OID 0)
-- Dependencies: 355
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- TOC entry 3895 (class 2606 OID 16783)
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- TOC entry 3864 (class 2606 OID 16531)
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- TOC entry 3918 (class 2606 OID 16889)
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- TOC entry 3873 (class 2606 OID 16907)
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- TOC entry 3875 (class 2606 OID 16917)
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- TOC entry 3862 (class 2606 OID 16524)
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- TOC entry 3897 (class 2606 OID 16776)
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- TOC entry 3893 (class 2606 OID 16764)
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- TOC entry 3885 (class 2606 OID 16957)
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- TOC entry 3887 (class 2606 OID 16751)
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- TOC entry 3931 (class 2606 OID 17016)
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- TOC entry 3933 (class 2606 OID 17014)
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- TOC entry 3935 (class 2606 OID 17012)
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- TOC entry 3945 (class 2606 OID 17074)
-- Name: oauth_client_states oauth_client_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_client_states
    ADD CONSTRAINT oauth_client_states_pkey PRIMARY KEY (id);


--
-- TOC entry 3928 (class 2606 OID 16976)
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- TOC entry 3939 (class 2606 OID 17038)
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- TOC entry 3941 (class 2606 OID 17040)
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- TOC entry 3922 (class 2606 OID 16942)
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3856 (class 2606 OID 16514)
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3859 (class 2606 OID 16694)
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- TOC entry 3907 (class 2606 OID 16823)
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- TOC entry 3909 (class 2606 OID 16821)
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- TOC entry 3914 (class 2606 OID 16837)
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- TOC entry 3867 (class 2606 OID 16537)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3880 (class 2606 OID 16715)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 3904 (class 2606 OID 16804)
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- TOC entry 3899 (class 2606 OID 16795)
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- TOC entry 3849 (class 2606 OID 16877)
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- TOC entry 3851 (class 2606 OID 16501)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4021 (class 2606 OID 17647)
-- Name: configuracoes_fotos configuracoes_fotos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracoes_fotos
    ADD CONSTRAINT configuracoes_fotos_pkey PRIMARY KEY (id);


--
-- TOC entry 4019 (class 2606 OID 17638)
-- Name: configuracoes_site configuracoes_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracoes_site
    ADD CONSTRAINT configuracoes_site_pkey PRIMARY KEY (id);


--
-- TOC entry 4003 (class 2606 OID 17553)
-- Name: imoveis_caracteristicas imoveis_caracteristicas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imoveis_caracteristicas
    ADD CONSTRAINT imoveis_caracteristicas_pkey PRIMARY KEY (id);


--
-- TOC entry 4005 (class 2606 OID 17558)
-- Name: imoveis_caracteristicas_rel imoveis_caracteristicas_rel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imoveis_caracteristicas_rel
    ADD CONSTRAINT imoveis_caracteristicas_rel_pkey PRIMARY KEY (imovel_id, caracteristica_id);


--
-- TOC entry 3987 (class 2606 OID 17501)
-- Name: imoveis imoveis_codigo_imovel_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imoveis
    ADD CONSTRAINT imoveis_codigo_imovel_key UNIQUE (codigo_imovel);


--
-- TOC entry 4007 (class 2606 OID 17575)
-- Name: imoveis_comodidades imoveis_comodidades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imoveis_comodidades
    ADD CONSTRAINT imoveis_comodidades_pkey PRIMARY KEY (id);


--
-- TOC entry 4009 (class 2606 OID 17580)
-- Name: imoveis_comodidades_rel imoveis_comodidades_rel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imoveis_comodidades_rel
    ADD CONSTRAINT imoveis_comodidades_rel_pkey PRIMARY KEY (imovel_id, comodidade_id);


--
-- TOC entry 3993 (class 2606 OID 17513)
-- Name: imoveis_fotos imoveis_fotos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imoveis_fotos
    ADD CONSTRAINT imoveis_fotos_pkey PRIMARY KEY (id);


--
-- TOC entry 3999 (class 2606 OID 17541)
-- Name: imoveis_informacoes_adicionais imoveis_informacoes_adicionais_imovel_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imoveis_informacoes_adicionais
    ADD CONSTRAINT imoveis_informacoes_adicionais_imovel_id_key UNIQUE (imovel_id);


--
-- TOC entry 4001 (class 2606 OID 17539)
-- Name: imoveis_informacoes_adicionais imoveis_informacoes_adicionais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imoveis_informacoes_adicionais
    ADD CONSTRAINT imoveis_informacoes_adicionais_pkey PRIMARY KEY (id);


--
-- TOC entry 3995 (class 2606 OID 17528)
-- Name: imoveis_localizacao imoveis_localizacao_imovel_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imoveis_localizacao
    ADD CONSTRAINT imoveis_localizacao_imovel_id_key UNIQUE (imovel_id);


--
-- TOC entry 3997 (class 2606 OID 17526)
-- Name: imoveis_localizacao imoveis_localizacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imoveis_localizacao
    ADD CONSTRAINT imoveis_localizacao_pkey PRIMARY KEY (id);


--
-- TOC entry 4015 (class 2606 OID 17604)
-- Name: imoveis_negociacao_opcoes imoveis_negociacao_opcoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imoveis_negociacao_opcoes
    ADD CONSTRAINT imoveis_negociacao_opcoes_pkey PRIMARY KEY (imovel_id, negociacao_opcao_id);


--
-- TOC entry 3989 (class 2606 OID 17499)
-- Name: imoveis imoveis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imoveis
    ADD CONSTRAINT imoveis_pkey PRIMARY KEY (id);


--
-- TOC entry 3991 (class 2606 OID 17503)
-- Name: imoveis imoveis_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imoveis
    ADD CONSTRAINT imoveis_slug_key UNIQUE (slug);


--
-- TOC entry 4017 (class 2606 OID 17623)
-- Name: leads leads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leads
    ADD CONSTRAINT leads_pkey PRIMARY KEY (id);


--
-- TOC entry 4011 (class 2606 OID 17597)
-- Name: negociacao_opcoes negociacao_opcoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.negociacao_opcoes
    ADD CONSTRAINT negociacao_opcoes_pkey PRIMARY KEY (id);


--
-- TOC entry 4013 (class 2606 OID 17599)
-- Name: negociacao_opcoes negociacao_opcoes_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.negociacao_opcoes
    ADD CONSTRAINT negociacao_opcoes_slug_key UNIQUE (slug);


--
-- TOC entry 3985 (class 2606 OID 17481)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- TOC entry 3950 (class 2606 OID 17107)
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- TOC entry 3947 (class 2606 OID 17080)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3976 (class 2606 OID 17400)
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- TOC entry 3958 (class 2606 OID 17189)
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- TOC entry 3979 (class 2606 OID 17376)
-- Name: buckets_vectors buckets_vectors_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_vectors
    ADD CONSTRAINT buckets_vectors_pkey PRIMARY KEY (id);


--
-- TOC entry 3953 (class 2606 OID 17180)
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- TOC entry 3955 (class 2606 OID 17178)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3966 (class 2606 OID 17201)
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- TOC entry 3974 (class 2606 OID 17304)
-- Name: prefixes prefixes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT prefixes_pkey PRIMARY KEY (bucket_id, level, name);


--
-- TOC entry 3971 (class 2606 OID 17264)
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- TOC entry 3969 (class 2606 OID 17249)
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- TOC entry 3982 (class 2606 OID 17386)
-- Name: vector_indexes vector_indexes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_pkey PRIMARY KEY (id);


--
-- TOC entry 3865 (class 1259 OID 16532)
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- TOC entry 3839 (class 1259 OID 16704)
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3840 (class 1259 OID 16706)
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3841 (class 1259 OID 16707)
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3883 (class 1259 OID 16785)
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- TOC entry 3916 (class 1259 OID 16893)
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- TOC entry 3871 (class 1259 OID 16873)
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- TOC entry 4488 (class 0 OID 0)
-- Dependencies: 3871
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- TOC entry 3876 (class 1259 OID 16701)
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- TOC entry 3919 (class 1259 OID 16890)
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- TOC entry 3943 (class 1259 OID 17075)
-- Name: idx_oauth_client_states_created_at; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_oauth_client_states_created_at ON auth.oauth_client_states USING btree (created_at);


--
-- TOC entry 3920 (class 1259 OID 16891)
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- TOC entry 3891 (class 1259 OID 16896)
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- TOC entry 3888 (class 1259 OID 16757)
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- TOC entry 3889 (class 1259 OID 16902)
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- TOC entry 3929 (class 1259 OID 17027)
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- TOC entry 3926 (class 1259 OID 16980)
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- TOC entry 3936 (class 1259 OID 17053)
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- TOC entry 3937 (class 1259 OID 17051)
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- TOC entry 3942 (class 1259 OID 17052)
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- TOC entry 3923 (class 1259 OID 16949)
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- TOC entry 3924 (class 1259 OID 16948)
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- TOC entry 3925 (class 1259 OID 16950)
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- TOC entry 3842 (class 1259 OID 16708)
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3843 (class 1259 OID 16705)
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3852 (class 1259 OID 16515)
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- TOC entry 3853 (class 1259 OID 16516)
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- TOC entry 3854 (class 1259 OID 16700)
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- TOC entry 3857 (class 1259 OID 16787)
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- TOC entry 3860 (class 1259 OID 16892)
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- TOC entry 3910 (class 1259 OID 16829)
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- TOC entry 3911 (class 1259 OID 16894)
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- TOC entry 3912 (class 1259 OID 16844)
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- TOC entry 3915 (class 1259 OID 16843)
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- TOC entry 3877 (class 1259 OID 16895)
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- TOC entry 3878 (class 1259 OID 17065)
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- TOC entry 3881 (class 1259 OID 16786)
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- TOC entry 3902 (class 1259 OID 16811)
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- TOC entry 3905 (class 1259 OID 16810)
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- TOC entry 3900 (class 1259 OID 16796)
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- TOC entry 3901 (class 1259 OID 16958)
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- TOC entry 3890 (class 1259 OID 16955)
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- TOC entry 3882 (class 1259 OID 16784)
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- TOC entry 3844 (class 1259 OID 16864)
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- TOC entry 4489 (class 0 OID 0)
-- Dependencies: 3844
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- TOC entry 3845 (class 1259 OID 16702)
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- TOC entry 3846 (class 1259 OID 16505)
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- TOC entry 3847 (class 1259 OID 16919)
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- TOC entry 3948 (class 1259 OID 17482)
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- TOC entry 3983 (class 1259 OID 17483)
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- TOC entry 3951 (class 1259 OID 17486)
-- Name: subscription_subscription_id_entity_filters_action_filter_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_action_filter_key ON realtime.subscription USING btree (subscription_id, entity, filters, action_filter);


--
-- TOC entry 3956 (class 1259 OID 17190)
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- TOC entry 3959 (class 1259 OID 17207)
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- TOC entry 3977 (class 1259 OID 17401)
-- Name: buckets_analytics_unique_name_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX buckets_analytics_unique_name_idx ON storage.buckets_analytics USING btree (name) WHERE (deleted_at IS NULL);


--
-- TOC entry 3967 (class 1259 OID 17275)
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- TOC entry 3960 (class 1259 OID 17322)
-- Name: idx_name_bucket_level_unique; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX idx_name_bucket_level_unique ON storage.objects USING btree (name COLLATE "C", bucket_id, level);


--
-- TOC entry 3961 (class 1259 OID 17240)
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- TOC entry 3962 (class 1259 OID 17324)
-- Name: idx_objects_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_lower_name ON storage.objects USING btree ((path_tokens[level]), lower(name) text_pattern_ops, bucket_id, level);


--
-- TOC entry 3972 (class 1259 OID 17325)
-- Name: idx_prefixes_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_prefixes_lower_name ON storage.prefixes USING btree (bucket_id, level, ((string_to_array(name, '/'::text))[level]), lower(name) text_pattern_ops);


--
-- TOC entry 3963 (class 1259 OID 17208)
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- TOC entry 3964 (class 1259 OID 17323)
-- Name: objects_bucket_id_level_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX objects_bucket_id_level_idx ON storage.objects USING btree (bucket_id, level, name COLLATE "C");


--
-- TOC entry 3980 (class 1259 OID 17392)
-- Name: vector_indexes_name_bucket_id_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX vector_indexes_name_bucket_id_idx ON storage.vector_indexes USING btree (name, bucket_id);


--
-- TOC entry 4069 (class 2620 OID 17650)
-- Name: configuracoes_site trg_configuracoes_site_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_configuracoes_site_updated_at BEFORE UPDATE ON public.configuracoes_site FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


--
-- TOC entry 4067 (class 2620 OID 17665)
-- Name: imoveis_fotos trg_garantir_uma_capa; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_garantir_uma_capa AFTER INSERT OR UPDATE ON public.imoveis_fotos FOR EACH ROW EXECUTE FUNCTION public.garantir_uma_capa();


--
-- TOC entry 4063 (class 2620 OID 17652)
-- Name: imoveis trg_gerar_codigo_imovel; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_gerar_codigo_imovel BEFORE INSERT ON public.imoveis FOR EACH ROW EXECUTE FUNCTION public.gerar_codigo_imovel();


--
-- TOC entry 4064 (class 2620 OID 17661)
-- Name: imoveis trg_gerar_slug_imovel; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_gerar_slug_imovel BEFORE INSERT ON public.imoveis FOR EACH ROW EXECUTE FUNCTION public.gerar_slug_imovel();


--
-- TOC entry 4065 (class 2620 OID 17649)
-- Name: imoveis trg_imoveis_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_imoveis_updated_at BEFORE UPDATE ON public.imoveis FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


--
-- TOC entry 4068 (class 2620 OID 17663)
-- Name: imoveis_fotos trg_limite_fotos_imovel; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_limite_fotos_imovel BEFORE INSERT ON public.imoveis_fotos FOR EACH ROW EXECUTE FUNCTION public.limitar_fotos_imovel();


--
-- TOC entry 4066 (class 2620 OID 17668)
-- Name: imoveis trg_limite_imoveis_destaque; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_limite_imoveis_destaque BEFORE INSERT OR UPDATE ON public.imoveis FOR EACH ROW EXECUTE FUNCTION public.limitar_imoveis_destaque();


--
-- TOC entry 4055 (class 2620 OID 17112)
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- TOC entry 4056 (class 2620 OID 17332)
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- TOC entry 4057 (class 2620 OID 17363)
-- Name: objects objects_delete_delete_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_delete_delete_prefix AFTER DELETE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- TOC entry 4058 (class 2620 OID 17318)
-- Name: objects objects_insert_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_insert_create_prefix BEFORE INSERT ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.objects_insert_prefix_trigger();


--
-- TOC entry 4059 (class 2620 OID 17362)
-- Name: objects objects_update_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_update_create_prefix BEFORE UPDATE ON storage.objects FOR EACH ROW WHEN (((new.name <> old.name) OR (new.bucket_id <> old.bucket_id))) EXECUTE FUNCTION storage.objects_update_prefix_trigger();


--
-- TOC entry 4061 (class 2620 OID 17328)
-- Name: prefixes prefixes_create_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_create_hierarchy BEFORE INSERT ON storage.prefixes FOR EACH ROW WHEN ((pg_trigger_depth() < 1)) EXECUTE FUNCTION storage.prefixes_insert_trigger();


--
-- TOC entry 4062 (class 2620 OID 17364)
-- Name: prefixes prefixes_delete_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_delete_hierarchy AFTER DELETE ON storage.prefixes FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- TOC entry 4060 (class 2620 OID 17228)
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- TOC entry 4023 (class 2606 OID 16688)
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4028 (class 2606 OID 16777)
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- TOC entry 4027 (class 2606 OID 16765)
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- TOC entry 4026 (class 2606 OID 16752)
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4034 (class 2606 OID 17017)
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- TOC entry 4035 (class 2606 OID 17022)
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4036 (class 2606 OID 17046)
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- TOC entry 4037 (class 2606 OID 17041)
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4033 (class 2606 OID 16943)
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4022 (class 2606 OID 16721)
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- TOC entry 4030 (class 2606 OID 16824)
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- TOC entry 4031 (class 2606 OID 16897)
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- TOC entry 4032 (class 2606 OID 16838)
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- TOC entry 4024 (class 2606 OID 17060)
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- TOC entry 4025 (class 2606 OID 16716)
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4029 (class 2606 OID 16805)
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- TOC entry 4048 (class 2606 OID 17564)
-- Name: imoveis_caracteristicas_rel imoveis_caracteristicas_rel_caracteristica_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imoveis_caracteristicas_rel
    ADD CONSTRAINT imoveis_caracteristicas_rel_caracteristica_id_fkey FOREIGN KEY (caracteristica_id) REFERENCES public.imoveis_caracteristicas(id) ON DELETE CASCADE;


--
-- TOC entry 4049 (class 2606 OID 17559)
-- Name: imoveis_caracteristicas_rel imoveis_caracteristicas_rel_imovel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imoveis_caracteristicas_rel
    ADD CONSTRAINT imoveis_caracteristicas_rel_imovel_id_fkey FOREIGN KEY (imovel_id) REFERENCES public.imoveis(id) ON DELETE CASCADE;


--
-- TOC entry 4050 (class 2606 OID 17586)
-- Name: imoveis_comodidades_rel imoveis_comodidades_rel_comodidade_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imoveis_comodidades_rel
    ADD CONSTRAINT imoveis_comodidades_rel_comodidade_id_fkey FOREIGN KEY (comodidade_id) REFERENCES public.imoveis_comodidades(id) ON DELETE CASCADE;


--
-- TOC entry 4051 (class 2606 OID 17581)
-- Name: imoveis_comodidades_rel imoveis_comodidades_rel_imovel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imoveis_comodidades_rel
    ADD CONSTRAINT imoveis_comodidades_rel_imovel_id_fkey FOREIGN KEY (imovel_id) REFERENCES public.imoveis(id) ON DELETE CASCADE;


--
-- TOC entry 4044 (class 2606 OID 17699)
-- Name: imoveis_fotos imoveis_fotos_imovel_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imoveis_fotos
    ADD CONSTRAINT imoveis_fotos_imovel_fk FOREIGN KEY (imovel_id) REFERENCES public.imoveis(id) ON DELETE CASCADE;


--
-- TOC entry 4045 (class 2606 OID 17514)
-- Name: imoveis_fotos imoveis_fotos_imovel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imoveis_fotos
    ADD CONSTRAINT imoveis_fotos_imovel_id_fkey FOREIGN KEY (imovel_id) REFERENCES public.imoveis(id) ON DELETE CASCADE;


--
-- TOC entry 4047 (class 2606 OID 17542)
-- Name: imoveis_informacoes_adicionais imoveis_informacoes_adicionais_imovel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imoveis_informacoes_adicionais
    ADD CONSTRAINT imoveis_informacoes_adicionais_imovel_id_fkey FOREIGN KEY (imovel_id) REFERENCES public.imoveis(id) ON DELETE CASCADE;


--
-- TOC entry 4046 (class 2606 OID 17529)
-- Name: imoveis_localizacao imoveis_localizacao_imovel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imoveis_localizacao
    ADD CONSTRAINT imoveis_localizacao_imovel_id_fkey FOREIGN KEY (imovel_id) REFERENCES public.imoveis(id) ON DELETE CASCADE;


--
-- TOC entry 4052 (class 2606 OID 17605)
-- Name: imoveis_negociacao_opcoes imoveis_negociacao_opcoes_imovel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imoveis_negociacao_opcoes
    ADD CONSTRAINT imoveis_negociacao_opcoes_imovel_id_fkey FOREIGN KEY (imovel_id) REFERENCES public.imoveis(id) ON DELETE CASCADE;


--
-- TOC entry 4053 (class 2606 OID 17610)
-- Name: imoveis_negociacao_opcoes imoveis_negociacao_opcoes_negociacao_opcao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imoveis_negociacao_opcoes
    ADD CONSTRAINT imoveis_negociacao_opcoes_negociacao_opcao_id_fkey FOREIGN KEY (negociacao_opcao_id) REFERENCES public.negociacao_opcoes(id) ON DELETE CASCADE;


--
-- TOC entry 4054 (class 2606 OID 17624)
-- Name: leads leads_imovel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leads
    ADD CONSTRAINT leads_imovel_id_fkey FOREIGN KEY (imovel_id) REFERENCES public.imoveis(id);


--
-- TOC entry 4038 (class 2606 OID 17202)
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 4042 (class 2606 OID 17305)
-- Name: prefixes prefixes_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT "prefixes_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 4039 (class 2606 OID 17250)
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 4040 (class 2606 OID 17270)
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 4041 (class 2606 OID 17265)
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- TOC entry 4043 (class 2606 OID 17387)
-- Name: vector_indexes vector_indexes_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_vectors(id);


--
-- TOC entry 4221 (class 0 OID 16525)
-- Dependencies: 333
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4232 (class 0 OID 16883)
-- Dependencies: 347
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4223 (class 0 OID 16681)
-- Dependencies: 338
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4220 (class 0 OID 16518)
-- Dependencies: 332
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4227 (class 0 OID 16770)
-- Dependencies: 342
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4226 (class 0 OID 16758)
-- Dependencies: 341
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4225 (class 0 OID 16745)
-- Dependencies: 340
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4233 (class 0 OID 16933)
-- Dependencies: 348
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4219 (class 0 OID 16507)
-- Dependencies: 331
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4230 (class 0 OID 16812)
-- Dependencies: 345
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4231 (class 0 OID 16830)
-- Dependencies: 346
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4222 (class 0 OID 16533)
-- Dependencies: 334
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4224 (class 0 OID 16711)
-- Dependencies: 339
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4229 (class 0 OID 16797)
-- Dependencies: 344
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4228 (class 0 OID 16788)
-- Dependencies: 343
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4218 (class 0 OID 16495)
-- Dependencies: 329
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4250 (class 3256 OID 18941)
-- Name: imoveis Public read; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Public read" ON public.imoveis FOR SELECT USING (true);


--
-- TOC entry 4243 (class 0 OID 17467)
-- Dependencies: 368
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4244 (class 3256 OID 17698)
-- Name: buckets Public delete; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Public delete" ON storage.buckets FOR DELETE USING (true);


--
-- TOC entry 4247 (class 3256 OID 17695)
-- Name: objects Public delete; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Public delete" ON storage.objects FOR DELETE USING (true);


--
-- TOC entry 4246 (class 3256 OID 17696)
-- Name: buckets Public read; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Public read" ON storage.buckets FOR SELECT USING (true);


--
-- TOC entry 4249 (class 3256 OID 17693)
-- Name: objects Public read vua2qs_0; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Public read vua2qs_0" ON storage.objects FOR SELECT USING (true);


--
-- TOC entry 4245 (class 3256 OID 17697)
-- Name: buckets Public upload; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Public upload" ON storage.buckets FOR INSERT WITH CHECK (true);


--
-- TOC entry 4248 (class 3256 OID 17694)
-- Name: objects Public upload vua2qs_0; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Public upload vua2qs_0" ON storage.objects FOR INSERT WITH CHECK (true);


--
-- TOC entry 4235 (class 0 OID 17181)
-- Dependencies: 360
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4240 (class 0 OID 17340)
-- Dependencies: 365
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4241 (class 0 OID 17367)
-- Dependencies: 366
-- Name: buckets_vectors; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_vectors ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4234 (class 0 OID 17173)
-- Dependencies: 359
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4236 (class 0 OID 17191)
-- Dependencies: 361
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4239 (class 0 OID 17295)
-- Dependencies: 364
-- Name: prefixes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.prefixes ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4237 (class 0 OID 17241)
-- Dependencies: 362
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4238 (class 0 OID 17255)
-- Dependencies: 363
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4242 (class 0 OID 17377)
-- Dependencies: 367
-- Name: vector_indexes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.vector_indexes ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4251 (class 6104 OID 16426)
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- TOC entry 4303 (class 0 OID 0)
-- Dependencies: 38
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- TOC entry 4304 (class 0 OID 0)
-- Dependencies: 24
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- TOC entry 4305 (class 0 OID 0)
-- Dependencies: 41
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- TOC entry 4306 (class 0 OID 0)
-- Dependencies: 15
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- TOC entry 4307 (class 0 OID 0)
-- Dependencies: 39
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- TOC entry 4308 (class 0 OID 0)
-- Dependencies: 33
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- TOC entry 4316 (class 0 OID 0)
-- Dependencies: 446
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- TOC entry 4317 (class 0 OID 0)
-- Dependencies: 465
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- TOC entry 4319 (class 0 OID 0)
-- Dependencies: 445
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- TOC entry 4321 (class 0 OID 0)
-- Dependencies: 444
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- TOC entry 4322 (class 0 OID 0)
-- Dependencies: 440
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- TOC entry 4323 (class 0 OID 0)
-- Dependencies: 441
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- TOC entry 4324 (class 0 OID 0)
-- Dependencies: 412
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- TOC entry 4325 (class 0 OID 0)
-- Dependencies: 442
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- TOC entry 4326 (class 0 OID 0)
-- Dependencies: 416
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4327 (class 0 OID 0)
-- Dependencies: 418
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4328 (class 0 OID 0)
-- Dependencies: 409
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- TOC entry 4329 (class 0 OID 0)
-- Dependencies: 408
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- TOC entry 4330 (class 0 OID 0)
-- Dependencies: 415
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4331 (class 0 OID 0)
-- Dependencies: 417
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4332 (class 0 OID 0)
-- Dependencies: 419
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- TOC entry 4333 (class 0 OID 0)
-- Dependencies: 420
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- TOC entry 4334 (class 0 OID 0)
-- Dependencies: 413
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- TOC entry 4335 (class 0 OID 0)
-- Dependencies: 414
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- TOC entry 4337 (class 0 OID 0)
-- Dependencies: 447
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- TOC entry 4339 (class 0 OID 0)
-- Dependencies: 451
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- TOC entry 4341 (class 0 OID 0)
-- Dependencies: 448
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- TOC entry 4342 (class 0 OID 0)
-- Dependencies: 411
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4343 (class 0 OID 0)
-- Dependencies: 410
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- TOC entry 4344 (class 0 OID 0)
-- Dependencies: 396
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO dashboard_user;


--
-- TOC entry 4345 (class 0 OID 0)
-- Dependencies: 395
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- TOC entry 4346 (class 0 OID 0)
-- Dependencies: 397
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO dashboard_user;


--
-- TOC entry 4347 (class 0 OID 0)
-- Dependencies: 443
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- TOC entry 4348 (class 0 OID 0)
-- Dependencies: 439
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- TOC entry 4349 (class 0 OID 0)
-- Dependencies: 433
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- TOC entry 4350 (class 0 OID 0)
-- Dependencies: 435
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4351 (class 0 OID 0)
-- Dependencies: 437
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- TOC entry 4352 (class 0 OID 0)
-- Dependencies: 434
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- TOC entry 4353 (class 0 OID 0)
-- Dependencies: 436
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4354 (class 0 OID 0)
-- Dependencies: 438
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- TOC entry 4355 (class 0 OID 0)
-- Dependencies: 429
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- TOC entry 4356 (class 0 OID 0)
-- Dependencies: 431
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- TOC entry 4357 (class 0 OID 0)
-- Dependencies: 430
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- TOC entry 4358 (class 0 OID 0)
-- Dependencies: 432
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4359 (class 0 OID 0)
-- Dependencies: 425
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- TOC entry 4360 (class 0 OID 0)
-- Dependencies: 427
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- TOC entry 4361 (class 0 OID 0)
-- Dependencies: 426
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- TOC entry 4362 (class 0 OID 0)
-- Dependencies: 428
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- TOC entry 4363 (class 0 OID 0)
-- Dependencies: 421
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- TOC entry 4364 (class 0 OID 0)
-- Dependencies: 423
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- TOC entry 4365 (class 0 OID 0)
-- Dependencies: 422
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- TOC entry 4366 (class 0 OID 0)
-- Dependencies: 424
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- TOC entry 4367 (class 0 OID 0)
-- Dependencies: 449
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- TOC entry 4368 (class 0 OID 0)
-- Dependencies: 450
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- TOC entry 4370 (class 0 OID 0)
-- Dependencies: 452
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- TOC entry 4371 (class 0 OID 0)
-- Dependencies: 403
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- TOC entry 4372 (class 0 OID 0)
-- Dependencies: 404
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- TOC entry 4373 (class 0 OID 0)
-- Dependencies: 405
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- TOC entry 4374 (class 0 OID 0)
-- Dependencies: 406
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- TOC entry 4375 (class 0 OID 0)
-- Dependencies: 407
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- TOC entry 4376 (class 0 OID 0)
-- Dependencies: 398
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- TOC entry 4377 (class 0 OID 0)
-- Dependencies: 399
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- TOC entry 4378 (class 0 OID 0)
-- Dependencies: 401
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- TOC entry 4379 (class 0 OID 0)
-- Dependencies: 400
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- TOC entry 4380 (class 0 OID 0)
-- Dependencies: 402
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- TOC entry 4381 (class 0 OID 0)
-- Dependencies: 464
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- TOC entry 4382 (class 0 OID 0)
-- Dependencies: 382
-- Name: FUNCTION pg_reload_conf(); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pg_catalog.pg_reload_conf() TO postgres WITH GRANT OPTION;


--
-- TOC entry 4383 (class 0 OID 0)
-- Dependencies: 394
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- TOC entry 4384 (class 0 OID 0)
-- Dependencies: 515
-- Name: FUNCTION garantir_uma_capa(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.garantir_uma_capa() TO anon;
GRANT ALL ON FUNCTION public.garantir_uma_capa() TO authenticated;
GRANT ALL ON FUNCTION public.garantir_uma_capa() TO service_role;


--
-- TOC entry 4385 (class 0 OID 0)
-- Dependencies: 508
-- Name: FUNCTION gerar_codigo_imovel(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.gerar_codigo_imovel() TO anon;
GRANT ALL ON FUNCTION public.gerar_codigo_imovel() TO authenticated;
GRANT ALL ON FUNCTION public.gerar_codigo_imovel() TO service_role;


--
-- TOC entry 4386 (class 0 OID 0)
-- Dependencies: 509
-- Name: FUNCTION gerar_slug_imovel(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.gerar_slug_imovel() TO anon;
GRANT ALL ON FUNCTION public.gerar_slug_imovel() TO authenticated;
GRANT ALL ON FUNCTION public.gerar_slug_imovel() TO service_role;


--
-- TOC entry 4387 (class 0 OID 0)
-- Dependencies: 514
-- Name: FUNCTION limitar_fotos_imovel(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.limitar_fotos_imovel() TO anon;
GRANT ALL ON FUNCTION public.limitar_fotos_imovel() TO authenticated;
GRANT ALL ON FUNCTION public.limitar_fotos_imovel() TO service_role;


--
-- TOC entry 4388 (class 0 OID 0)
-- Dependencies: 516
-- Name: FUNCTION limitar_imoveis_destaque(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.limitar_imoveis_destaque() TO anon;
GRANT ALL ON FUNCTION public.limitar_imoveis_destaque() TO authenticated;
GRANT ALL ON FUNCTION public.limitar_imoveis_destaque() TO service_role;


--
-- TOC entry 4389 (class 0 OID 0)
-- Dependencies: 507
-- Name: FUNCTION set_updated_at(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.set_updated_at() TO anon;
GRANT ALL ON FUNCTION public.set_updated_at() TO authenticated;
GRANT ALL ON FUNCTION public.set_updated_at() TO service_role;


--
-- TOC entry 4390 (class 0 OID 0)
-- Dependencies: 511
-- Name: FUNCTION unaccent(text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.unaccent(text) TO postgres;
GRANT ALL ON FUNCTION public.unaccent(text) TO anon;
GRANT ALL ON FUNCTION public.unaccent(text) TO authenticated;
GRANT ALL ON FUNCTION public.unaccent(text) TO service_role;


--
-- TOC entry 4391 (class 0 OID 0)
-- Dependencies: 510
-- Name: FUNCTION unaccent(regdictionary, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.unaccent(regdictionary, text) TO postgres;
GRANT ALL ON FUNCTION public.unaccent(regdictionary, text) TO anon;
GRANT ALL ON FUNCTION public.unaccent(regdictionary, text) TO authenticated;
GRANT ALL ON FUNCTION public.unaccent(regdictionary, text) TO service_role;


--
-- TOC entry 4392 (class 0 OID 0)
-- Dependencies: 512
-- Name: FUNCTION unaccent_init(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.unaccent_init(internal) TO postgres;
GRANT ALL ON FUNCTION public.unaccent_init(internal) TO anon;
GRANT ALL ON FUNCTION public.unaccent_init(internal) TO authenticated;
GRANT ALL ON FUNCTION public.unaccent_init(internal) TO service_role;


--
-- TOC entry 4393 (class 0 OID 0)
-- Dependencies: 513
-- Name: FUNCTION unaccent_lexize(internal, internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.unaccent_lexize(internal, internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.unaccent_lexize(internal, internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.unaccent_lexize(internal, internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.unaccent_lexize(internal, internal, internal, internal) TO service_role;


--
-- TOC entry 4394 (class 0 OID 0)
-- Dependencies: 471
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- TOC entry 4395 (class 0 OID 0)
-- Dependencies: 506
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- TOC entry 4396 (class 0 OID 0)
-- Dependencies: 473
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- TOC entry 4397 (class 0 OID 0)
-- Dependencies: 469
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- TOC entry 4398 (class 0 OID 0)
-- Dependencies: 468
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- TOC entry 4399 (class 0 OID 0)
-- Dependencies: 472
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- TOC entry 4400 (class 0 OID 0)
-- Dependencies: 503
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- TOC entry 4401 (class 0 OID 0)
-- Dependencies: 467
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- TOC entry 4402 (class 0 OID 0)
-- Dependencies: 505
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- TOC entry 4403 (class 0 OID 0)
-- Dependencies: 466
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- TOC entry 4404 (class 0 OID 0)
-- Dependencies: 470
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- TOC entry 4405 (class 0 OID 0)
-- Dependencies: 504
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- TOC entry 4406 (class 0 OID 0)
-- Dependencies: 454
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- TOC entry 4407 (class 0 OID 0)
-- Dependencies: 456
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- TOC entry 4408 (class 0 OID 0)
-- Dependencies: 457
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- TOC entry 4410 (class 0 OID 0)
-- Dependencies: 333
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- TOC entry 4412 (class 0 OID 0)
-- Dependencies: 347
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- TOC entry 4415 (class 0 OID 0)
-- Dependencies: 338
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- TOC entry 4417 (class 0 OID 0)
-- Dependencies: 332
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- TOC entry 4419 (class 0 OID 0)
-- Dependencies: 342
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- TOC entry 4421 (class 0 OID 0)
-- Dependencies: 341
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- TOC entry 4424 (class 0 OID 0)
-- Dependencies: 340
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- TOC entry 4425 (class 0 OID 0)
-- Dependencies: 350
-- Name: TABLE oauth_authorizations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_authorizations TO postgres;
GRANT ALL ON TABLE auth.oauth_authorizations TO dashboard_user;


--
-- TOC entry 4427 (class 0 OID 0)
-- Dependencies: 352
-- Name: TABLE oauth_client_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_client_states TO postgres;
GRANT ALL ON TABLE auth.oauth_client_states TO dashboard_user;


--
-- TOC entry 4428 (class 0 OID 0)
-- Dependencies: 349
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- TOC entry 4429 (class 0 OID 0)
-- Dependencies: 351
-- Name: TABLE oauth_consents; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_consents TO postgres;
GRANT ALL ON TABLE auth.oauth_consents TO dashboard_user;


--
-- TOC entry 4430 (class 0 OID 0)
-- Dependencies: 348
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- TOC entry 4432 (class 0 OID 0)
-- Dependencies: 331
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- TOC entry 4434 (class 0 OID 0)
-- Dependencies: 330
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- TOC entry 4436 (class 0 OID 0)
-- Dependencies: 345
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- TOC entry 4438 (class 0 OID 0)
-- Dependencies: 346
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- TOC entry 4440 (class 0 OID 0)
-- Dependencies: 334
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- TOC entry 4445 (class 0 OID 0)
-- Dependencies: 339
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- TOC entry 4447 (class 0 OID 0)
-- Dependencies: 344
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- TOC entry 4450 (class 0 OID 0)
-- Dependencies: 343
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- TOC entry 4453 (class 0 OID 0)
-- Dependencies: 329
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- TOC entry 4454 (class 0 OID 0)
-- Dependencies: 328
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- TOC entry 4455 (class 0 OID 0)
-- Dependencies: 327
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- TOC entry 4456 (class 0 OID 0)
-- Dependencies: 381
-- Name: TABLE configuracoes_fotos; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.configuracoes_fotos TO anon;
GRANT ALL ON TABLE public.configuracoes_fotos TO authenticated;
GRANT ALL ON TABLE public.configuracoes_fotos TO service_role;


--
-- TOC entry 4457 (class 0 OID 0)
-- Dependencies: 380
-- Name: TABLE configuracoes_site; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.configuracoes_site TO anon;
GRANT ALL ON TABLE public.configuracoes_site TO authenticated;
GRANT ALL ON TABLE public.configuracoes_site TO service_role;


--
-- TOC entry 4459 (class 0 OID 0)
-- Dependencies: 369
-- Name: TABLE imoveis; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.imoveis TO anon;
GRANT ALL ON TABLE public.imoveis TO authenticated;
GRANT ALL ON TABLE public.imoveis TO service_role;


--
-- TOC entry 4460 (class 0 OID 0)
-- Dependencies: 373
-- Name: TABLE imoveis_caracteristicas; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.imoveis_caracteristicas TO anon;
GRANT ALL ON TABLE public.imoveis_caracteristicas TO authenticated;
GRANT ALL ON TABLE public.imoveis_caracteristicas TO service_role;


--
-- TOC entry 4461 (class 0 OID 0)
-- Dependencies: 374
-- Name: TABLE imoveis_caracteristicas_rel; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.imoveis_caracteristicas_rel TO anon;
GRANT ALL ON TABLE public.imoveis_caracteristicas_rel TO authenticated;
GRANT ALL ON TABLE public.imoveis_caracteristicas_rel TO service_role;


--
-- TOC entry 4462 (class 0 OID 0)
-- Dependencies: 375
-- Name: TABLE imoveis_comodidades; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.imoveis_comodidades TO anon;
GRANT ALL ON TABLE public.imoveis_comodidades TO authenticated;
GRANT ALL ON TABLE public.imoveis_comodidades TO service_role;


--
-- TOC entry 4463 (class 0 OID 0)
-- Dependencies: 376
-- Name: TABLE imoveis_comodidades_rel; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.imoveis_comodidades_rel TO anon;
GRANT ALL ON TABLE public.imoveis_comodidades_rel TO authenticated;
GRANT ALL ON TABLE public.imoveis_comodidades_rel TO service_role;


--
-- TOC entry 4464 (class 0 OID 0)
-- Dependencies: 370
-- Name: TABLE imoveis_fotos; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.imoveis_fotos TO anon;
GRANT ALL ON TABLE public.imoveis_fotos TO authenticated;
GRANT ALL ON TABLE public.imoveis_fotos TO service_role;


--
-- TOC entry 4465 (class 0 OID 0)
-- Dependencies: 372
-- Name: TABLE imoveis_informacoes_adicionais; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.imoveis_informacoes_adicionais TO anon;
GRANT ALL ON TABLE public.imoveis_informacoes_adicionais TO authenticated;
GRANT ALL ON TABLE public.imoveis_informacoes_adicionais TO service_role;


--
-- TOC entry 4466 (class 0 OID 0)
-- Dependencies: 371
-- Name: TABLE imoveis_localizacao; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.imoveis_localizacao TO anon;
GRANT ALL ON TABLE public.imoveis_localizacao TO authenticated;
GRANT ALL ON TABLE public.imoveis_localizacao TO service_role;


--
-- TOC entry 4467 (class 0 OID 0)
-- Dependencies: 378
-- Name: TABLE imoveis_negociacao_opcoes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.imoveis_negociacao_opcoes TO anon;
GRANT ALL ON TABLE public.imoveis_negociacao_opcoes TO authenticated;
GRANT ALL ON TABLE public.imoveis_negociacao_opcoes TO service_role;


--
-- TOC entry 4468 (class 0 OID 0)
-- Dependencies: 379
-- Name: TABLE leads; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.leads TO anon;
GRANT ALL ON TABLE public.leads TO authenticated;
GRANT ALL ON TABLE public.leads TO service_role;


--
-- TOC entry 4469 (class 0 OID 0)
-- Dependencies: 377
-- Name: TABLE negociacao_opcoes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.negociacao_opcoes TO anon;
GRANT ALL ON TABLE public.negociacao_opcoes TO authenticated;
GRANT ALL ON TABLE public.negociacao_opcoes TO service_role;


--
-- TOC entry 4470 (class 0 OID 0)
-- Dependencies: 368
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- TOC entry 4471 (class 0 OID 0)
-- Dependencies: 353
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- TOC entry 4472 (class 0 OID 0)
-- Dependencies: 356
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- TOC entry 4473 (class 0 OID 0)
-- Dependencies: 355
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- TOC entry 4475 (class 0 OID 0)
-- Dependencies: 360
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.buckets FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.buckets TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO postgres WITH GRANT OPTION;


--
-- TOC entry 4476 (class 0 OID 0)
-- Dependencies: 365
-- Name: TABLE buckets_analytics; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets_analytics TO service_role;
GRANT ALL ON TABLE storage.buckets_analytics TO authenticated;
GRANT ALL ON TABLE storage.buckets_analytics TO anon;


--
-- TOC entry 4477 (class 0 OID 0)
-- Dependencies: 366
-- Name: TABLE buckets_vectors; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.buckets_vectors TO service_role;
GRANT SELECT ON TABLE storage.buckets_vectors TO authenticated;
GRANT SELECT ON TABLE storage.buckets_vectors TO anon;


--
-- TOC entry 4479 (class 0 OID 0)
-- Dependencies: 361
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.objects FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.objects TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO postgres WITH GRANT OPTION;


--
-- TOC entry 4480 (class 0 OID 0)
-- Dependencies: 364
-- Name: TABLE prefixes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.prefixes TO service_role;
GRANT ALL ON TABLE storage.prefixes TO authenticated;
GRANT ALL ON TABLE storage.prefixes TO anon;


--
-- TOC entry 4481 (class 0 OID 0)
-- Dependencies: 362
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- TOC entry 4482 (class 0 OID 0)
-- Dependencies: 363
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- TOC entry 4483 (class 0 OID 0)
-- Dependencies: 367
-- Name: TABLE vector_indexes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.vector_indexes TO service_role;
GRANT SELECT ON TABLE storage.vector_indexes TO authenticated;
GRANT SELECT ON TABLE storage.vector_indexes TO anon;


--
-- TOC entry 4484 (class 0 OID 0)
-- Dependencies: 335
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- TOC entry 4485 (class 0 OID 0)
-- Dependencies: 336
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- TOC entry 2528 (class 826 OID 16553)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- TOC entry 2529 (class 826 OID 16554)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- TOC entry 2527 (class 826 OID 16552)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- TOC entry 2538 (class 826 OID 16632)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- TOC entry 2537 (class 826 OID 16631)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- TOC entry 2536 (class 826 OID 16630)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- TOC entry 2541 (class 826 OID 16587)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2540 (class 826 OID 16586)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2539 (class 826 OID 16585)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 2533 (class 826 OID 16567)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2535 (class 826 OID 16566)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2534 (class 826 OID 16565)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 2520 (class 826 OID 16490)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2521 (class 826 OID 16491)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2519 (class 826 OID 16489)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2523 (class 826 OID 16493)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2518 (class 826 OID 16488)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 2522 (class 826 OID 16492)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 2531 (class 826 OID 16557)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- TOC entry 2532 (class 826 OID 16558)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- TOC entry 2530 (class 826 OID 16556)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- TOC entry 2526 (class 826 OID 16546)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2525 (class 826 OID 16545)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2524 (class 826 OID 16544)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 3709 (class 3466 OID 16571)
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- TOC entry 3714 (class 3466 OID 16650)
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- TOC entry 3708 (class 3466 OID 16569)
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- TOC entry 3715 (class 3466 OID 16653)
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- TOC entry 3710 (class 3466 OID 16572)
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- TOC entry 3711 (class 3466 OID 16573)
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

-- Completed on 2026-02-09 09:56:12

--
-- PostgreSQL database dump complete
--

\unrestrict x1NfRcPp0mbluLRymn8Joa78tehW9FFzw12UnNcedIl8atMfzY8bKChZFzyWyn2

