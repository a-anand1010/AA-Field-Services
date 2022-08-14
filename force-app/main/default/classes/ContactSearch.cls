public class ContactSearch {

    	public static Contact[] searchForContacts(string s,string t)
        {
            List<Contact> c= [SELECT ID,Name FROM Contact Where LastName=:s AND MailingPostalCode=:t];
            return c;
        }
}