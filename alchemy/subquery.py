"""
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

"""

from sqlalchemy.sql import func

from models import City, Country
from utils import get_session

session = get_session()


# SUBQUERY - only get city names whoes rspective country has a population over 100 million
subquery = session.query(Country.id).filter(Country.population > 100000000).subquery()
query = session.query(City).filter(City.country_id.in_(subquery))
print(query.all())

# [City(name=San Diego), City(name=New York)]


# ALL - all above the average population
subquery = session.query(func.avg(City.population)).subquery()
query = session.query(City.name).filter(City.population > subquery)
print(query.all())

# [('london',), ('new york',)]


# EXISTS - test for existence with rows
subquery = (
    session.query(Country.id)
    .filter(City.country_id == Country.id)
    .filter(Country.population > 50000000).subquery()
)
query = session.query(City.name).filter(City.country_id.in_(subquery))
print(query.all())

# [('london',), ('san diego',), ('new york',), ('edinburgh',)]
