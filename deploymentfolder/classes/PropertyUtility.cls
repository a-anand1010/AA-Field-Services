public class PropertyUtility {
    public static void newListedProperties()
    {
        List <Property__c> newPropList= [SELECT Name,Broker__r.Email__c,Days_On_Market__c FROM Property__C WHERE Date_Listed__c=LAST_N_DAYS:30];
        String propEmail;
	for(Property__c p : newPropList)
    {
        propEmail=p.Name+':'+p.Broker__r.Email__c;
        System.debug(propEmail);
    }
    }
    
}