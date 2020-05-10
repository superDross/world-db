/*
TABLES

- paris has no country
- ceylon, spain, china have no cities

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

---------
 COUNTRY
---------

 id |           name           | population |  area   | driving_side | iso_code | currency
----+--------------------------+------------+---------+--------------+----------+----------
  1 | united kingdom           |   67886004 |  242495 | left         | gb       |        3
  2 | united states of america |  328239523 | 3796742 | right        | us       |        1
  3 | china                    | 1427647786 | 9596961 | right        | cn       |        4
  4 | switzerland              |    8570146 |   41285 | right        | ch       |        2
  5 | spain                    |  470007367 |  505990 | right        | es       |        5
  6 | ceylon                   |   12800000 |   65610 | left         | lk       |        6

*/


-- SUBQUERY

-- only get city names whoms respective country has a population over 100 million
SELECT
  name
FROM
  city
WHERE
  country IN (
    SELECT id FROM country WHERE population > 100000000
  );

/*
   name
-----------
 san diego
 new york
*/

-- ANY; same as IN

SELECT
  name
FROM
  city
WHERE
  country = ANY (
    SELECT id FROM country WHERE population > 100000000
  );

/*
   name
-----------
 san diego
 new york
*/


-- ALL; find all cities whoms populations are greater than average

SELECT
  name
FROM
  city
WHERE
  population > ALL (
    SELECT AVG (population) FROM city
  );


-- EXISTS; test for existence of rows in a subquery

SELECT
  name
FROM
  city
WHERE EXISTS (
  SELECT 1 FROM country WHERE city.country = country.id AND population > 50000000
);
