global class batchApexClass implements 
   Database.Batchable<sObject>, Database.Stateful 
   {
   
global Integer recordsProcessed = 0;
   global Database.QueryLocator start(Database.BatchableContext bc) {
       return Database.getQueryLocator('SELECT ID,NAME,Updatename__c FROM ACCOUNT ');
   }
       
global void execute(Database.BatchableContext bc, List<Account> scope){
  List <Account> acclist = new  list <Account>();
   for (Account account : scope) {
       account.Updatename__c =   'updated account' ;
       acclist.add(account);
   }
   update acclist;
}
       
global void finish(Database.BatchableContext bc){        
         Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
   AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
           JobItemsProcessed,
           TotalJobItems, CreatedBy.Email
           FROM AsyncApexJob
           WHERE Id = :bc.getJobId() limit 1];
   System.debug('Processed');
              
   }           
}