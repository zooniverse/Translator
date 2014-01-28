Utils =
  titleize: (text) ->
    text.replace /([A-Z])(\w)/g, (match, capital, letter) ->
      "_#{ capital.toLowerCase() }#{ letter }"
    .replace /([-_ ]|^)(\w)/g, (match, separator, letter) ->
      " #{ letter.toUpperCase() }"
    .trim()
  
  locales: [
    { code: 'af', name: 'Afrikaans' }
    { code: 'af-za', name: 'Afrikaans (South Africa)' }
    { code: 'sq', name: 'Albanian' }
    { code: 'sq-al', name: 'Albanian (Albania)' }
    { code: 'gsw-fr', name: 'Alsatian (France)' }
    { code: 'am-et', name: 'Amharic (Ethiopia)' }
    { code: 'ar', name: 'Arabic' }
    { code: 'ar-dz', name: 'Arabic (Algeria)' }
    { code: 'ar-bh', name: 'Arabic (Bahrain)' }
    { code: 'ar-eg', name: 'Arabic (Egypt)' }
    { code: 'ar-iq', name: 'Arabic (Iraq)' }
    { code: 'ar-jo', name: 'Arabic (Jordan)' }
    { code: 'ar-kw', name: 'Arabic (Kuwait)' }
    { code: 'ar-lb', name: 'Arabic (Lebanon)' }
    { code: 'ar-ly', name: 'Arabic (Libya)' }
    { code: 'ar-ma', name: 'Arabic (Morocco)' }
    { code: 'ar-om', name: 'Arabic (Oman)' }
    { code: 'ar-qa', name: 'Arabic (Qatar)' }
    { code: 'ar-sa', name: 'Arabic (Saudi Arabia)' }
    { code: 'ar-sy', name: 'Arabic (Syria)' }
    { code: 'ar-tn', name: 'Arabic (Tunisia)' }
    { code: 'ar-ae', name: 'Arabic (U.A.E.)' }
    { code: 'ar-ye', name: 'Arabic (Yemen)' }
    { code: 'hy', name: 'Armenian' }
    { code: 'hy-am', name: 'Armenian (Armenia)' }
    { code: 'as-in', name: 'Assamese (India)' }
    { code: 'az', name: 'Azeri' }
    { code: 'az-cyrl-az', name: 'Azeri (Cyrillic, Azerbaijan)' }
    { code: 'az-latn-az', name: 'Azeri (Latin, Azerbaijan)' }
    { code: 'ba-ru', name: 'Bashkir (Russia)' }
    { code: 'eu', name: 'Basque' }
    { code: 'eu-es', name: 'Basque (Basque)' }
    { code: 'be', name: 'Belarusian' }
    { code: 'be-by', name: 'Belarusian (Belarus)' }
    { code: 'bn-bd', name: 'Bengali (Bangladesh)' }
    { code: 'bn-in', name: 'Bengali (India)' }
    { code: 'bs-cyrl-ba', name: 'Bosnian (Cyrillic, Bosnia and Herzegovina)' }
    { code: 'bs-latn-ba', name: 'Bosnian (Latin, Bosnia and Herzegovina)' }
    { code: 'br-fr', name: 'Breton (France)' }
    { code: 'bg', name: 'Bulgarian' }
    { code: 'bg-bg', name: 'Bulgarian (Bulgaria)' }
    { code: 'ca', name: 'Catalan' }
    { code: 'ca-es', name: 'Catalan (Catalan)' }
    { code: 'zh-hk', name: 'Chinese (Hong Kong S.A.R.)' }
    { code: 'zh-mo', name: 'Chinese (Macao S.A.R.)' }
    { code: 'zh-cn', name: 'Chinese (Peoples Republic of China)s Republic of China)' }
    { code: 'zh-hans', name: 'Chinese (Simplified)' }
    { code: 'zh-sg', name: 'Chinese (Singapore)' }
    { code: 'zh-tw', name: 'Chinese (Taiwan)' }
    { code: 'zh-hant', name: 'Chinese (Traditional)' }
    { code: 'co-fr', name: 'Corsican (France)' }
    { code: 'hr', name: 'Croatian' }
    { code: 'hr-hr', name: 'Croatian (Croatia)' }
    { code: 'hr-ba', name: 'Croatian (Latin, Bosnia and Herzegovina)' }
    { code: 'cs', name: 'Czech' }
    { code: 'cs-cz', name: 'Czech (Czech Republic)' }
    { code: 'da', name: 'Danish' }
    { code: 'da-dk', name: 'Danish (Denmark)' }
    { code: 'prs-af', name: 'Dari (Afghanistan)' }
    { code: 'div', name: 'Divehi' }
    { code: 'div-mv', name: 'Divehi (Maldives)' }
    { code: 'nl', name: 'Dutch' }
    { code: 'nl-be', name: 'Dutch (Belgium)' }
    { code: 'nl-nl', name: 'Dutch (Netherlands)' }
    { code: 'en', name: 'English' }
    { code: 'en-au', name: 'English (Australia)' }
    { code: 'en-bz', name: 'English (Belize)' }
    { code: 'en-ca', name: 'English (Canada)' }
    { code: 'en-029', name: 'English (Caribbean)' }
    { code: 'en-in', name: 'English (India)' }
    { code: 'en-ie', name: 'English (Ireland)' }
    { code: 'en-jm', name: 'English (Jamaica)' }
    { code: 'en-my', name: 'English (Malaysia)' }
    { code: 'en-nz', name: 'English (New Zealand)' }
    { code: 'en-ph', name: 'English (Republic of the Philippines)' }
    { code: 'en-sg', name: 'English (Singapore)' }
    { code: 'en-za', name: 'English (South Africa)' }
    { code: 'en-tt', name: 'English (Trinidad and Tobago)' }
    { code: 'en-gb', name: 'English (United Kingdom)' }
    { code: 'en-us', name: 'English (United States)' }
    { code: 'en-zw', name: 'English (Zimbabwe)' }
    { code: 'et', name: 'Estonian' }
    { code: 'et-ee', name: 'Estonian (Estonia)' }
    { code: 'fo', name: 'Faroese' }
    { code: 'fo-fo', name: 'Faroese (Faroe Islands)' }
    { code: 'fil-ph', name: 'Filipino (Philippines)' }
    { code: 'fi', name: 'Finnish' }
    { code: 'fi-fi', name: 'Finnish (Finland)' }
    { code: 'fr', name: 'French' }
    { code: 'fr-be', name: 'French (Belgium)' }
    { code: 'fr-ca', name: 'French (Canada)' }
    { code: 'fr-fr', name: 'French (France)' }
    { code: 'fr-lu', name: 'French (Luxembourg)' }
    { code: 'fr-mc', name: 'French (Principality of Monaco)' }
    { code: 'fr-ch', name: 'French (Switzerland)' }
    { code: 'fy-nl', name: 'Frisian (Netherlands)' }
    { code: 'gl', name: 'Galician' }
    { code: 'gl-es', name: 'Galician (Galician)' }
    { code: 'ka', name: 'Georgian' }
    { code: 'ka-ge', name: 'Georgian (Georgia)' }
    { code: 'de', name: 'German' }
    { code: 'de-at', name: 'German (Austria)' }
    { code: 'de-de', name: 'German (Germany)' }
    { code: 'de-li', name: 'German (Liechtenstein)' }
    { code: 'de-lu', name: 'German (Luxembourg)' }
    { code: 'de-ch', name: 'German (Switzerland)' }
    { code: 'el', name: 'Greek' }
    { code: 'el-gr', name: 'Greek (Greece)' }
    { code: 'kl-gl', name: 'Greenlandic (Greenland)' }
    { code: 'gu', name: 'Gujarati' }
    { code: 'gu-in', name: 'Gujarati (India)' }
    { code: 'ha-latn-ng', name: 'Hausa (Latin, Nigeria)' }
    { code: 'he', name: 'Hebrew' }
    { code: 'he-il', name: 'Hebrew (Israel)' }
    { code: 'hi', name: 'Hindi' }
    { code: 'hi-in', name: 'Hindi (India)' }
    { code: 'hu', name: 'Hungarian' }
    { code: 'hu-hu', name: 'Hungarian (Hungary)' }
    { code: 'is', name: 'Icelandic' }
    { code: 'is-is', name: 'Icelandic (Iceland)' }
    { code: 'ig-ng', name: 'Igbo (Nigeria)' }
    { code: 'id', name: 'Indonesian' }
    { code: 'id-id', name: 'Indonesian (Indonesia)' }
    { code: 'iu-latn-ca', name: 'Inuktitut (Latin, Canada)' }
    { code: 'iu-cans-ca', name: 'Inuktitut (Syllabics, Canada)' }
    { code: 'ga-ie', name: 'Irish (Ireland)' }
    { code: 'xh-za', name: 'isiXhosa (South Africa)' }
    { code: 'zu-za', name: 'isiZulu (South Africa)' }
    { code: 'it', name: 'Italian' }
    { code: 'it-it', name: 'Italian (Italy)' }
    { code: 'it-ch', name: 'Italian (Switzerland)' }
    { code: 'ja', name: 'Japanese' }
    { code: 'ja-jp', name: 'Japanese (Japan)' }
    { code: 'kn', name: 'Kannada' }
    { code: 'kn-in', name: 'Kannada (India)' }
    { code: 'kk', name: 'Kazakh' }
    { code: 'kk-kz', name: 'Kazakh (Kazakhstan)' }
    { code: 'km-kh', name: 'Khmer (Cambodia)' }
    { code: 'qut-gt', name: 'K' }
    { code: 'rw-rw', name: 'Kinyarwanda (Rwanda)' }
    { code: 'sw', name: 'Kiswahili' }
    { code: 'sw-ke', name: 'Kiswahili (Kenya)' }
    { code: 'kok', name: 'Konkani' }
    { code: 'kok-in', name: 'Konkani (India)' }
    { code: 'ko', name: 'Korean' }
    { code: 'ko-kr', name: 'Korean (Korea)' }
    { code: 'ky', name: 'Kyrgyz' }
    { code: 'ky-kg', name: 'Kyrgyz (Kyrgyzstan)' }
    { code: 'lo-la', name: 'Lao (Lao P.D.R.)' }
    { code: 'lv', name: 'Latvian' }
    { code: 'lv-lv', name: 'Latvian (Latvia)' }
    { code: 'lt', name: 'Lithuanian' }
    { code: 'lt-lt', name: 'Lithuanian (Lithuania)' }
    { code: 'wee-de', name: 'Lower Sorbian (Germany)' }
    { code: 'lb-lu', name: 'Luxembourgish (Luxembourg)' }
    { code: 'mk', name: 'Macedonian' }
    { code: 'mk-mk', name: 'Macedonian (Former Yugoslav Republic of Macedonia)' }
    { code: 'ms', name: 'Malay' }
    { code: 'ms-bn', name: 'Malay (Brunei Darussalam)' }
    { code: 'ms-my', name: 'Malay (Malaysia)' }
    { code: 'ml-in', name: 'Malayalam (India)' }
    { code: 'mt-mt', name: 'Maltese (Malta)' }
    { code: 'mi-nz', name: 'Maori (New Zealand)' }
    { code: 'arn-cl', name: 'Mapudungun (Chile)' }
    { code: 'mr', name: 'Marathi' }
    { code: 'mr-in', name: 'Marathi (India)' }
    { code: 'moh-ca', name: 'Mohawk (Mohawk)' }
    { code: 'mn', name: 'Mongolian' }
    { code: 'mn-mn', name: 'Mongolian (Cyrillic, Mongolia)' }
    { code: 'mn-mong-cn', name: 'Mongolian (Traditional Mongolian, PRC)' }
    { code: 'ne-np', name: 'Nepali (Nepal)' }
    { code: 'no', name: 'Norwegian' }
    { code: 'nb-no', name: 'Norwegian' }
    { code: 'nn-no', name: 'Norwegian' }
    { code: 'oc-fr', name: 'Occitan (France)' }
    { code: 'or-in', name: 'Oriya (India)' }
    { code: 'ps-af', name: 'Pashto (Afghanistan)' }
    { code: 'fa', name: 'Persian' }
    { code: 'fa-ir', name: 'Persian' }
    { code: 'pl', name: 'Polish' }
    { code: 'pl-pl', name: 'Polish (Poland)' }
    { code: 'pt', name: 'Portuguese' }
    { code: 'pt-br', name: 'Portuguese (Brazil)' }
    { code: 'pt-pt', name: 'Portuguese (Portugal)' }
    { code: 'pa', name: 'Punjabi' }
    { code: 'pa-in', name: 'Punjabi (India)' }
    { code: 'quz-bo', name: 'Quechua (Bolivia)' }
    { code: 'quz-ec', name: 'Quechua (Ecuador)' }
    { code: 'quz-pe', name: 'Quechua (Peru)' }
    { code: 'ro', name: 'Romanian' }
    { code: 'ro-ro', name: 'Romanian (Romania)' }
    { code: 'rm-ch', name: 'Romansh (Switzerland)' }
    { code: 'ru', name: 'Russian' }
    { code: 'ru-ru', name: 'Russian (Russia)' }
    { code: 'smn-fi', name: 'Sami' }
    { code: 'smj-no', name: 'Sami' }
    { code: 'smj-se', name: 'Sami' }
    { code: 'se-fi', name: 'Sami' }
    { code: 'se-no', name: 'Sami' }
    { code: 'se-se', name: 'Sami' }
    { code: 'sms-fi', name: 'Sami' }
    { code: 'sma-no', name: 'Sami' }
    { code: 'sma-se', name: 'Sami' }
    { code: 'sa', name: 'Sanskrit' }
    { code: 'sa-in', name: 'Sanskrit (India)' }
    { code: 'sr', name: 'Serbian' }
    { code: 'sr-cyrl-ba', name: 'Serbian (Cyrillic, Bosnia and Herzegovina)' }
    { code: 'sr-cyrl-sp', name: 'Serbian (Cyrillic, Serbia)' }
    { code: 'sr-latn-ba', name: 'Serbian (Latin, Bosnia and Herzegovina)' }
    { code: 'sr-latn-sp', name: 'Serbian (Latin, Serbia)' }
    { code: 'nso-za', name: 'Sesotho sa Leboa (South Africa)' }
    { code: 'tn-za', name: 'Setswana (South Africa)' }
    { code: 'si-lk', name: 'Sinhala (Sri Lanka)' }
    { code: 'sk', name: 'Slovak' }
    { code: 'sk-sk', name: 'Slovak (Slovakia)' }
    { code: 'sl', name: 'Slovenian' }
    { code: 'sl-si', name: 'Slovenian (Slovenia)' }
    { code: 'es', name: 'Spanish' }
    { code: 'es-ar', name: 'Spanish (Argentina)' }
    { code: 'es-bo', name: 'Spanish (Bolivia)' }
    { code: 'es-cl', name: 'Spanish (Chile)' }
    { code: 'es-co', name: 'Spanish (Colombia)' }
    { code: 'es-cr', name: 'Spanish (Costa Rica)' }
    { code: 'es-do', name: 'Spanish (Dominican Republic)' }
    { code: 'es-ec', name: 'Spanish (Ecuador)' }
    { code: 'es-sv', name: 'Spanish (El Salvador)' }
    { code: 'es-gt', name: 'Spanish (Guatemala)' }
    { code: 'es-hn', name: 'Spanish (Honduras)' }
    { code: 'es-mx', name: 'Spanish (Mexico)' }
    { code: 'es-ni', name: 'Spanish (Nicaragua)' }
    { code: 'es-pa', name: 'Spanish (Panama)' }
    { code: 'es-py', name: 'Spanish (Paraguay)' }
    { code: 'es-pe', name: 'Spanish (Peru)' }
    { code: 'es-pr', name: 'Spanish (Puerto Rico)' }
    { code: 'es-es', name: 'Spanish (Spain)' }
    { code: 'es-us', name: 'Spanish (United States)' }
    { code: 'es-uy', name: 'Spanish (Uruguay)' }
    { code: 'es-ve', name: 'Spanish (Venezuela)' }
    { code: 'sv', name: 'Swedish' }
    { code: 'sv-fi', name: 'Swedish (Finland)' }
    { code: 'sv-se', name: 'Swedish (Sweden)' }
    { code: 'syr', name: 'Syriac' }
    { code: 'syr-sy', name: 'Syriac (Syria)' }
    { code: 'tg-cyrl-tj', name: 'Tajik (Cyrillic, Tajikistan)' }
    { code: 'tzm-latn-dz', name: 'Tamazight (Latin, Algeria)' }
    { code: 'ta', name: 'Tamil' }
    { code: 'ta-in', name: 'Tamil (India)' }
    { code: 'tt', name: 'Tatar' }
    { code: 'tt-ru', name: 'Tatar (Russia)' }
    { code: 'te', name: 'Telugu' }
    { code: 'te-in', name: 'Telugu (India)' }
    { code: 'th', name: 'Thai' }
    { code: 'th-th', name: 'Thai (Thailand)' }
    { code: 'bo-cn', name: 'Tibetan (PRC)' }
    { code: 'tr', name: 'Turkish' }
    { code: 'tr-tr', name: 'Turkish (Turkey)' }
    { code: 'tk-tm', name: 'Turkmen (Turkmenistan)' }
    { code: 'ug-cn', name: 'Uighur (PRC)' }
    { code: 'uk', name: 'Ukrainian' }
    { code: 'uk-ua', name: 'Ukrainian (Ukraine)' }
    { code: 'wen-de', name: 'Upper Sorbian (Germany)' }
    { code: 'ur', name: 'Urdu' }
    { code: 'ur-pk', name: 'Urdu (Islamic Republic of Pakistan)' }
    { code: 'uz', name: 'Uzbek' }
    { code: 'uz-cyrl-uz', name: 'Uzbek (Cyrillic, Uzbekistan)' }
    { code: 'uz-latn-uz', name: 'Uzbek (Latin, Uzbekistan)' }
    { code: 'vi', name: 'Vietnamese' }
    { code: 'vi-vn', name: 'Vietnamese (Vietnam)' }
    { code: 'cy-gb', name: 'Welsh (United Kingdom)' }
    { code: 'wo-sn', name: 'Wolof (Senegal)' }
    { code: 'sah-ru', name: 'Yakut (Russia)' }
    { code: 'ii-cn', name: 'Yi (PRC)' }
    { code: 'yo-ng', name: 'Yoruba (Nigeria)' }
  ]

Utils.localeCodes = { }
for locale in Utils.locales
  Utils.localeCodes[locale.code] = locale.name

module.exports = Utils
