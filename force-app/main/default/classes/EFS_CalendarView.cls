public with sharing class EFS_CalendarView {
@AuraEnabled(cacheable=true)
public static list< EFS_CalendarView.srWrapper> getsr(String resourceType){
        list<ServiceResource> srlist1 = new list<ServiceResource>();
        list<EFS_CalendarView.srWrapper> srwrapperlist =new list< EFS_CalendarView.srWrapper>();
        
        String strQuery = '';
        if (resourceType.equals('My Team'))
        {
            strQuery = 'select Id,Name,(select Id,StartTime,EndTime,ShiftNumber,tz_shift__c from ShiftServiceResources where Shift_Date__c = NEXT_N_DAYS:5 or Shift_Date__c = TODAY), (select Id,ServiceAppointmentId,ServiceAppointment.AppointmentNumber,Scheduled_Start_Date__c from ServiceAppointments WHERE Scheduled_Start_Date__c=  NEXT_N_DAYS:5 or Scheduled_Start_Date__c = TODAY),(select Id,AbsenceNumber,Start_Date__c,End_Date__c from ResourceAbsences WHERE Start_Date__c = LAST_N_DAYS:30 or Start_Date__c = TODAY or Start_Date__c = NEXT_N_DAYS:5 ORDER BY Start DESC ) from ServiceResource where My_Team__c = True and IsActive = TRUE';
        }
        else {
            strQuery = 'select Id,Name,(select Id,StartTime,EndTime,tz_shift__c,ShiftNumber,Shift_Date__c from ShiftServiceResources where Shift_Date__c = NEXT_N_DAYS:5 or Shift_Date__c = TODAY), (select Id,ServiceAppointmentId,ServiceAppointment.AppointmentNumber,Scheduled_Start_Date__c from ServiceAppointments WHERE Scheduled_Start_Date__c=  NEXT_N_DAYS:5 or Scheduled_Start_Date__c = TODAY),(select Id,AbsenceNumber,Start_Date__c,End_Date__c from ResourceAbsences WHERE Start_Date__c = LAST_N_DAYS:30 or Start_Date__c = TODAY or Start_Date__c = NEXT_N_DAYS:5 ORDER BY Start DESC ) from ServiceResource where IsActive = TRUE';
        }

srlist1 = database.query(strQuery);
system.debug('.......'+srlist1);

for(ServiceResource srobj : srlist1){
    //if(srr.id == srlist1.id ){
    EFS_CalendarView.srWrapper srwrap =new EFS_CalendarView.srWrapper();
    srwrap.Shift1 = new list<Shift>();
    srwrap.Shift2 = new list<Shift>();
    srwrap.Shift3 = new list<Shift>();
    srwrap.Shift4 = new list<Shift>();
    srwrap.Shift5 = new list<Shift>();
    srwrap.RA1 = new list<ResourceAbsence>();
    srwrap.SA1 = new list<AssignedResource>();
    srwrap.RA2 = new list<ResourceAbsence>();
    srwrap.SA2 = new list<AssignedResource>();
    srwrap.RA3 = new list<ResourceAbsence>();
    srwrap.SA3 = new list<AssignedResource>();
    srwrap.RA4 = new list<ResourceAbsence>();
    srwrap.SA4 = new list<AssignedResource>();
    srwrap.RA5 = new list<ResourceAbsence>();
    srwrap.SA5 = new list<AssignedResource>();
    srwrap.Id = srobj.Id;
    srwrap.Name = srobj.Name;
    for(Shift shiftsr : srobj.ShiftServiceResources)
    {
        String str1 = shiftsr.StartTime.format('HH:mm');
        String str2 = shiftsr.EndTime.format('HH:mm');
        List < String > strList = new List < String > { str1, str2};  
		String str = String.join( strList, '-' );  
        shiftsr.tz_shift__c = str;
              
        if(shiftsr.Shift_Date__c == system.today())
            srwrap.Shift1.add(shiftsr);
    }

    for(ResourceAbsence rasr: srobj.ResourceAbsences){ 
        if((rasr.Start_Date__c <= system.today())&& (rasr.End_Date__c >= system.today()))
            srwrap.RA1.add(rasr);
    }
    for(AssignedResource sasr: srobj.ServiceAppointments){ 
        if(sasr.Scheduled_Start_Date__c == system.today())
            srwrap.SA1.add(sasr);
    }

    for(Shift shiftsr : srobj.ShiftServiceResources)
    {
        String str1 = shiftsr.StartTime.format('HH:mm');
        String str2 = shiftsr.EndTime.format('HH:mm');
        List < String > strList = new List < String > { str1, str2};  
		String str = String.join( strList, '-' );  
        shiftsr.tz_shift__c = str;

        if(shiftsr.Shift_Date__c == system.today().AddDays(1))
        srwrap.Shift2.add(shiftsr);
        }

    for(AssignedResource sasr: srobj.ServiceAppointments){ 
        if(sasr.Scheduled_Start_Date__c == system.today().AddDays(1))
            srwrap.SA2.add(sasr);
    }

    for(ResourceAbsence rasr: srobj.ResourceAbsences){ 
        if((rasr.Start_Date__c <= system.today().AddDays(1))&& (rasr.End_Date__c >= system.today().AddDays(1)))
            srwrap.RA2.add(rasr);
    }

    for(Shift shiftsr : srobj.ShiftServiceResources)
    {
        String str1 = shiftsr.StartTime.format('HH:mm');
        String str2 = shiftsr.EndTime.format('HH:mm');
        List < String > strList = new List < String > { str1, str2};  
		String str = String.join( strList, '-' );  
        shiftsr.tz_shift__c = str;

        if(shiftsr.Shift_Date__c == system.today().AddDays(2))
        srwrap.Shift3.add(shiftsr);
    }
    
    for(AssignedResource sasr: srobj.ServiceAppointments){ 
        if(sasr.Scheduled_Start_Date__c == system.today().AddDays(2))
            srwrap.SA3.add(sasr);
    }

    for(ResourceAbsence rasr: srobj.ResourceAbsences)
    { 
        if((rasr.Start_Date__c <= system.today().AddDays(2))&& (rasr.End_Date__c >= system.today().AddDays(2)))
            srwrap.RA3.add(rasr);
    }

    for(Shift shiftsr : srobj.ShiftServiceResources)
    {
        String str1 = shiftsr.StartTime.format('HH:mm');
        String str2 = shiftsr.EndTime.format('HH:mm');
        List < String > strList = new List < String > { str1, str2};  
		String str = String.join( strList, '-' );  
        shiftsr.tz_shift__c = str;

        if(shiftsr.Shift_Date__c == system.today().AddDays(3))
        srwrap.Shift4.add(shiftsr);
    }
    
    for(AssignedResource sasr: srobj.ServiceAppointments)
    { 
        if(sasr.Scheduled_Start_Date__c == system.today().AddDays(3))
            srwrap.SA4.add(sasr);
    }
    
    for(ResourceAbsence rasr: srobj.ResourceAbsences)
    { 
        if((rasr.Start_Date__c <= system.today().AddDays(3))&& (rasr.End_Date__c >= system.today().AddDays(3)))
            srwrap.RA4.add(rasr);
    }

    for(Shift shiftsr : srobj.ShiftServiceResources)
    {
        String str1 = shiftsr.StartTime.format('HH:mm');
        String str2 = shiftsr.EndTime.format('HH:mm');
        List < String > strList = new List < String > { str1, str2};  
		String str = String.join( strList, '-' );  
        shiftsr.tz_shift__c = str;

        if(shiftsr.Shift_Date__c == system.today().AddDays(4))
        srwrap.Shift5.add(shiftsr);
    }
    
    for(AssignedResource sasr: srobj.ServiceAppointments){ 
        if(sasr.Scheduled_Start_Date__c == system.today().AddDays(4))
            srwrap.SA5.add(sasr);
    }
    
    for(ResourceAbsence rasr: srobj.ResourceAbsences){ 
        if((rasr.Start_Date__c <= system.today().AddDays(4))&& (rasr.End_Date__c >= system.today().AddDays(4)))
            srwrap.RA5.add(rasr);
    }

    srwrapperlist.add(srwrap);//}

}//}
system.debug('.....'+srwrapperlist);
return srwrapperlist;
    }



@AuraEnabled (cacheable=true) 
 public static list<string> getdates()
 {
     list<string> currentDate = new list<string>();
     for (Integer i = 0; i < 5; i++) 
     {
       date dt = system.today().adddays(i);
       string  st= dt.format();
       currentDate.add(st);
       
	}
	system.debug('date--->'+ currentDate);
    return currentDate;
 }
public class srWrapper{
        @AuraEnabled public String id{get;set;}
        @AuraEnabled public String Name{get;set;}
        @AuraEnabled public list<Shift> Shift1{get;set;}
        @AuraEnabled public list<AssignedResource> SA1{get;set;}
        @AuraEnabled public list<ResourceAbsence> RA1{get;set;}
        @AuraEnabled public list<Shift> Shift2{get;set;}
        @AuraEnabled public list<AssignedResource> SA2{get;set;}
        @AuraEnabled public list<ResourceAbsence> RA2{get;set;}
        @AuraEnabled public list<Shift> Shift3{get;set;}
        @AuraEnabled public list<AssignedResource> SA3{get;set;}
        @AuraEnabled public list<ResourceAbsence> RA3{get;set;}
        @AuraEnabled public list<Shift> Shift4{get;set;}
        @AuraEnabled public list<AssignedResource> SA4{get;set;}
        @AuraEnabled public list<ResourceAbsence> RA4{get;set;}
        @AuraEnabled public list<Shift> Shift5{get;set;}
        @AuraEnabled public list<AssignedResource> SA5{get;set;}
        @AuraEnabled public list<ResourceAbsence> RA5{get;set;}
    }
}