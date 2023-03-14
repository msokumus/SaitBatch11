import getMatchingOpps from '@salesforce/apex/OpportunityCtrl.getMatchingOpps';
import { LightningElement, wire } from 'lwc';

const COLUMNS=[
    {label:"Opp Name", fieldName:"Name",type:"text"}, // string oldugu icin type olarak text yazabiliriz. type yazmak sart degil
    {label:"Type", fieldName:"Type",type:"text"},
    {label:"Stage Name", fieldName:"StageName",type:"text"},
    {label:"Amount", fieldName:"Amount",type:"currency"}
];

export default class WiredApex2 extends LightningElement {

    stageN = "Closed Won"; // ORG da bu sekilde record olmali cikmiyorsa degistir.
    columns = COLUMNS;

    @wire (getMatchingOpps, {stage : '$stageN'}) //method da parametrte oldugu icin burada da olmali
    opps; // local properties
}