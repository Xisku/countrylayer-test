public class CountryTriggerHelper {
    public static void updateRelatedLeads(Map<Id,Country__c> triggerNewMap,Map<Id,Country__c> triggerOldMap){
        Map<String,String> modifiedCountriesSummaries = new Map<String,String>();
        
        // Loop through the triggerNewMap to find modified countries
        for (Country__c newCountry : triggerNewMap.values()) {
            Country__c oldCountry = triggerOldMap?.get(newCountry.Id);
            
            if (oldCountry == null || countryHasChanged(oldCountry, newCountry)) {
                modifiedCountriesSummaries.put(newCountry.Alpha2Code__c, getCountrySummary(newCountry));
            }
        }
        
        // If there are modified countries, update related leads
        if (!modifiedCountriesSummaries.isEmpty()) {
            List<Lead> leadsToUpdate = new List<Lead>();
            
            for (Lead lead : [SELECT Id, CountryCode, CountryInfo__c FROM Lead WHERE CountryCode IN :modifiedCountriesSummaries.keySet()]) {
                lead.CountryInfo__c = modifiedCountriesSummaries.get(lead.CountryCode);
                leadsToUpdate.add(lead);
            }

            if (!leadsToUpdate.isEmpty()) {
                update leadsToUpdate;
            }
        }
    }

    //Checks if country has changed
    private static boolean countryHasChanged(Country__c oldCountry, Country__c newCountry){
        return !(oldCountry.Name == newCountry.Name
                 && oldCountry.Alpha2Code__c == newCountry.Alpha2Code__c
                 && oldCountry.Alpha3Code__c == newCountry.Alpha3Code__c
                 && (oldCountry.CapitalCity__c == newCountry.CapitalCity__c || (String.isBlank(oldCountry.CapitalCity__c) && String.isBlank(newCountry.CapitalCity__c)))
                 && oldCountry.FlagImageUrl__c == newCountry.FlagImageUrl__c
                 && (oldCountry.Region__c == newCountry.Region__c || (String.isBlank(oldCountry.CapitalCity__c) && String.isBlank(newCountry.CapitalCity__c)))
                 && oldCountry.RegionalBlocs__c == newCountry.RegionalBlocs__c);
    }

    //Returns formatted country information summary
    public static String getCountrySummary(Country__c country) {
        if (country == null) return '';
        
        String summary = 'Country: ' + country.Name + '\n';
        
        if (String.isNotBlank(country.CapitalCity__c)) {
            summary += 'Capital: ' + country.CapitalCity__c + '\n';
        }
        
        if (String.isNotBlank(country.Region__c)) {
            summary += 'Region: ' + country.Region__c + '\n';
        }
        
        if (String.isNotBlank(country.Alpha2Code__c)) {
            summary += 'Country Codes: ' + country.Alpha2Code__c + '/' + country.Alpha3Code__c + '\n';
        }
        
        if (String.isNotBlank(country.RegionalBlocs__c)) {
            summary += 'Regional Blocs: ' + country.RegionalBlocs__c + '\n';
        }
        
        return summary;
    }
}