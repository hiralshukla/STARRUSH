-- run_all.sql
-- Runs STARRUSH database scripts in order

PROMPT ============================
PROMPT Running 01_create_tables.sql
PROMPT ============================

@01_create_tables.sql

PROMPT ============================
PROMPT Running 02_insert_sample_data.sql
PROMPT ============================

@02_insert_sample_data.sql

PROMPT ============================
PROMPT Running 03_queries.sql
PROMPT ============================

@03_queries.sql

PROMPT ============================
PROMPT Running 04_views.sql
PROMPT ============================

@04_views.sql

PROMPT ============================
PROMPT Done running all scripts.
PROMPT ============================

EXIT;