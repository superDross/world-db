INSERT INTO currency (name, code, symbol, nicknames)
VALUES
  (
    'united states dollar',
    'usd',
    '$',
    ARRAY [
      'bucks',
      'deuce',
      'deniro',
      'bill',
      'smackers'
    ]
  ),
  (
    'swiss franch',
    'chf',
    'fr.',
    ARRAY [
      'stutz',
      'balles',
      'balle'
    ]
  ),
  (
    'pound sterling',
    'gbp',
    '£',
    ARRAY [
      'quid',
      'dosh'
    ]
  );


INSERT INTO currency (name, code, symbol)
VALUES
  (
    'renminbi',
    'cny',
    '¥'
  ),
  (
    'euro',
    'eur',
    '€'
  ),
  (
    'srk lankan rupee',
    'lkr',
    'රු'
  );


INSERT INTO languages (iso_code, name)
VALUES
  ('en', 'english'),
  ('zh', 'chinese'),
  ('mn', 'mongolian'),
  ('bo', 'tibetan'),
  ('ug', 'uyghur'),
  ('za', 'zhuang'),
  ('es', 'spanish'),
  ('de', 'german'),
  ('it', 'italian'),
  ('fr', 'french'),
  ('rm', 'romansh');


INSERT INTO country (
  name,
  still_exists,
  founded,
  population,
  area,
  timezones,
  driving_side,
  iso_code,
  currency
) VALUES (
  'united kingdom',
  TRUE,
  '1922-12-05',
  67886004,
  242495,
  ARRAY [
    'gmt'
  ],
  'left',
  'gb',
  (SELECT id FROM currency WHERE code = 'gbp')
), (
  'united states of america',
  TRUE,
  '1776-07-04',
  328239523,
  3796742,
  ARRAY [
    'ast',
    'est',
    'cst',
    'mst',
    'pst',
    'hst'
  ],
  'right',
  'us',
  (SELECT id FROM currency WHERE code = 'usd')
),
(
  'china',
  TRUE,
  '1912-01-01',
  1427647786,
  9596961,
  ARRAY [
    'cst'
  ],
  'right',
  'cn',
  (SELECT id FROM currency WHERE code = 'cny')
),
(
  'switzerland',
  TRUE,
  '1848-09-12',
  8570146,
  41285,
  ARRAY [
    'cet'
  ],
  'right',
  'ch',
  (SELECT id FROM currency WHERE code = 'chf')
),
(
  'spain',
  TRUE,
  '1812-12-29',
  470007367,
  505990,
  ARRAY [
    'wet'
  ],
  'right',
  'es',
  (SELECT id FROM currency WHERE code = 'eur')
), (
  'ceylon',
  FALSE,
  '1972-05-22',
  12800000,
  65610,
  ARRAY[
    'ist'
  ],
  'left',
  'lk',
  (SELECT id FROM currency WHERE code = 'lkr')
);


INSERT INTO city (name, country, population, area, founded)
VALUES (
  'london',
  (SELECT id FROM country WHERE iso_code = 'gb'),
  8908081,
  1572,
  50
),
(
  'edinburgh',
  (SELECT id FROM country WHERE iso_code = 'gb'),
  488050,
  264,
  1130
),
(
  'new york',
  (SELECT id FROM country WHERE iso_code = 'us'),
  8175133,
  468484,
  1624
),
(
  'san diego',
  (SELECT id FROM country WHERE iso_code = 'us'),
  1307402,
  964,
  1769
),
(
  'geneva',
  (SELECT id FROM country WHERE iso_code = 'ch'),
  201741,
  15,
  1851
);


INSERT INTO country_languages (country_id, languages_id)
VALUES (
  (SELECT id FROM country WHERE iso_code = 'gb'),
  (SELECT id FROM languages WHERE iso_code = 'en')
), (
  (SELECT id FROM country WHERE iso_code = 'us'),
  (SELECT id FROM languages WHERE iso_code = 'en')
), (
  (SELECT id FROM country WHERE iso_code = 'ch'),
  (SELECT id FROM languages WHERE iso_code = 'de')
), (
  (SELECT id FROM country WHERE iso_code = 'ch'),
  (SELECT id FROM languages WHERE iso_code = 'fr')
), (
  (SELECT id FROM country WHERE iso_code = 'ch'),
  (SELECT id FROM languages WHERE iso_code = 'it')
), (
  (SELECT id FROM country WHERE iso_code = 'ch'),
  (SELECT id FROM languages WHERE iso_code = 'rm')
), (
  (SELECT id FROM country WHERE iso_code = 'cn'),
  (SELECT id FROM languages WHERE iso_code = 'zh')
), (
  (SELECT id FROM country WHERE iso_code = 'cn'),
  (SELECT id FROM languages WHERE iso_code = 'mn')
), (
  (SELECT id FROM country WHERE iso_code = 'cn'),
  (SELECT id FROM languages WHERE iso_code = 'bo')
), (
  (SELECT id FROM country WHERE iso_code = 'cn'),
  (SELECT id FROM languages WHERE iso_code = 'ug')
), (
  (SELECT id FROM country WHERE iso_code = 'es'),
  (SELECT id FROM languages WHERE iso_code = 'es')
);
