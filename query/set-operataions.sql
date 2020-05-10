/*
------------
sales2020q1
------------

 name |  sales_generated
------+------------------
 mike |   10000
 jane |   3400
 gran |   45

------------
sales2020q2
------------

 name |  sales_generated
------+------------------
 mike |   3240
 jane |   567
 gran |   40

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


-- combines results of multiples queries into a single result

-- UNION; appends and removes duplicate rows, all must have same columns

SELECT * FROM sales2020q1
UNION
SELECT * FROM sales2020q2;

/*
 name |  sales_generated
------+------------------
 mike |   13240
 jane |   3967
 gran |   95
*/


-- UNION ALL; does not remove duplicate rows

SELECT * FROM sales2020q1
UNION ALL
SELECT * FROM sales2020q2;

/*
 name |  sales_generated
------+------------------
 mike |   3240
 jane |   567
 gran |   40
 mike |   10000
 jane |   3400
 gran |   45
*/


-- INTERSECT; set(this).intersection(that)

-- only show country ids that are present in both country and city tables

SELECT id AS country_id FROM country
INTERSECT
SELECT country FROM city;

/*
 country_id
------------
          4
          2
          1
*/


-- EXCEPT; opposite of INTERSECT

SELECT id AS country_id FROM country
EXCEPT
SELECT country FROM city;

/*
 country_id
------------
          5
          6
          3
*/
