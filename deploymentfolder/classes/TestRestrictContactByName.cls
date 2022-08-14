@isTest
(SeeAllData=false)

 public class TestRestrictContactByName{

    @isTest static void RestrictContactByNameTest()
    {
        Contact c=new Contact(LastName='INVALIDNAME',FirstName='ABHINAV');
         insert c;  
        }
       
    }