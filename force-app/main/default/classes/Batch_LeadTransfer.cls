public class Batch_LeadTransfer {
	@invocablemethod
    public static void executeaction(){
    List<User> userQuery = [SELECT Id,Replaced_By_ID__c FROM User WHERE Accounts_Transferred__c = FALSE and Replaced_By_ID__c!=null];
	Map<Id,User> Usermap=new Map<Id,User>();
    List<Lead> leads=new List<Lead>();
            for(user u: userQuery){
                userMap.put(u.Id,u);
                system.debug('+++++++++++++++++'+userMap);
                }
	for(Lead L: [select Id,OwnerId from Lead where OwnerId In:userMap.keySet()]){
      system.debug('+============' +L);
        L.OwnerId =userMap.get(L.OwnerId).Replaced_By_ID__c;
        leads.add(L);
            }    
      if(leads.size()>0){
        update leads;
        }
        } 
    }