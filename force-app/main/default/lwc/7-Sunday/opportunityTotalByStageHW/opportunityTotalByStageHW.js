import { LightningElement, wire } from 'lwc';
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import STAGENAME_FIELD from '@salesforce/schema/Opportunity.StageName';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';

import totalByStage from '@salesforce/apex/OpportunityCtrl.totalByStage';

export default class OpportunityTotalByStageHW extends LightningElement {
    stageOptions=[];
    error;
    oppTotal;
    
    @wire(getObjectInfo, {objectApiName:OPPORTUNITY_OBJECT})
    oppInfo;
    
    

    @wire(getPicklistValues, {fieldApiName:STAGENAME_FIELD, recordTypeId:'$oppInfo.data.defaultRecordTypeId'})
    picklistHandler({data,error}){
        if(data){
            this.stageOptions=data.values;
        }
        if(error){
            this.error=error;
        }
    }
    changeHandler(event){
        const selectedStage=event.target.value;
        totalByStage({stage:selectedStage})

        .then(result=>{
            if(result>0){
                this.oppTotal=result;
                this.error=undefined;

            }else{
                this.error='There are no matching opportunities for the selected stage.'
                this.oppTotal=undefined;
            }
            
        })
        .catch(error=>{
            this.error=error.body.message
            this.oppTotal=undefined;

        });

    }

}