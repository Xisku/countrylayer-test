public class CountryLayerAPI_Mock implements HttpCalloutMock {
    
    public HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setStatusCode(200);
        res.setStatus('OK');
        res.setBody(getCountries());
        
        return res;
    }
    
    private String getCountries() {
        String jsonCountries = '[' +
'  {' +
'    "name": "Afghanistan",' +
'    "topLevelDomain": [' +
'      ".af"' +
'    ],' +
'    "alpha2Code": "AF",' +
'    "alpha3Code": "AFG",' +
'    "callingCodes": [' +
'      "93"' +
'    ],' +
'    "capital": "Kabul",' +
'    "altSpellings": [' +
'      "AF",' +
'      "Afġānistān"' +
'    ],' +
'    "region": "Asia",' +
'    "subregion": "Southern Asia",' +
'    "population": 27657145,' +
'    "latlng": [' +
'      33,' +
'      65' +
'    ],' +
'    "demonym": "Afghan",' +
'    "area": 652230,' +
'    "gini": 27.8,' +
'    "timezones": [' +
'      "UTC+04:30"' +
'    ],' +
'    "borders": [' +
'      "IRN",' +
'      "PAK",' +
'      "TKM",' +
'      "UZB",' +
'      "TJK",' +
'      "CHN"' +
'    ],' +
'    "nativeName": "افغانستان",' +
'    "numericCode": "004",' +
'    "currencies": [' +
'      {' +
'        "code": "AFN",' +
'        "name": "Afghan afghani",' +
'        "symbol": "؋"' +
'      }' +
'    ],' +
'    "languages": [' +
'      {' +
'        "iso639_1": "ps",' +
'        "iso639_2": "pus",' +
'        "name": "Pashto",' +
'        "nativeName": "پښتو"' +
'      },' +
'      {' +
'        "iso639_1": "uz",' +
'        "iso639_2": "uzb",' +
'        "name": "Uzbek",' +
'        "nativeName": "Oʻzbek"' +
'      },' +
'      {' +
'        "iso639_1": "tk",' +
'        "iso639_2": "tuk",' +
'        "name": "Turkmen",' +
'        "nativeName": "Türkmen"' +
'      }' +
'    ],' +
'    "translations": {' +
'      "de": "Afghanistan",' +
'      "es": "Afganistán",' +
'      "fr": "Afghanistan",' +
'      "ja": "アフガニスタン",' +
'      "it": "Afghanistan",' +
'      "br": "Afeganistão",' +
'      "pt": "Afeganistão",' +
'      "nl": "Afghanistan",' +
'      "hr": "Afganistan",' +
'      "fa": "افغانستان"' +
'    },' +
'    "flag": "https://restcountries.eu/data/afg.svg",' +
'    "regionalBlocs": [' +
'      {' +
'        "acronym": "SAARC",' +
'        "name": "South Asian Association for Regional Cooperation",' +
'        "otherAcronyms": [],' +
'        "otherNames": []' +
'      }' +
'    ],' +
'    "cioc": "AFG"' +
'  },' +
'  {' +
'    "name": "Åland Islands",' +
'    "topLevelDomain": [' +
'      ".ax"' +
'    ],' +
'    "alpha2Code": "AX",' +
'    "alpha3Code": "ALA",' +
'    "callingCodes": [' +
'      "358"' +
'    ],' +
'    "capital": "Mariehamn",' +
'    "altSpellings": [' +
'      "AX",' +
'      "Aaland",' +
'      "Aland",' +
'      "Ahvenanmaa"' +
'    ],' +
'    "region": "Europe",' +
'    "subregion": "Northern Europe",' +
'    "population": 28875,' +
'    "latlng": [' +
'      60.1166672,' +
'      19.9' +
'    ],' +
'    "demonym": "Ålandish",' +
'    "area": 1580,' +
'    "gini": 0,' +
'    "timezones": [' +
'      "UTC+02:00"' +
'    ],' +
'    "nativeName": "Åland",' +
'    "numericCode": "248",' +
'    "currencies": [' +
'      {' +
'        "code": "EUR",' +
'        "name": "Euro",' +
'        "symbol": "€"' +
'      }' +
'    ],' +
'    "languages": [' +
'      {' +
'        "iso639_1": "sv",' +
'        "iso639_2": "swe",' +
'        "name": "Swedish",' +
'        "nativeName": "svenska"' +
'      }' +
'    ],' +
'    "translations": {' +
'      "de": "Åland-Inseln",' +
'      "es": "Alandia",' +
'      "fr": "Åland",' +
'      "ja": "オーランド諸島",' +
'      "it": "Isole Aland",' +
'      "br": "Ilhas de Aland",' +
'      "pt": "Ilhas de Aland",' +
'      "nl": "Ålandeilanden",' +
'      "hr": "Ålandski otoci",' +
'      "fa": "جزایر الند"' +
'    },' +
'    "flag": "https://restcountries.eu/data/ala.svg",' +
'    "regionalBlocs": [' +
'      {' +
'        "acronym": "EU",' +
'        "name": "European Union",' +
'        "otherAcronyms": [],' +
'        "otherNames": []' +
'      }' +
'    ],' +
'    "cioc": ""' +
'  }' +
']';
        return jsonCountries;
    }
}