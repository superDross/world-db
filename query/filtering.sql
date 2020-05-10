/*
------
 CITY
------

 id |   name    | country | population |  area  | capital
----+-----------+---------+------------+--------+---------
  1 | london    |       1 |    8908081 |   1572 | t
  2 | edinburgh |       1 |     488050 |    264 | f
  3 | new york  |       2 |    8175133 | 468484 | f
  4 | san diego |       2 |    1307402 |    964 | f
  5 | geneva    |       4 |     201741 |     15 | f
  6 | paris     |         |    2148271 |    105 | t
*/


-- cities with populations over 1 mil, limit to top 3

SELECT
  name, population, country
FROM
  city
WHERE
  population > 1000000
AND
  country IS NOT NULL
ORDER BY population DESC
LIMIT 3;

/*
   name    | population | country 
-----------+------------+---------
 london    |    8908081 |       1
 new york  |    8175133 |       2
 san diego |    1307402 |       2
*/


-- FETCH is like LIMIT, but is an sql standard; they are the same.

-- OFFSET the first 2 rows returned and limit those returned further.

SELECT
  *
FROM
  city
OFFSET
  2 ROWS
FETCH
  FIRST 2 ROWS ONLY;

/*
 id |   name    | country | population |  area  | founded | capital
----+-----------+---------+------------+--------+---------+---------
  3 | new york  |       2 |    8175133 | 468484 |    1624 | f
  4 | san diego |       2 |    1307402 |    964 |    1769 | f
*/


-- IN clause

SELECT
  name, population
FROM
  city
WHERE
  name NOT IN ('paris', 'london')
ORDER BY population DESC;

/*
   name    | population
-----------+------------
 new york  |    8175133
 san diego |    1307402
 edinburgh |     488050
 geneva    |     201741
*/


-- BETWEEN integers

SELECT
  name, population
FROM
  city
WHERE
  population BETWEEN 100000 AND 1000000
ORDER BY population DESC;

/*
  name    | population
-----------+------------
 edinburgh |     488050
 geneva    |     201741
*/


-- LIKE & ILIKE

-- '_' not startswith, '%' is like '.*' in regex

-- if 'E'.lower() in name and not name.startswith('E'.lower())
SELECT
  name
FROM
  city
WHERE
  name ILIKE '%_e%'

/*
  name
-----------
 geneva
 new york
 san diego
*/
