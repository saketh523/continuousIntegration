trigger booksPriceField on Books__c (before insert, before update){
    for(Books__c b : trigger.new){
        if(b.Price__c!=null && b.Price__c>0){
            b.Price__c = (0.90 * b.Price__c);
        }
    }
}