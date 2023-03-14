import { LightningElement, wire } from 'lwc';
import getTopAccounts from '@salesforce/apex/AccountCtrl.getTopAccounts'; // class icindeki metodu import edebiliriz. class import edilmez.

const COLUMNS=[
    {label:"Account Name", fieldName:"Name",type:"text"}, // string oldugu icin type olarak text yazabiliriz. type yazmak sart degil
    {label:"Type", fieldName:"Type",type:"text"},
    {label:"Industry", fieldName:"Industry",type:"text"},
    {label:"Annual Revenue", fieldName:"AnnualRevenue",type:"currency"}
]

export default class WiredApex1 extends LightningElement {
    columns = COLUMNS;

    @wire (getTopAccounts)
    accounts;
}