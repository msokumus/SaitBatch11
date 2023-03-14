import { LightningElement, track, wire } from 'lwc';
import searchContacts from '@salesforce/apex/ContactCtrl.getMatchingContact';

const columns = [
    { label: 'First Name', fieldName: 'FirstName', type: 'text' },
    { label: 'Last Name', fieldName: 'LastName', type: 'text' },
    { label: 'Email', fieldName: 'Email', type: 'email' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' }
];

export default class Test extends LightningElement {
    @track searchKey;
    @track contacts;
    @track columns = columns;

    handleSearchKeyChange(event) {
        this.searchKey = event.target.value;
    }

    handleSearch() {
        searchContacts({ searchKey: this.searchKey })
            .then(result => {
                this.contacts = result;
            })
            .catch(error => {
                // handle the error
            });
    }
}
