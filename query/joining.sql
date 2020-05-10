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


-- INNER JOIN

-- matching values in both tables

SELECT
  city.name AS city, country.name AS country
FROM
  city
INNER JOIN country ON city.country = country.id;

/*
   city    |         country
-----------+--------------------------
 edinburgh | united kingdom
 geneva    | switzerland
 london    | united kingdom
 new york  | united states of america
 san diego | united states of america
*/



-- LEFT (OUTER) JOIN

-- all from the left table only matching in right table

SELECT
  city.name AS city, country.name AS country
FROM
  city
LEFT JOIN country ON city.country = country.id;

/*
   city    |         country
-----------+--------------------------
 edinburgh | united kingdom
 geneva    | switzerland
 london    | united kingdom
 new york  | united states of america
 paris     |
 san diego | united states of america
*/



-- RIGHT (OUTER) JOIN

-- all from the right table only matching in left table

/*
   city    |         country
-----------+--------------------------
 edinburgh | united kingdom
 geneva    | switzerland
 london    | united kingdom
 new york  | united states of america
 san diego | united states of america
           | spain
           | ceylon
           | china
*/


-- FULL (OUTER) JOIN

-- returns all records regardless of match

SELECT
  city.name AS city, country.name AS country
FROM
  city
FULL JOIN country ON city.country = country.id;

/*
  city    |         country
-----------+--------------------------
 edinburgh | united kingdom
 geneva    | switzerland
 london    | united kingdom
 new york  | united states of america
 paris     |
 san diego | united states of america
           | spain
           | ceylon
           | china
*/


-- CROSS JOIN

-- returns all recorders in right with each entry in left; cartesian product

SELECT
  country.name AS country, uk_cities.name AS city
FROM 
  (SELECT * FROM city WHERE city.country = 1) AS uk_cities
CROSS JOIN country;

/*
         country          |   city    
--------------------------+-----------
 ceylon                   | edinburgh
 ceylon                   | london
 china                    | edinburgh
 china                    | london
 spain                    | edinburgh
 spain                    | london
 switzerland              | edinburgh
 switzerland              | london
 united kingdom           | edinburgh
 united kingdom           | london
 united states of america | edinburgh
 united states of america | london
*/
