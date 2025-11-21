-- SELECT * FROM duckdb_extensions();

------------------------------------------------------------
-- 1. Install and load DuckLake
------------------------------------------------------------
INSTALL ducklake;
LOAD ducklake;

------------------------------------------------------------
-- 2. Attach a DuckLake catalog using local DuckDB metadata
--    - metadata stored in ducklake_meta.db
--    - parquet files stored in folder: ducklake_data/
------------------------------------------------------------
ATTACH 'duckdb:ducklake_meta.db'
    AS my_ducklake
    (TYPE ducklake, DATA_PATH 'ducklake_data');

------------------------------------------------------------
-- 3. Create a schema for DuckLake tables
------------------------------------------------------------
CREATE SCHEMA IF NOT EXISTS my_ducklake.lake;

------------------------------------------------------------
-- 4. Create a DuckLake table
------------------------------------------------------------
CREATE TABLE my_ducklake.lake.who_ambient_air_quality_2024 AS
SELECT *
FROM read_csv_auto(
    's3://us-prd-motherduck-open-datasets/who_ambient_air_quality/csv/who_ambient_air_quality_database_version_2024.csv'
);

------------------------------------------------------------
-- 5. Query the table to verify everything worked
------------------------------------------------------------
SELECT *
FROM my_ducklake.lake.who_ambient_air_quality_2024
LIMIT 20;

------------------------------------------------------------
-- 6. View DuckLake snapshots to confirm versioning
------------------------------------------------------------
SELECT *
FROM my_ducklake.snapshots();
