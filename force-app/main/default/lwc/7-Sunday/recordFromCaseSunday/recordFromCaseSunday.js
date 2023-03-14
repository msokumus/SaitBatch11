import {api, LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import CASE from '@salesforce/schema/Case';
import AID from '@salesforce/schema/Case.AccountId';
import CID from '@salesforce/schema/Case.ContactId';
import SUB from '@salesforce/schema/Case.Subject';
import PRI from '@salesforce/schema/Case.Priority';
import STA from '@salesforce/schema/Case.Status';
import DESC from '@salesforce/schema/Case.Description';
import ORI from '@salesforce/schema/Case.Origin';


export default class  RecordFromCaseSunday extends LightningElement {
   
    objectName = CASE
    recordId = "500Do000001cHTwIAM"; // id ekledigimizde form bos gelmez bu record ile gelir.

    // @api recordId ='006Do00000313YvIAI';
    // caseFields = [AID, CID,SUB,PRI,STA,DESC,ORI]; // bunu record formda kullanabiliriz. buradaki sira ekranda gozukme sirasi

    fields = {
        aid:AID,
        cid:CID,
        sub:SUB,
        pri:PRI,
        sta:STA,
        desc:DESC,
        ori:ORI,
    }

    successHandler(){
        const successEvent = new ShowToastEvent({
            title: 'Success',
            message:'Case record has been saved successfully',
            variant:'success' // yazim hatasi yaparsak gri renkli toast mesaji cikar
        });
        this.dispatchEvent(successEvent);
    }
    errorHandler(){
        this.dispatchEvent(new ShowToastEvent({
            title: 'Error',
            message: 'An error has been occurred!',
            variant: 'error'
        }));
    }
}
