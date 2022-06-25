-- Schema permissions.
GRANT USAGE ON SCHEMA errata TO ws_errata_user_app;

-- Table permissions.
GRANT INSERT, UPDATE, DELETE, SELECT ON ALL TABLES IN SCHEMA errata TO ws_errata_user_app;

-- Sequence permissions.
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA errata TO ws_errata_user_app;
