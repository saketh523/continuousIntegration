public class RandomContactFactory
{
	public static List<Contact> generateRandomContacts( Integer n, String str)
	{
		List<Contact> cont = new List<Contact>();
		
		for( Integer i = 0; i < n; i++ )
		{
			Contact con = new Contact( FirstName = 'Test '+i, LastName = str );
			cont.add( con );
		}
		return cont;
	}
}