-- Schema permissions.
GRANT USAGE ON SCHEMA esdoc_db_documentation TO esdoc_dbuser_documentation;

-- Table permissions.
GRANT INSERT, UPDATE, DELETE, SELECT ON ALL TABLES IN SCHEMA esdoc_db_documentation TO esdoc_dbuser_documentation;

-- Sequence permissions.
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA esdoc_db_documentation TO esdoc_dbuser_documentation;
