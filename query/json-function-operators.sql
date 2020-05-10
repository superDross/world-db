/*

SELECT name, jsonb_pretty(meta) FROM country limit 1;

           name           |                            jsonb_pretty
--------------------------+---------------------------------------------------------------------
 united kingdom           | {
                          |     "name": "United Kingdom of Great Britain and Northern Ireland",
                          |     "latlng": [
                          |         54,
                          |         -2
                          |     ],
                          |     "borders": [
                          |         "IRL"
                          |     ],
                          |     "capital": "London",
                          |     "altSpellings": [
                          |         "GB",
                          |         "UK",
                          |         "Great Britain"
                          |     ],
                          |     "translations": {
                          |         "br": "Reino Unido",
                          |         "de": "Vereinigtes Königreich",
                          |         "es": "Reino Unido",
                          |         "fa": "بریتانیای کبیر و ایرلند شمالی",
                          |         "fr": "Royaume-Uni",
                          |         "hr": "Ujedinjeno Kraljevstvo",
                          |         "it": "Regno Unito",
                          |         "ja": "イギリス",
                          |         "nl": "Verenigd Koninkrijk",
                          |         "pt": "Reino Unido"
                          |     }
                          | }
*/


-- RESOURCES
-- https://www.postgresql.org/docs/12/functions-json.html


-- JSON ARRAY LENGTH GREATER THAN

SELECT
  name, meta -> 'borders' AS borders
FROM
  country
WHERE jsonb_array_length(meta -> 'borders') < 3;

/*
          name           |    borders
--------------------------+----------------
 united kingdom           | ["IRL"]
 ceylon                   | ["IND"]
 united states of america | ["CAN", "MEX"]
*/


-- JSON ARRAY CONTAINS string

SELECT
  name, meta ->> 'borders' AS borders
FROM
  country
WHERE (meta -> 'borders') ? 'FRA';

/*
   name     |               borders               
-------------+-------------------------------------
 spain       | ["AND", "FRA", "GIB", "PRT", "MAR"]
 switzerland | ["AUT", "FRA", "ITA", "LIE", "DEU"]
*/


-- JSON ARRAY CONTAINS ANY in array

SELECT
  name, meta ->> 'borders' AS borders
FROM
  country
WHERE (meta -> 'borders') ?| array['FRA', 'IRL'];

/*
   name     |               borders               
-------------+-------------------------------------
 united kingdom | ["IRL"]
 spain          | ["AND", "FRA", "GIB", "PRT", "MAR"]
 switzerland    | ["AUT", "FRA", "ITA", "LIE", "DEU"]
*/


-- JSON ARRAY CONTAINS ALL in array

SELECT
  name, meta ->> 'borders' AS borders
FROM
  country
WHERE (meta -> 'borders') ?& array['FRA', 'GIB'];

/*
   name     |               borders               
-------------+-------------------------------------
 spain          | ["AND", "FRA", "GIB", "PRT", "MAR"]
*/
