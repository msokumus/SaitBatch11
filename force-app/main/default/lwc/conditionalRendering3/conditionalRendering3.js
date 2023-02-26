import { LightningElement } from 'lwc';

export default class ConditionalRendering3 extends LightningElement {
    showContent = false;
    labelButton = "Show Content";

    clickHandler(){

        //this.showContent = !this.showContent; //bu sekilde de kisaca yazabiliriz.

        if(this.showContent){
            this.showContent = false;
            this.labelButton = "Show Content";
        } else{
            this.showContent = true;
            this.labelButton = "Hide Content";
        }
    }
}