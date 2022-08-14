import { LightningElement,wire,track } from 'lwc';
import displaysr from '@salesforce/apex/EFS_CalendarView.getsr';
import displaydt from '@salesforce/apex/EFS_CalendarView.getdates';
import { NavigationMixin } from 'lightning/navigation';
export default class CalenderView extends NavigationMixin(LightningElement) {
    @track srdata;
    @track dtdata;
    @track data;
    @track error;
    @track today
    @track today1
    @track today2
    @track today3
    @track today4
    @track resourceType = 'All Users';

    //@track currentDate;
    ResourceType(event){
        const field = event.target.name;
    if (field === 'optionSelect') {
        this.resourceType = event.target.value;
        }    
        
    }

    /*selectDate(event)
    {
        const field = event.target.name;
    if (field === 'getDate') {
        this.currentDate = event.target.value;
        alert(this.currentDate);
        }    
    }*/

    @wire (displaysr, {resourceType : '$resourceType'})
    CountRecord({data, error}){
        if(data){
            this.srdata = data;
            console.log('....'+this.srdata);
        }
        else if(error){
            this.error = error;
        }
    }
    @wire (displaydt)
    DateRecord({data, error}){
        if(data){
            this.dtdata = data;
            console.log('date......'+this.dtdata);
            this.today = this.dtdata[0]
            this.today1 = this.dtdata[1]
            this.today2 = this.dtdata[2]
            this.today3 = this.dtdata[3]
            this.today4 = this.dtdata[4]
        }
        else if(error){
            this.error = error;
        }
}

    navigateToRecordPage(event){
        let opId = event.target.getAttribute('data-id');
        let object = event.target.getAttribute('obj');
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                
                recordId: opId,
                objectApiName: object,
                actionName: 'view'

            }
        });
    }
}