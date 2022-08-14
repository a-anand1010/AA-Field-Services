public class ContactAndLeadSearch {
	public static List<List< SObject>> searchContactsAndLeads(String s)
    {
        List<List< SObject>> result=[FIND :s IN ALL FIELDS 
                                    RETURNING Contact(FirstNAme,LastNAme),Lead(FirstNAme,LastNAme)];
        
        return result;
    }
}