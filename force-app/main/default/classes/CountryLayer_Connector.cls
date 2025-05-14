public class CountryLayer_Connector {
    public static Map<String,CountryLayerAPI_Wrapper.CountryWrapper> getAllCountries(){
        Map<String,CountryLayerAPI_Wrapper.CountryWrapper> countriesToReturn = new Map<String,CountryLayerAPI_Wrapper.CountryWrapper>();
        
        //NOTE: Named Credentials don't support credentials in query params because it's exploitable, so a custom metadata was created.
        String RESOURCE_PATH = ConstantDefinition__mdt.getInstance('CountryLayer_AllCountriesPath').Value__c;
        String API_KEY = ConstantDefinition__mdt.getInstance('CountryLayer_ApiKey').Value__c;
        String API_KEY_PARAM = ConstantDefinition__mdt.getInstance('CountryLayer_ApiKeyParam').Value__c;
        
        Http h = new Http();
        
        // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint and api key
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:CountryLayer/'+RESOURCE_PATH+'?'+API_KEY_PARAM+'='+API_KEY);
        req.setMethod('GET');
        
        // Send the request, and return a response
        HttpResponse res = h.send(req);
        
        if(res.getStatusCode() == 200){
            countriesToReturn = CountryLayerAPI_Wrapper.parseList(res.getBody());
        } else {
            throw new CalloutException();
        }
        
        return countriesToReturn;
    }
}