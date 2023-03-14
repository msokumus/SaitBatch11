import { api, LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import OPP from '@salesforce/schema/Opportunity';
import NAME from '@salesforce/schema/Opportunity.Name';
import AID from '@salesforce/schema/Opportunity.AccountId';
import AMO from '@salesforce/schema/Opportunity.Amount';
import CD from '@salesforce/schema/Opportunity.CloseDate';
import SN from '@salesforce/schema/Opportunity.StageName';
import TYPE from '@salesforce/schema/Opportunity.Type';


export default class RecordEditFormOpportunity extends LightningElement {
    // @api recordId ='006Do00000313YvIAI';
    recordId ='006Do00000313YvIAI';
    objectName = OPP;

    fields = {
        name:NAME,
        accid:AID,
        amo:AMO,
        cd:CD,
        sn:SN,
        type:TYPE,
    }

    successHandler(){
        const successEvent = new ShowToastEvent({
            title: 'Success',
            message:'Opportunity record has been saved successfully',
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