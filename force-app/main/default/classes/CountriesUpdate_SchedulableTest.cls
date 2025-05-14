@isTest
public class CountriesUpdate_SchedulableTest {

    @TestSetup
    static void setup() {
        Country__c afghanistan = new Country__c(
            Name = 'Afghanistan',
            CapitalCity__c = 'NotKabul',
            Alpha2Code__c = 'AF',
            Alpha3Code__c = 'AFG'
        );
        insert afghanistan;
        
        List<Lead> leads = new List<Lead>{
            new Lead(LastName = 'Test1', Company = 'Test1 Corp', Country = 'Afghanistan'),
            new Lead(LastName = 'Test2', Company = 'Test2 Corp', Country = 'Afghanistan')
        };
        insert leads;
    }

@IsTest
    private static void testExecute(){
        Test.setMock(HttpCalloutMock.class, new CountryLayerAPI_Mock());

        Test.startTest();
        CountriesUpdate_Schedulable schedulable = new CountriesUpdate_Schedulable();
        schedulable.execute(null);
        Test.stopTest();

        List<Country__c> countries = [SELECT Id FROM Country__c];
        System.assertEquals(2, countries.size());
    }
    
    @IsTest
    private static void testExecuteWithException(){
        
        Test.startTest();
        CountriesUpdate_Schedulable schedulable = new CountriesUpdate_Schedulable();
        try {
            schedulable.execute(null);
            System.assert(false, 'Expected exception was not thrown');
        } catch (CountryLayer_Exception e) {
            System.assertEquals('CountryLayer_Connector failed.', e.getMessage());
        }
        Test.stopTest();
    }

}