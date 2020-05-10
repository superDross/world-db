-- MUTLI TABLE JOIN

SELECT
  city.name AS city,
  country.name AS country,
  concat(currency.code, ' (', currency.symbol, ')') AS currency
FROM
  country
INNER JOIN city ON country.id = city.country
INNER JOIN currency ON country.currency = currency.id;

/*
   city    |         country          | currency
-----------+--------------------------+-----------
 london    | united kingdom           | gbp (£)
 edinburgh | united kingdom           | gbp (£)
 new york  | united states of america | usd ($)
 san diego | united states of america | usd ($)
 geneva    | switzerland              | chf (fr.)
(5 rows)
*/


