ALTER TABLE country
RENAME timezones TO timezone;

ALTER TABLE country
ALTER COLUMN timezone TYPE char;
