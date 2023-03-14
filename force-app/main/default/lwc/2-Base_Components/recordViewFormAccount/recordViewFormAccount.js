import { api, LightningElement } from 'lwc';

import NAME from '@salesforce/schema/Account.Name';
import TYPE from '@salesforce/schema/Account.Type';
import INDUSTRY from '@salesforce/schema/Account.Industry';
import ANNUAL from '@salesforce/schema/Account.AnnualRevenue';
import RATING from '@salesforce/schema/Account.Rating';


import ACC from '@salesforce/schema/Account';
import PRIORITY from '@salesforce/schema/Account.CustomerPriority__c';

export default class RecordViewFormAccount extends LightningElement {
    objectName = ACC;
    @api recordId; // otomatik olarak ID yi record sayfasindan alir. bunu sadece record page de kullanabiliriz.
    
    fields ={
    name : NAME,
    type : TYPE, 
    annualRev:ANNUAL,
    industry:INDUSTRY,
    rating:RATING,
    priority:PRIORITY,
    }
}
