trigger contactsNumAccount on Account (after insert) {
    List<Contact> conList = new List<Contact>();
    Map<id,decimal> accMap = new Map<id,decimal>();
    for(Account acc : trigger.new){
        accMap.put(acc.Id, acc.Number_of_Locations__c);
    }
    for(Id accId : accMap.keySet()){
        for(Integer i =1; i<=accMap.get(accId);i++){
            Contact c = new Contact();
            c.accountid=accId;
            c.LastName = 'Contact' + i;
            insert c;
        }
    }
}

//The following trigger 
//creates the number of contacts
//which are equal to the number 
//which we will enter in the Number of Locations field
//on the Account Object