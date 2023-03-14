import { getFieldDisplayValue, getFieldValue, getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';


//* ikinci yol icin import ettik
import FIRSTNAME from '@salesforce/schema/Contact.FirstName';
import LASTNAME from '@salesforce/schema/Contact.LastName';
import ACCOUNT from '@salesforce/schema/Contact.Account.Name';
import DEPARTMENT from '@salesforce/schema/Contact.Department';
import LEADSOURCE from '@salesforce/schema/Contact.LeadSource';
import EMAIL from '@salesforce/schema/Contact.Email';
//* ikinci yol

export default class GetRecordContact extends LightningElement {
    recordId = '003Do000002Ph4DIAS';

    firstName;
    lastName;
    accountName;
    department;
    leadSource;
    email;


    @wire(getRecord, {recordId: '$recordId', layoutTypes:['Full']})
    recordHandler({data, error}){
        if(data){
            console.log('Contact Data => ', data);

            //* Birinci Yol
            this.firstName = data.fields.FirstName.value;
            this.lastName = data.fields.LastName.value;
            this.accountName = data.fields.Account.displayValue;
            this.department = data.fields.Department.value;
            this.leadSource = data.fields.LeadSource.displayValue;
            this.email = data.fields.Email.value; 

/*          //* Ikinci yol
            this.firstName = getFieldValue (data, FIRSTNAME);
            this.lastName = getFieldValue (data, LASTNAME);
            this.accountName = getFieldValue (data, ACCOUNT);
            this.department = getFieldValue (data, DEPARTMENT);
            this.leadSource = getFieldDisplayValue (data, LEADSOURCE); // DisplayValue local degerleri gosteriyor. Yani tarih para tipi gibi. Bunun yerine Value da kullanilabilir
            this.email = getFieldValue (data, EMAIL); */
            
        }
        if(error){
            console.error(error); 
        }
    }
}