global class CountriesUpdate_Schedulable implements Schedulable {
    global void execute(SchedulableContext sc) {
        Map<String,CountryLayerAPI_Wrapper.CountryWrapper> countriesMap;
        List<Country__c> countriesToUpsert = new List<Country__c>();
        
        try{
            countriesMap = CountryLayer_Connector.getAllCountries();
        } catch (Exception e){
            //Here we should log the Exception into a logging framework.
            System.debug(e);
            throw new CountryLayer_Exception('CountryLayer_Connector failed.', e);
        }
        
        //Check if existing countries have changed
        for(Country__c country : [SELECT Id, Name, Alpha2Code__c, Alpha3Code__c, CapitalCity__c, FlagImageUrl__c, Region__c, RegionalBlocs__c FROM Country__c WHERE Alpha2Code__c IN :countriesMap.keySet()]){
            if(countryHasChanged(country,countriesMap.get(country.Alpha2Code__c))){
                countriesToUpsert.add(convertToCountry(countriesMap.get(country.Alpha2Code__c)));
            }
            
            countriesMap.remove(country.Alpha2Code__c);
        }
        
        //Add all new countries
        for(CountryLayerAPI_Wrapper.CountryWrapper newCountry : countriesMap.values()){
            countriesToUpsert.add(convertToCountry(newCountry));
        }
        
        upsert countriesToUpsert Alpha2Code__c;
    }
    
    private static Country__c convertToCountry(CountryLayerAPI_Wrapper.CountryWrapper countryWrapper){
        Country__c countryToReturn = new Country__c();
        
        countryToReturn.Name = countryWrapper.name;
        countryToReturn.Alpha2Code__c = countryWrapper.alpha2Code;
        countryToReturn.Alpha3Code__c = countryWrapper.alpha3Code;
        countryToReturn.CapitalCity__c = countryWrapper.capital;
        countryToReturn.FlagImageUrl__c = countryWrapper.flag;
        countryToReturn.Region__c = countryWrapper.region;
        countryToReturn.RegionalBlocs__c = countryWrapper.regionalBlocsSummary;
        
        return countryToReturn;
    }
    
    private static boolean countryHasChanged(Country__c country, CountryLayerAPI_Wrapper.CountryWrapper countryWrapper){
        return !(country.Name == countryWrapper.name
                 && country.Alpha2Code__c == countryWrapper.alpha2Code
                 && country.Alpha3Code__c == countryWrapper.alpha3Code
                 && (country.CapitalCity__c == countryWrapper.capital || (String.isBlank(country.CapitalCity__c) && String.isBlank(countryWrapper.capital)))
                 && country.FlagImageUrl__c == countryWrapper.flag
                 && (country.Region__c == countryWrapper.region || (String.isBlank(country.CapitalCity__c) && String.isBlank(countryWrapper.capital)))
                 && country.RegionalBlocs__c == countryWrapper.regionalBlocsSummary);
    }
}