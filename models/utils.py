from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker


def get_db():
    return create_engine("postgresql://postgres:postgres@localhost:5432/world")


def get_session():
    db = get_db()
    Session = sessionmaker(db)
    return Session()


# raw sql
# results = db.execute("select * from country")
# for result in results:
#     print(result)
