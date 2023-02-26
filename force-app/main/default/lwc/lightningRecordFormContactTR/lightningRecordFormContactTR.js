import { LightningElement } from 'lwc';
import CONTACT from '@salesforce/schema/Contact';
import FIRSTNAME from '@salesforce/schema/Contact.FirstName';
import LASTNAME from '@salesforce/schema/Contact.LastName';
import LEADSOURCE from '@salesforce/schema/Contact.LeadSource';
import TITLE from '@salesforce/schema/Contact.Title';

export default class LightningRecordFormContactTR extends LightningElement {
    objectName = CONTACT;
    conFields = [FIRSTNAME, LASTNAME, LEADSOURCE, TITLE];
}