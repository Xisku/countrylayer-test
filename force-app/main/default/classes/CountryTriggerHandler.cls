public class CountryTriggerHandler {
    public void afterInsert(Map<Id,Country__c> triggerNewMap,Map<Id,Country__c> triggerOldMap){
        CountryTriggerHelper.updateRelatedLeads(triggerNewMap,triggerOldMap);
    }
    
    public void afterUpdate(Map<Id,Country__c> triggerNewMap,Map<Id,Country__c> triggerOldMap){
        CountryTriggerHelper.updateRelatedLeads(triggerNewMap,triggerOldMap);
    }
}