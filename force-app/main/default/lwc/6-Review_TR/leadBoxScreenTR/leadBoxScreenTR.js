import searchname from '@salesforce/apex/LeadControllerTR.searchname';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import IND from '@salesforce/schema/Lead.Industry';
import LEAD from '@salesforce/schema/Lead';
import searchIndustry from '@salesforce/apex/LeadControllerTR.searchIndustry';


export default class LeadBoxScreenTR extends LightningElement {
    isName = false;
    isIndustry = false;
    industryOptions = [];
    leads;
    error;

    @wire(getObjectInfo, {objectApiName:LEAD})
    leadInfo;

    @wire(getPicklistValues, {fieldApiName:IND, recordTypeId:'$leadInfo.data.defaultRecordTypeId'})
    picklistHandler({data, error}){
        console.log('data = ' , data);
        if (data) {
            this.industryOptions = data.values;
        }
        if (error) {
            console.error(error);
        }
    }

    handleClick(event){
        if (event.target.label === "Search by Name") { //html den gelen label
            this.isName = !this.isName; // burada this ile cagiriyoruz. tiklayinca hem aciliyor hem kapaniyor. tersini yap dedik.
            this.leads = undefined; // tikladigimizda eger varsa liste temizlensin.
            this.isIndustry = false; // digerini kapatiyor.
            // this.isName = true; // bu komut tiklayinca acilmasini sagiliyor.
            this.error = undefined; // ben ekledim. hata mesaji varsa temizle
        } else {
            this.isIndustry = !this.isIndustry;
            this.leads = undefined; // cikan liste varsa listeyi temizle
            this.isName = false;  // digerini kapat
            this.error = undefined; // ben ekledim hata mesaji varsa temizle
        }
       
    }  

    changeHandler(event){
        const selectedName = event.target.value;
        const selectedIndustry = event.target.value;
        if (event.target.label === "Enter Search Word") {
            searchname({word:selectedName})  // burada this. seklinde kullanima gerek yok. ayni parantez icinde kullanim.
                .then(result => {
                    if (result.length > 0 && selectedName.length > 1) {
                        this.leads = result;
                        //console.log('leads => ', this.leads);
                        this.error = undefined; // listeyi temizle
                    } else if (selectedName.length == 0 ) {   // ben ekledim. arama cubugu silinince hata siliniyor.
                        this.error = undefined; // ben ekledim
                        this.leads = undefined; // ben ekledim
                    } else {
                        this.error = "Aradiginiz record bulunamadi";
                        this.leads = undefined; // listeyi temizle
                    }
            })
        } else {
            searchIndustry({industry:selectedIndustry})
                .then(result => {
                    if (result.length > 0) {
                        this.leads = result;
                        this.error = undefined;
                    } else {
                        this.error = "Listemizde aradiginiz industry de bir record bulunamadi..";
                        this.leads = undefined; // ben ekledim
                    }
                    
                })
                .catch(error => {
                    this.error = error.body.message;
                })
        }
        
    }
}


// if icine null degilse gibi bir sey ekleyip hata durumu tanimlayabiliriz. ???    