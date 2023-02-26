import { LightningElement } from 'lwc';
import NAME from '@salesforce/schema/Account.Name';
import TYPE from '@salesforce/schema/Account.Type';
import INDUSTRY from '@salesforce/schema/Account.Industry';
import ANNUAL from '@salesforce/schema/Account.AnnualRevenue';
import ACC from '@salesforce/schema/Account';

export default class RecordFromAccount extends LightningElement {
    // accFields = ['Name','Type','Industry','AnnualRevenue']; // static yazim yerine asagidaki gibi yaptik.
    objectName = ACC
    accFields = [NAME,TYPE, INDUSTRY, ANNUAL];
    recordId = "001Do000002nGJcIAM"; // id ekledigimizde form bos gelmez bu record ile gelir.
}