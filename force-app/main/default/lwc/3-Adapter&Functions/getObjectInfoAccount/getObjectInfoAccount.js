import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import ACCOUNT from '@salesforce/schema/Account';

export default class GetObjectInfoAccount extends LightningElement {
    accRtId;
    
    @wire (getObjectInfo, { objectApiName: ACCOUNT })
    infoHandler({data, error}){
            if(data){
                console.log(data);
                this.accRtId = data.defaultRecordTypeId;

            }
            if(error){
                console.log(error);
            }        
    }
}