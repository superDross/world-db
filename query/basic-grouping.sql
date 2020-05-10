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


-- GROUP BY country and add all city populations to each city


-- COUNT
-- the number of countries that drive on left and right

SELECT
  driving_side, count(name)
FROM
  country
GROUP BY driving_side;

/*
driving_side | count
--------------+-------
 left         |     2
 right        |     4
*/


-- HAVING; where clause specifically for group by

SELECT
  driving_side, count(name)
FROM
  country
GROUP BY driving_side
HAVING count(name) > 2;

/*
driving_side | count
--------------+-------
 right        |     4
*/


-- MULTIPLE GROUP BY

SELECT
  driving_side, still_exist, count(name)
FROM
  country
GROUP BY driving_side, still_exists;

/*
driving_side | still_exists | count
--------------+--------------+-------
 right        | t            |     4
 left         | t            |     1
 left         | f            |     1
*/


-- SUM
-- the total city populations for each country

SELECT
  country, SUM (population)
FROM
  city
GROUP BY country
ORDER BY SUM (population) DESC;

/*
 country |   sum
---------+---------
       1 | 9396131
       2 | 9482535
       4 |  201741
*/


-- as above with join for country names

SELECT
  country.name AS country, SUM (city.population)
FROM
  city
INNER JOIN country ON city.country = country.id
GROUP BY country.name
ORDER BY SUM (population) DESC;

/*
           country        |   sum
--------------------------+---------
 united states of america | 9482535
 united kingdom           | 9396131
 switzerland              |  201741
*/


