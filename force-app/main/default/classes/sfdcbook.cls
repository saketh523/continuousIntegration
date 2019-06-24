public class sfdcbook {
    public static void sfdc(){
        List<Account> acc = new List<Account>();
        acc = [Select Id, Name From Account];
    }
}