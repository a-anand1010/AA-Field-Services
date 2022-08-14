trigger OrderEventTrigger on Order_Event__e (after insert) {

    List<Task> Tasks= new List<Task>();
 for(Order_Event__e event : Trigger.New)  
 {
     if(event.Has_Shipped__c == true)
     {
        Task Ts=new Task();
         Ts.Priority='Medium';
         Ts.Subject='Follow up on shipped order 105';
         Ts.OwnerId=event.CreatedById;
         
         Tasks.add(Ts);
     }
     
 }
    Database.insert(Tasks);
}