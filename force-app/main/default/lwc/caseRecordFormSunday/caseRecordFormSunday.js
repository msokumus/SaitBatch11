import { LightningElement } from 'lwc';

import CASE from '@salesforce/schema/Case';
import ACCOUNTID from '@salesforce/schema/Case.AccountId';
import CONTACTID from '@salesforce/schema/Case.ContactId';
import SUBJECT from '@salesforce/schema/Case.Subject';
import DESCRIPTION from '@salesforce/schema/Case.Description';
import PRIORITY from '@salesforce/schema/Case.Priority';
import ORIGIN from '@salesforce/schema/Case.Origin';


export default class CaseRecordFormSunday extends LightningElement {

objectName = CASE;
caseFields = [ACCOUNTID,CONTACTID, SUBJECT, DESCRIPTION, PRIORITY, ORIGIN ];
recordId ='500Do0000039fApIAI';
}