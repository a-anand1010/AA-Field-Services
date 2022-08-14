trigger ExampleTrigger on Contact (after insert, after delete) {
    if (Trigger.isInsert) {
        Integer recordCount = Trigger.New.size();
        // Call a utility method from another class
        EmailManager.sendMail('abhim12d31@gmail.com', 'URGENT FROM CAPGEMINI', 
                    recordCount + ' contact(s) were inserted.');
    }
    else if (Trigger.isDelete) {
       
         EmailManager.sendMail('abhim12d31@gmail.com', 'URGENT FROM CAPGEMINI', 
                     ' contact(s) were deleted.');
        System.debug('Trigger fired after deletion');
    }
}