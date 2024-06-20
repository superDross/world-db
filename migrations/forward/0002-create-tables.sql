/* psql -U postgres -d world -a -f 0002-create-table.sql */


CREATE TABLE currency (
  id serial PRIMARY KEY,
  name text NOT NULL,
  code char (3) NOT NULL CHECK (char_length(code) = 3),
  symbol varchar (5),
  nicknames text [] DEFAULT '{}'
);


CREATE TABLE languages (
  id serial PRIMARY KEY,
  iso_code char (2) CHECK (char_length(iso_code) = 2),
  name varchar (100) NOT NULL
);


CREATE TABLE country (
  id serial PRIMARY KEY,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  name varchar (60) NOT NULL UNIQUE,
  still_exists bool DEFAULT TRUE,
  /* needs to be a one-to-one */
  /* capital varchar (60) NOT NULL UNIQUE, */
  founded date NOT NULL,
  population integer NOT NULL CHECK (population > 0),
  area integer NOT NULL CHECK (area > 0),
  timezone char (3) NOT NULL,
  driving_side varchar (5) DEFAULT 'right' CHECK (
      driving_side IN ('left', 'right')
    ),
  iso_code char (2) NOT NULL CHECK (char_length(iso_code) = 2),
  currency integer REFERENCES currency(id),
  /* used to store data scrapped from restcountries.eu */
  /* GET https://restcountries.eu/rest/v2/alpha?codes=<iso_code> */
  meta JSONB NOT NULL DEFAULT '{}'::JSONB
);


CREATE TABLE city (
  id serial PRIMARY KEY,
  name varchar (90) NOT NULL,
  /* foreign key to country */
  country integer REFERENCES country(id),
  population integer NOT NULL CHECK (population > 0),
  area integer NOT NULL CHECK (area > 0),
  founded date
);


/*

MANY-TO-MANY

CASCADE specifies that when a referenced row is deleted, rows referencing it should be
automatically deleted too

*/
CREATE TABLE country_languages (
  country_id int REFERENCES country(id) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
  languages_id int REFERENCES languages(id) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
  PRIMARY KEY (country_id, languages_id)

);
