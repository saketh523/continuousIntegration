trigger accConTrigger on Account (after insert, after update){
    
    List<Account> conList = new List<Account>();
    for(Account a : trigger.new)
    {
        conList = [select id,(select id,name from Contacts) from Account];
     }
    System.debug(conList);
}