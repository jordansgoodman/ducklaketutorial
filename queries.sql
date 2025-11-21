-- Install & load extension
INSTALL ducklake;
LOAD ducklake;

-- Attach the catalog
ATTACH 'duckdb:ducklake_meta.db'
    AS my_ducklake
    (TYPE ducklake, DATA_PATH 'ducklake_data');


-- 2. Query specific version (replace N with actual version)
SELECT *
FROM my_ducklake.lake.who_ambient_air_quality_2024
AT (VERSION => 3);
