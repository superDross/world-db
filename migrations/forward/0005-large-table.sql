-- just a random table with a huge number of rows purely for testing purposes
CREATE TABLE large_table (
    id SERIAL PRIMARY KEY,
	animal TEXT,
	region TEXT,
    string TEXT,
    number INTEGER,
	date_created DATE DEFAULT CURRENT_DATE
);


INSERT INTO large_table (string, number, animal, region, date_created)
SELECT
    MD5(RANDOM()::TEXT),                                      -- Example: Generate random text
    FLOOR(RANDOM() * 1000),                                   -- Example: Generate random integer
    CASE FLOOR(RANDOM() * 3) + 1
        WHEN 1 THEN 'cat'
        WHEN 2 THEN 'dog'
        ELSE 'whale'
    END AS animal,
    CASE FLOOR(RANDOM() * 2) + 1
        WHEN 1 THEN 'emea'
        ELSE 'apac'
    END AS region,
    DATE '2023-01-01' + (RANDOM() * 365) * INTERVAL '1 day' AS date_created
FROM
	GENERATE_SERIES(1, 10000000);                             -- Generate 10 million rows
