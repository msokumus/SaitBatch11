import { LightningElement } from 'lwc';

export default class ConditionalRendering2 extends LightningElement {
    country;
    showContent;
    showContent2;

    changeHandler(event){
        this.country = event.target.value;

        if(this.country === "Canada"){
            this.showContent = true;
        }else if(this.country === "Turkiye"){
            this.showContent2 = true;
            this.showContent = false;
        }
        else{
            this.showContent = false;
            this.showContent2 = false;
        }
    }
}

// copy past durumunda else if in calismasi icin ikinci secenek de false olarak eklenmeli.

/* import { LightningElement } from 'lwc';

export default class ConditionalRendering2 extends LightningElement {
    country;
    //showContentTr;

    changeHandler(event){
        this.country = event.target.value;
    }

    get showContent (){
        if(this.country === "USA"){
            return true;
        }else{
            return false;
        }
    }
} */