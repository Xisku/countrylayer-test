public class CountryLayerAPI_Wrapper {    
    //Deserializes JSON string to a list of CountryWrapper objects
    public static Map<String,CountryWrapper> parseList(String jsonString) {
        Map<String,CountryWrapper> countryMap = new Map<String,CountryWrapper>();
        
        for(CountryWrapper country : (List<CountryWrapper>)System.JSON.deserialize(jsonString, List<CountryWrapper>.class)){
            /*country.regionalBlocs = new List<RegionalBloc>();
            country.regionalBlocs.add(new RegionalBloc());
            country.regionalBlocs.add(new RegionalBloc());
            country.regionalBlocs[0].acronym = 'EU';
            country.regionalBlocs[1].acronym = 'HIDRA';*/
            
            if(country.regionalBlocs != null){
                country.regionalBlocsSummary = getRegionalBlocsSummary(country.regionalBlocs);
            }
            countryMap.put(country.alpha2Code,country);
        }
        
        return CountryMap;
    }
    
    public class CountryWrapper {
        public String name;
        public List<String> topLevelDomain;
        public String alpha2Code;
        public String alpha3Code;
        public List<String> callingCodes;
        public String capital;
        public List<String> altSpellings;
        public String region;
        public String subregion;
        public Integer population;
        public List<Decimal> latlng;
        public String demonym;
        public Decimal area;
        public Decimal gini;
        public List<String> timezones;
        public List<String> borders;
        public String nativeName;
        public String numericCode;
        public List<CurrencyWrapper> currencies;
        public List<Language> languages;
        public TranslationWrapper translations;
        public String flag;
        public List<RegionalBloc> regionalBlocs;
        public String cioc;
        
        public String regionalBlocsSummary;
    }
    
    // Currency inner class
    // Note: "currency" is a reserved keyword
    public class CurrencyWrapper {
        public String code;
        public String name;
        public String symbol;
    }
    
    // Language inner class
    public class Language {
        public String iso639_1;
        public String iso639_2;
        public String name;
        public String nativeName;
    }
    
    // Translation inner class
    public class TranslationWrapper {
        public String br;
        public String de;
        public String es;
        public String fa;
        public String fr;
        public String hr;
        public String it;
        public String ja;
        public String nl;
        public String pt;
    }
    
    // Regional Bloc inner class
    public class RegionalBloc {
        public String acronym;
        public String name;
    }
    
    //Returns a list of regional blocs acronyms
    private static String getRegionalBlocsSummary(List<RegionalBloc> regionalBlocs){
        String summary = '';
        for(RegionalBloc bloc : regionalBlocs){
            summary += bloc.acronym + ', ';
        }
        
        summary = summary.removeEnd(', ');
        
        return summary;
    }
}