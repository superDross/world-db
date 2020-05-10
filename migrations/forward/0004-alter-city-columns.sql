ALTER TABLE city
ADD COLUMN capital boolean;

/* needs to be converted to text first */
ALTER TABLE city
ALTER COLUMN founded TYPE integer USING founded::text::integer;
