#!/bin/bash
set -e
export PGPASSWORD=$ECOMM_DB_PASS;
psql -v ON_ERROR_STOP=1 --username "$ECOMM_DB_USER" --dbname "$TENANT_DB_NAME" <<-EOSQL
  BEGIN;
    CREATE EXTENSION pg_trgm;

    
  COMMIT;

EOSQL