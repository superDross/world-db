ALTER TABLE city
DROP COLUMN capital;

ALTER TABLE city
ALTER COLUMN founded TYPE date USING founded::text::date;
