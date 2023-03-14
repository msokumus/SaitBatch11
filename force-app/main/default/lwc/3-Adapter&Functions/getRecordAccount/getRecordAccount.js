import { getFieldDisplayValue, getFieldValue, getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';

import NAME from '@salesforce/schema/Account.Name';
import ANNUAL from '@salesforce/schema/Account.AnnualRevenue';
import INDUSTRY from '@salesforce/schema/Account.Industry';
import RATING from '@salesforce/schema/Account.Rating';
import TYPE from '@salesforce/schema/Account.Type';

import ACC from '@salesforce/schema/Account'; // Buna gerek yok. Cunku ID var.

const FIELDS = [NAME, ANNUAL, INDUSTRY, RATING,TYPE];

export default class GetRecordAccount extends LightningElement {
    recordId ='001Do000003DmbOIAS'; //Account ID oldugu icin yukarida Account sobject i import etmeye gerek yok.
    name;
    revenue;
    industry;
    rating;
    type;

    @wire (getRecord, {recordId : '$recordId', fields : FIELDS})
    recordHandler({data, error}){
        if(data){
            console.log('Account Data => ', data);
            this.name = getFieldValue (data, NAME);
            this.revenue = getFieldDisplayValue (data, ANNUAL); //display value ile dolar olarak gozukur
            this.industry = getFieldValue (data, INDUSTRY);
            this.rating = getFieldValue (data, RATING);
            this.type = getFieldValue (data, TYPE);         
        }
        if(error){
            console.error(error); 
        }
    }
}