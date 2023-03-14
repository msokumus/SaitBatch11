import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import CASE from '@salesforce/schema/Case';

export default class GetObjectInfoCaseHW extends LightningElement {
    caseDefaultRtId;
    caseEnquiryRtId;

    @wire (getObjectInfo,{objectApiName : CASE})
    infoHandler({data, error}){
        if(data){
            console.log('DATA--> ', data);
            this.caseDefaultRtId = data.defaultRecordTypeId;

            const rtids = data.recordTypeInfos

            this.caseEnquiryRtId = Object.keys(rtids).find(rtid => rtids[rtid].name === "Enquiry");

        }
        if(error){
            console.log(error);
        }        
}

}


// Homework

// Pre-requisites: Create 2 record types on case object. 1. Customer Support 2. Enquiry

// Use Case: Get the default and Enquiry record type ids and display the same in HTML