global class updateAccLastNameBatch implements Database.Batchable<sObject>,Database.Stateful {
 global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT ID,name,UpdateName__c from Account' );
    }
    global void execute(Database.BatchableContext bc, List<Account> scope){
       List<Account> acc = new List<Account>();
        for (Account acc1 : scope) 
        	{
            	acc1.UpdateName__c =  'Updated';            	
            	acc.add(acc1);
            }
                update acc;
        }    
    global void finish(Database.BatchableContext bc){
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
    }    
}