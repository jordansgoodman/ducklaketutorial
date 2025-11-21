
INSTALL ducklake;
LOAD ducklake;


ATTACH 'duckdb:ducklake_meta.db'
    AS my_ducklake
    (TYPE ducklake, DATA_PATH 'ducklake_data');


CREATE SCHEMA IF NOT EXISTS my_ducklake.lake;

CREATE TABLE my_ducklake.lake.who_ambient_air_quality_2024 AS
SELECT *
FROM read_csv_auto(
    's3://us-prd-motherduck-open-datasets/who_ambient_air_quality/csv/who_ambient_air_quality_database_version_2024.csv'
);

SELECT *
FROM my_ducklake.lake.who_ambient_air_quality_2024
LIMIT 20;


SELECT *
FROM my_ducklake.snapshots();
