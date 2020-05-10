ALTER TABLE country
RENAME timezone TO timezones;

ALTER TABLE country
ALTER COLUMN timezones TYPE text[] USING timezones::text[];
