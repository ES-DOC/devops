-- Create schema.
CREATE SCHEMA docs;

-- Schema permissions.
GRANT USAGE ON SCHEMA docs TO esdoc_dbuser_documentation;

-- Table permissions.
GRANT INSERT, UPDATE, DELETE, SELECT ON ALL TABLES IN SCHEMA docs TO esdoc_dbuser_documentation;

-- Sequence permissions.
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA docs TO esdoc_dbuser_documentation;
