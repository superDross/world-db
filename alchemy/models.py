import datetime

from sqlalchemy import (
    ARRAY,
    CHAR,
    Boolean,
    CheckConstraint,
    Column,
    Date,
    DateTime,
    ForeignKey,
    Integer,
    String,
    Table,
    Text,
    text,
)
from sqlalchemy.dialects.postgresql import JSONB
from sqlalchemy.ext.declarative import declarative_base, declared_attr
from sqlalchemy.orm import relationship

from mixins import CRUD


class Base:
    @declared_attr
    def __tablename__(cls):
        return cls.__name__.lower()

    __table_args__ = {"mysql_engine": "InnoDB"}

    id = Column(Integer, primary_key=True)


Base = declarative_base(cls=Base)


class Currency(Base, CRUD):

    __tablename__ = "currency"

    name = Column("name", Text)
    code = Column(
        "code", CHAR(length=3), CheckConstraint("char_length(code) = 3"), nullable=False
    )
    symbol = Column("symbol", String(length=3))
    nicknames = Column("nicknames", ARRAY(Text), default=[])
    # back references one to many relationship with country
    countries = relationship("Country", back_populates="currency")

    def __str__(self):
        return f"{self.code.upper()} ({self.symbol})"

    def __repr__(self):
        return f"Currency(name={self.code.upper()}, symbol={self.symbol})"


country_language = Table(
    "country_languages",
    Base.metadata,
    Column("country_id", Integer, ForeignKey("country.id")),
    Column("languages_id", Integer, ForeignKey("languages.id")),
)


class Language(Base, CRUD):

    __tablename__ = "languages"

    iso_code = Column(
        "iso_code", CHAR(length=3), CheckConstraint("char_length(code) = 2")
    )
    name = Column("name", Text, nullable=False)
    countries = relationship("Country", secondary=country_language)

    def __repr__(self):
        return f"Language(name={self.name.title()}, iso_code={self.iso_code.upper()})"


class Country(Base, CRUD):

    __tablename__ = "country"

    name = Column("name", String(60), nullable=False, unique=True)
    created_at = Column("created_at", DateTime, default=datetime.datetime.now())
    languages = relationship("Language", secondary=country_language)
    exists = Column("still_exists", Boolean, default=True)
    founded = Column("founded", Date, nullable=False)
    population = Column(
        "population", Integer, CheckConstraint("population > 0"), nullable=False
    )
    area = Column("area", Integer, CheckConstraint("area > 0"), nullable=False)
    timezones = Column("timezones", ARRAY(Text), default=[])
    driving_side = Column(
        "driving_side", String(5), CheckConstraint("driving_side IN ('left', 'right')")
    )
    iso_code = Column(
        "iso_code",
        CHAR(2),
        CheckConstraint("char_length(iso_code) = 2"),
        nullable=False,
    )
    # back references fk in country model
    currency_id = Column("currency", Integer, ForeignKey("currency.id"))
    currency = relationship("Currency", back_populates="countries")
    cities = relationship("City", back_populates="country")
    meta = Column("meta", JSONB, default=text("'{}'::jsonb"), nullable=False)

    def __repr__(self):
        return f"Country(name={self.name.title()})"


class City(Base, CRUD):

    __tablename__ = "city"

    name = Column("name", String(90), nullable=False)
    country_id = Column("country", Integer, ForeignKey("country.id"))
    country = relationship("Country", back_populates="cities")
    population = Column(
        "population", Integer, CheckConstraint("population > 0"), nullable=False
    )
    area = Column("area", Integer, CheckConstraint("area > 0"), nullable=False)
    founded = Column("founded", Integer)

    def __repr__(self):
        return f"City(name={self.name.title()})"
