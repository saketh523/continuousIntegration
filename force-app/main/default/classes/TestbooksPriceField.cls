@isTest
public class TestbooksPriceField {
    static testmethod void pricevalue(){
        Books__c b = new Books__c();
        b.Name = 'RandomTest';
        b.Price__c      = 1000;
        insert b;
     	System.debug(b);
    }
}