import { LightningElement } from 'lwc';

export default class TwoWayBinding extends LightningElement {
    fullname = 'Sait X';
    role;
    roleOptions =[        
            { label: 'Salesforce Admin', value: 'Admin' },
            { label: 'Salesforce Developer', value: 'Salesforce Developer' },
            { label: 'Salesforce Arcitect', value: 'Salesforce Arcitect' },
    ];
    // kodu kisaltmak icin ortak method kullanip if else kullandik.
    changeHandler(event){
        if(event.target.label === "Enter your name"){
            this.fullname = event.target.value;
        }else{
            this.role = event.target.value;
        }        
    }    
    // changeHandler(event){
    //    this.fullname = event.target.value;
    // }

    // changeHandlerCombobox(event){
    //    this.role = event.target.value;
    // }
}

// === 3 tane kullaninca hem key hem value kontrol ediyor.