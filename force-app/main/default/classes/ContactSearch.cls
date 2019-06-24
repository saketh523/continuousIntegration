public class ContactSearch {
    public static List<Contact> searchForContacts(String lname, String mailcode)
    {
        List<Contact> con = [select id,name from contact where lastname=:lname and MailingPostalCode=:mailcode];
        return con;
	}
}