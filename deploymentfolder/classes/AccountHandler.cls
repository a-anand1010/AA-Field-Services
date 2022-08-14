public class AccountHandler {
public static void insertAccount(Integer numberofAccts)
{
    Integer N=1;
    List<Account> addAccounts=new List<Account>();
    while(N<=numberofAccts)
    {
        Account a=new Account();
        a.Name='Acme Inc'+N;
        a.AccountNumber='A000n';
        addAccounts.add(a);
        N++;
    }
    insert addAccounts;
}
}