from pprint import pprint as print
from models import Country, City, Currency, Language
from utils import get_session
from sqlalchemy import inspect


session = get_session()

countries = session.query(Country).all()

cities = session.query(City).all()

english = session.query(Language).filter(Language.iso_code== 'en').first()

currency = session.query(Currency).all()

print(currency[0].countries[0])

print(countries[0].languages)

print(english.countries)
print(english.__dict__)
