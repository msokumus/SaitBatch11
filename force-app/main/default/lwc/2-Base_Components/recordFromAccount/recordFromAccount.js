import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import NAME from '@salesforce/schema/Account.Name';
import TYPE from '@salesforce/schema/Account.Type';
import INDUSTRY from '@salesforce/schema/Account.Industry';
import ANNUAL from '@salesforce/schema/Account.AnnualRevenue';
import ACC from '@salesforce/schema/Account';

export default class RecordFromAccount extends LightningElement {
    // accFields = ['Name','Type','Industry','AnnualRevenue']; // static yazim yerine asagidaki gibi yaptik.
    objectName = ACC
    accFields = [NAME,TYPE, INDUSTRY, ANNUAL]; //buradaki sira ekranda gozukme sirasi
    recordId = "001Do000002nGJcIAM"; // id ekledigimizde form bos gelmez bu record ile gelir.
    successHandler(){
        const successEvent = new ShowToastEvent({
            title: 'Success',
            message:'Account record has been saved successfully',
            variant:'success' // yazim hatasi yaparsak gri renkli toast mesaji cikar
        });
        this.dispatchEvent(successEvent);
    }
    errorHandler(){
        const errorEvent = new ShowToastEvent({
            title:"Error",
            message:"An error has been occurred!",
            variant:"error"
        });
        this.dispatchEvent(errorEvent);
    }
}
