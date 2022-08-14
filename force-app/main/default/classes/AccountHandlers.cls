public class AccountHandlers {
	public static Account insertNewAccount(String n)
	{	
     Account a=new Account(Name=n);
     
        try{
              insert a;  
            
       		 } 
       catch(DMLException e)
       {
           return null;
       }
     return a;
	}
}