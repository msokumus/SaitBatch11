import { api, LightningElement, wire } from 'lwc';
import { getFieldDisplayValue, getFieldValue, getRecord } from 'lightning/uiRecordApi';

import CONTACT from '@salesforce/schema/Contact';
import FIRSTNAME from '@salesforce/schema/Contact.FirstName';
import LASTNAME from '@salesforce/schema/Contact.LastName';
import TITLE from '@salesforce/schema/Contact.Title';
import EMAIL from '@salesforce/schema/Contact.Email';
import MOBILE from '@salesforce/schema/Contact.MobilePhone';
import DEPT from '@salesforce/schema/Contact.Department';

const FIELDS = [FIRSTNAME,LASTNAME,TITLE,EMAIL,MOBILE,DEPT];

export default class GetRecordContactSunday extends LightningElement {

    //         @api recordId
    recordId ='003Do000002Ph46IAC'; //Contact ID oldugu icin yukarida Contact sobject i import etmeye gerek yok.
    firstName;
    lastName;
    title;
    email;
    mobile;
    dept;

    @wire (getRecord, {recordId : '$recordId', fields : FIELDS})
    recordHandler({data, error}){
        if(data){
            console.log('Contact Data => ', data);
            this.firstName = getFieldValue (data, FIRSTNAME);
            this.lastName = getFieldValue (data, LASTNAME);
            this.title = getFieldValue (data, TITLE); 
            this.email = getFieldValue (data, EMAIL);
            this.mobile = getFieldValue (data, MOBILE);
            this.dept = getFieldValue (data, DEPT);         
        }
        if(error){
            console.error(error); 
        }
    }
/*      get fullName(){
        return this.firstName + " " +this.lastName; 
    }
*/
}