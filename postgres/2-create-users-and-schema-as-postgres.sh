#!/bin/bash
set -e
export PGPASSWORD=$POSTGRES_PASSWORD;
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER"  --dbname "$TENANT_DB_NAME" <<-EOSQL
  BEGIN;
    CREATE USER $ECOMM_DB_USER WITH PASSWORD '$ECOMM_DB_PASS';
    GRANT CONNECT ON DATABASE $TENANT_DB_NAME TO $ECOMM_DB_USER;
    GRANT ALL PRIVILEGES ON DATABASE $TENANT_DB_NAME TO $ECOMM_DB_USER;
    ALTER DATABASE "etownmall" SET bytea_output = 'escape';
  COMMIT;

EOSQL