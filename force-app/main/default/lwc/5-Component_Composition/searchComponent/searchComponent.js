import getMatchingContact from '@salesforce/apex/ContactCtrl.getMatchingContact';
import { LightningElement } from 'lwc';

const COLUMNS =[
    {label:"First Name", fieldName:"FirstName", type:"text"},
    {label:"Last Name", fieldName:"LastName", type:"text"},
    {label:"Title", fieldName:"Title", type:"text"},
    {label:"Department", fieldName:"Department", type:"text"}
]


export default class SearchComponent extends LightningElement {
    contacts;
    columns = COLUMNS;
    error;

    changeHandler(event){
        const searchWord = event.target.value;

        if (searchWord.length == 0){  // burasi search bari kontrol ediyor
            this.contacts = undefined;
            this.error = undefined;
        } else {
            getMatchingContact({searchKey : searchWord})
            .then(result =>{
                if(result.length == 0){  // burasi sonucu kontrol ediyor
                    this.contacts = undefined;
                    this.error = "Please use other search criteria";
                }else {
                    this.contacts = result;
                    this.error = undefined;
                }

            })
            .catch(error =>{
                this.contacts = undefined;
                this.error = error.body.message;

            })
            p
        }        
    }    
}
