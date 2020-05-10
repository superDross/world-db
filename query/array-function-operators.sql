/*

--------
CURRENCY
--------

 id |         name         | code | symbol |             nicknames
----+----------------------+------+--------+------------------------------------
  1 | united states dollar | usd  | $      | {bucks,deuce,deniro,bill,smackers}
  2 | swiss franch         | chf  | fr.    | {stutz,balles,balle}
  3 | pound sterling       | gbp  | £      | {quid,dosh}
  4 | renminbi             | cny  | ¥      | {}
  5 | euro                 | eur  | €      | {}
  6 | srk lankan rupee     | lkr  | රු      | {}
*/


-- RESOURCES
-- https://www.postgresql.org/docs/12/functions-array.html


-- ANY IN ARRAY
-- any(x in nicknames for x in ['bucks', 'quid'])

SELECT
  name, nicknames
FROM
  currency
WHERE array['bucks', 'quid'] && nicknames;

/*
         name         |             nicknames
----------------------+------------------------------------
 united states dollar | {bucks,deuce,deniro,bill,smackers}
 pound sterling       | {quid,dosh}
*/


-- ALL IN ARRAY
-- all(x in nicknames for x in ['bucks', 'quid'])

SELECT
  name, nicknames
FROM
  currency
WHERE array['bucks', 'deuce'] <@ nicknames;

/*
        name         |             nicknames
----------------------+------------------------------------
 united states dollar | {bucks,deuce,deniro,bill,smackers}
*/
