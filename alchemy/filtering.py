"""
SQLAlchemy equivalent - query/filter.sql

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
"""

from pprint import pprint as print

from sqlalchemy import and_, not_

from models import City
from utils import get_session

session = get_session()


# FILTER - cities with population over 1 mil, limit to top 3
pop = (
    session.query(City)
    .filter(and_(City.population > 1000000, City.country != None))
    .order_by(City.population.desc())
    .limit(3)
)
actual = [(p.name, p.population, p.country.name) for p in pop.all()]
expected = [
    ("london", 8908081, "united kingdom"),
    ("new york", 8175133, "united states of america"),
    ("san diego", 1307402, "united states of america"),
]
assert actual == expected

# alternatively - multiple filters instead of and
pop = (
    session.query(City)
    .filter(City.population > 1000000)
    .filter(City.country != None)  # HERE
    .order_by(City.population.desc())
    .limit(3)
)
actual = [(p.name, p.population, p.country.name) for p in pop.all()]
assert actual == expected


#  OFFSET - skip the first 2 rows and limit/fetch the first 2 rows
pop = session.query(City.name).order_by(City.id).offset(2).limit(2)
assert pop.all() == [("new york",), ("san diego",)]


# IN clause
pop = (
    session.query(City.name, City.population)
    .filter(not_(City.name.in_(["paris", "london"])))
    .order_by(City.population.desc())
)
expected = [
    ("new york", 8175133),
    ("san diego", 1307402),
    ("edinburgh", 488050),
    ("geneva", 201741),
]
assert pop.all() == expected


# BETWEEN integers
pop = (
    session.query(City.name, City.population)
    .filter(City.population.between(100000, 1000000))
    .order_by(City.population.desc())
)
expected = [("edinburgh", 488050), ("geneva", 201741)]
assert pop.all() == expected

# alternatively - use gt/lt operators
pop = (
    session.query(City.name, City.population)
    .filter(and_(City.population > 100000, City.population < 1000000))  # HERE
    .order_by(City.population.desc())
)
assert pop.all() == expected


# LIKE/ILIKE
pop = session.query(City.name).filter(City.name.ilike("%_e%")).order_by(City.id.desc())
expected = [("geneva",), ("san diego",), ("new york",)]
assert pop.all() == expected
