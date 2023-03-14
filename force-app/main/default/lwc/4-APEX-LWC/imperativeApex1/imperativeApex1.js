import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import OPPORTUNITY from '@salesforce/schema/Opportunity';
import STAGENAME from '@salesforce/schema/Opportunity.StageName';
import getMatchingOpps from '@salesforce/apex/OpportunityCtrl.getMatchingOpps';

const COLUMNS=[
    {label:"Opp Name", fieldName:"Name",type:"text"},
    {label:"Type", fieldName:"Type",type:"text"},
    {label:"Stage Name", fieldName:"StageName",type:"text"},
    {label:"Amount", fieldName:"Amount",type:"currency"}
];

export default class ImperativeApex1 extends LightningElement {
    stageOptions;
    opps;
    error;
    columns = COLUMNS;

    @wire(getObjectInfo,{objectApiName : OPPORTUNITY})
    oppInfo;

    @wire(getPicklistValues, {fieldApiName : STAGENAME, recordTypeId:'$oppInfo.data.defaultRecordTypeId'})
    pickListHandler({data, error}){
        if (data) {
               this.stageOptions = data.values;
            }
            if (error) {
                console.error(error);
            }
        }

        changeHandler(event){
            const selectedStage = event.target.value;

            getMatchingOpps({stage : selectedStage})
                .then(result =>{
                    this.opps = result;
                })
                .catch(error =>{
                    this.error = error;
                })
        }
}