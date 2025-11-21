------------------------------------------------------------
-- Install + load DuckLake (if running in a new SQL file)
------------------------------------------------------------
INSTALL ducklake;
LOAD ducklake;

------------------------------------------------------------
-- Reattach your DuckLake catalog
------------------------------------------------------------
ATTACH 'duckdb:ducklake_meta.db'
    AS my_ducklake
    (TYPE ducklake, DATA_PATH 'ducklake_data');

------------------------------------------------------------
-- Insert additional rows into the DuckLake table
INSERT INTO my_ducklake.lake.who_ambient_air_quality_2024 VALUES
(
    'AMRO', 'USA', 'United States', 'Houston', '2024', 'v1',
    '42', '14', '22',
    '0.85', '0.76', '0.68',
    'Urban Background',
    'EPA 2024 Air Quality Dataset',
    'https://www.epa.gov/outdoor-air-quality-data',
    '2300000', 'US Census 2020',
    29.7604, -95.3698,
    1001
),
(
    'EURO', 'DEU', 'Germany', 'Berlin', '2024', 'v1',
    '28', '10', '18',
    '0.92', '0.88', '0.75',
    'Traffic',
    'German Environment Agency 2024',
    'https://www.umweltbundesamt.de',
    '3600000', 'DE Census 2020',
    52.5200, 13.4050,
    1002
),
(
    'SEARO', 'IND', 'India', 'Mumbai', '2024', 'v1',
    '92', '48', '32',
    '0.70', '0.62', '0.55',
    'Mixed',
    'India National Air Monitoring Programme',
    'https://cpcb.nic.in',
    '12400000', 'India Census 2011',
    19.0760, 72.8777,
    1003
),
(
    'WPRO', 'JPN', 'Japan', 'Tokyo', '2024', 'v1',
    '30', '9', '13',
    '0.90', '0.86', '0.79',
    'Urban Background',
    'Japan Environmental Monitoring Center',
    'https://www.env.go.jp',
    '13960000', 'Japan Stats Bureau',
    35.6895, 139.6917,
    1004
),
(
    'AMRO', 'BRA', 'Brazil', 'São Paulo', '2024', 'v1',
    '55', '18', '25',
    '0.75', '0.70', '0.65',
    'Urban Background',
    'IBAMA 2024',
    'https://www.ibama.gov.br',
    '12300000', 'Brazil Census 2022',
    -23.5505, -46.6333,
    1005
);
