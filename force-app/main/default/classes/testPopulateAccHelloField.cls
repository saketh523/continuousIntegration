@istest
public class testPopulateAccHelloField {
    static testmethod void updateHello(){
        Account acc = new Account();
        acc.Name = 'Yasodara';
        insert acc;
    }
}