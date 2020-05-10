ALTER TABLE city
DROP COLUMN capitol;

ALTER TABLE city
ALTER COLUMN founded TYPE date USING founded::text::date;
