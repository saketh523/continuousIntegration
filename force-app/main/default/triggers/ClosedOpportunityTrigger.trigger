trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    List<Task> myList = new List<Task>();
    List<Opportunity> oppList = [select id,StageName from Opportunity where StageName = 'Closed Won' AND Id IN :Trigger.new];
    for(Opportunity op : oppList){
        myList.add(
            new task (
                Subject ='Follow Up Test Task' ,
                WhatId=op.Id)
        );
    }
     if(myList.size() > 0){
         insert myList;
   }
}