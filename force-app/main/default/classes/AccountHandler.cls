//create an Apex class that inserts a new account named after an incoming parameter.
// If the account is successfully inserted, 
// the method should return the account record. 
// If a DML exception occurs, the method should return null.
//The method must also accept an empty string, catch the failed DML and then return null

public class AccountHandler {
    public static Account insertNewAccount(String accName){
        try{
        Account acc = new Account(name = accName);
        insert acc;
        return acc;
        }
        catch (DmlException e) {
    System.debug('A DML exception has occurred: ' +
                e.getMessage());
            return null;
		}
    }
}