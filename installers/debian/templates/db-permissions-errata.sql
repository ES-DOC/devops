-- Schema permissions.
GRANT USAGE ON SCHEMA esdoc_db_errata TO esdoc_dbuser_errata;

-- Table permissions.
GRANT INSERT, UPDATE, DELETE, SELECT ON ALL TABLES IN SCHEMA esdoc_db_errata TO esdoc_dbuser_errata;

-- Sequence permissions.
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA esdoc_db_errata TO esdoc_dbuser_errata;
