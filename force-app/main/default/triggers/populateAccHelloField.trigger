trigger populateAccHelloField on Account (before insert, before update) {
    List<Account> acc = new List<Account>();
    for(Account a : trigger.new){
        a.Hello__c = 'World';
    }
}