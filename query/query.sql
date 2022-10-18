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

-- DISTINCT entries in a column that is not null

SELECT DISTINCT
  country
FROM
  city
ORDER BY
  country;

/*
 country 
---------
       1
       2
       4
*/

-- CASE conditional expression (postgres if/else)

SELECT name,
  CASE
    WHEN population >= 1000000 THEN 'large'
    WHEN population < 1000000 THEN 'small'
  END AS size
from city;

/*
   name    | size  
-----------+-------
 paris     | large
 london    | large
 geneva    | small
 san diego | large
 new york  | large
 edinburgh | small
*/
