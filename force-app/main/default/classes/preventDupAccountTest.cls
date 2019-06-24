@istest
public class preventDupAccountTest {
    static testmethod void dupcheck(){
        Account acc = new Account();
        acc.name = 'Ankit Sharma';
        insert acc;   
         Account acc2 = new Account();
        acc2.name = 'Ankit Sharma';
        insert acc2; 
    }
}