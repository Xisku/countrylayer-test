@isTest
public class CountryLayer_ConnectorTest {

@IsTest
    static void testGetAllCountries(){
        Test.setMock(HttpCalloutMock.class, new CountryLayerAPI_Mock());
        Map<String,CountryLayerAPI_Wrapper.CountryWrapper> countriesToReturn = new Map<String,CountryLayerAPI_Wrapper.CountryWrapper>();
        
        Test.startTest();
        countriesToReturn = CountryLayer_Connector.getAllCountries();
        Test.stopTest();
        
        System.assertEquals(2, countriesToReturn.size());
    }
}