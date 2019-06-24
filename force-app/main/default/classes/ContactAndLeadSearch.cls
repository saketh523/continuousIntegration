public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String name){
        List<List<sObject>> searchList = [FIND :name IN NAME FIELDS 
                                         RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];
        return searchList;       
    }
}