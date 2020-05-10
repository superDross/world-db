UPDATE country SET meta = '{
  "name": "United States of America",
  "capital": "Washington, D.C.",
  "altSpellings": [
    "US",
    "USA",
    "United States of America"
  ],
  "latlng": [
    38,
    -97
  ],
  "borders": [
    "CAN",
    "MEX"
  ],
  "translations": {
    "de": "Vereinigte Staaten von Amerika",
    "es": "Estados Unidos",
    "fr": "États-Unis",
    "ja": "アメリカ合衆国",
    "it": "Stati Uniti DAmerica",
    "br": "Estados Unidos",
    "pt": "Estados Unidos",
    "nl": "Verenigde Staten",
    "hr": "Sjedinjene Američke Države",
    "fa": "ایالات متحده آمریکا"
  }
}'
WHERE iso_code = 'us';

UPDATE country SET meta = '{
    "name": "United Kingdom of Great Britain and Northern Ireland",
    "capital": "London",
    "altSpellings": [
      "GB",
      "UK",
      "Great Britain"
    ],
    "latlng": [
      54,
      -2
    ],
    "borders": [
      "IRL"
    ],
    "translations": {
      "de": "Vereinigtes Königreich",
      "es": "Reino Unido",
      "fr": "Royaume-Uni",
      "ja": "イギリス",
      "it": "Regno Unito",
      "br": "Reino Unido",
      "pt": "Reino Unido",
      "nl": "Verenigd Koninkrijk",
      "hr": "Ujedinjeno Kraljevstvo",
      "fa": "بریتانیای کبیر و ایرلند شمالی"
    }
  }'
WHERE iso_code = 'gb';


UPDATE country SET meta = '{
    "name": "China",
    "capital": "Beijing",
    "altSpellings": [
      "CN",
      "Zhōngguó",
      "Zhongguo",
      "Zhonghua",
      "Peoples republic OF china",
      "中华人民共和国",
      "zhōnghuá rénmín gònghéguó"
    ],
    "latlng": [
      35,
      105
    ],
    "borders": [
      "afg",
      "btn",
      "mmr",
      "hkg",
      "ind",
      "kaz",
      "prk",
      "kgz",
      "lao",
      "mac",
      "mng",
      "pak",
      "rus",
      "tjk",
      "vnm"
    ],
    "translations": {
      "de": "china",
      "es": "china",
      "fr": "chine",
      "ja": "中国",
      "it": "cina",
      "br": "china",
      "pt": "china",
      "nl": "china",
      "hr": "kina",
      "fa": "چین"
    }
  }'
WHERE iso_code = 'cn';


UPDATE country SET meta = '{
    "name": "Switzerland",
    "capital": "Bern",
    "altSpellings": [
      "CH",
      "Swiss Confederation",
      "Schweiz",
      "Suisse",
      "Svizzera",
      "Svizra"
    ],
    "latlng": [
      47,
      8
    ],
    "borders": [
      "AUT",
      "FRA",
      "ITA",
      "LIE",
      "DEU"
    ],
    "translations": {
      "de": "Schweiz",
      "es": "Suiza",
      "fr": "Suisse",
      "ja": "スイス",
      "it": "Svizzera",
      "br": "Suíça",
      "pt": "Suíça",
      "nl": "Zwitserland",
      "hr": "Švicarska",
      "fa": "سوئیس"
    }
  }'
WHERE iso_code = 'ch';


UPDATE country SET meta = '{
    "name": "Spain",
    "capital": "Madrid",
    "altSpellings": [
      "ES",
      "Kingdom of Spain",
      "Reino de España"
    ],
    "latlng": [
      40,
      -4
    ],
    "borders": [
      "AND",
      "FRA",
      "GIB",
      "PRT",
      "MAR"
    ],
    "translations": {
      "de": "Spanien",
      "es": "España",
      "fr": "Espagne",
      "ja": "スペイン",
      "it": "Spagna",
      "br": "Espanha",
      "pt": "Espanha",
      "nl": "Spanje",
      "hr": "Španjolska",
      "fa": "اسپانیا"
    }
  }'
WHERE iso_code = 'es';


UPDATE country SET meta = '{
    "name": "Sri Lanka",
    "capital": "Colombo",
    "altSpellings": [
      "LK",
      "ilaṅkai",
      "Democratic Socialist Republic of Sri Lanka"
    ],
    "latlng": [
      7,
      81
    ],
    "borders": [
      "IND"
    ],
    "translations": {
      "de": "Sri Lanka",
      "es": "Sri Lanka",
      "fr": "Sri Lanka",
      "ja": "スリランカ",
      "it": "Sri Lanka",
      "br": "Sri Lanka",
      "pt": "Sri Lanka",
      "nl": "Sri Lanka",
      "hr": "Šri Lanka",
      "fa": "سری‌لانکا"
    }
  }'
WHERE iso_code = 'lk';

