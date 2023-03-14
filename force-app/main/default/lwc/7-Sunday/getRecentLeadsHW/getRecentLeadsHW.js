import searchRecent from '@salesforce/apex/LeadControllerTR.searchRecent';
import { LightningElement, wire } from 'lwc';


const COLUMNS=[
    {label:"First Name", fieldName:"FirstName",type:"text"},
    {label:"Last Name", fieldName:"LastName",type:"text"},
    {label:"Title", fieldName:"Title",type:"text"},
    {label:"Company", fieldName:"Company",type:"text"}
]


export default class GetRecentLeadsHW extends LightningElement {
    // isButton = false;
    leads;
    error;
    columns = COLUMNS;

    handleClick(){
        if(this.leads || this.error){
            this.leads=undefined;
            this.error=undefined;
        } else{
            searchRecent()
            .then(result => {
                this.leads=result;
            })
            .catch(error =>{
                this.error=error;
            })
        }
        //this.isButton= !this.isButton;
   
    } 

}
