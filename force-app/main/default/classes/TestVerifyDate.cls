@isTest
(SeeAllData=false)

 public class TestVerifyDate {

    @isTest static void CheckDatesTest()
    {
        Date d=VerifyDate.CheckDates(System.today(),System.today().addDays(15));
        Date d1=VerifyDate.CheckDates(System.today(),System.today().addDays(32));
    }
    
  
}