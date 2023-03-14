import { LightningElement, wire } from 'lwc';
import OPP from '@salesforce/schema/Opportunity';
import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';

export default class GetOpportunityPicklistSunday extends LightningElement {
defaultRtId;
stageOptions;
typeOptions;

selectedOpp;
selectedStage;
selectedType;


    @wire (getObjectInfo, {objectApiName : OPP})
    objectInfoHandler({data, error}){
        if(data){
            this.defaultRtId = data.defaultRecordTypeId;
        }
        if(error){
            console.error(error);
        }
    }

    @wire (getPicklistValuesByRecordType, {objectApiName : OPP, recordTypeId:'$defaultRtId'})
    picklistHandler({data, error}){
        if(data){
            console.log('PickList Values OPP =>' , data);
            this.stageOptions = data.picklistFieldValues.StageName.values;
            this.typeOptions = data.picklistFieldValues.Type.values;
        }
        if(error){
            console.error(error);
        }
    }
    changeHandler(event){
        if(event.target.label === "Opportunity Name"){
            this.selectedOpp = event.target.value;
        }
        if(event.target.label === "Stage Name"){
            this.selectedStage = event.target.value;
        }
        if(event.target.label === "Type"){
            this.selectedType = event.target.value;
        }
    }
    get result(){
        return this.selectedOpp && this.selectedStage && this.selectedType
    }


}