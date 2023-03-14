import { LightningElement } from 'lwc';

export default class calculatorSunday extends LightningElement {
    num1 = 0;
    num2 = 0;
    total = 0;
   
    
 
    changeHandler(event){
        if(event.target.label === "Enter the first number"){
            this.num1 = event.target.value;
        }else if(event.target.label === "Enter the second number"){
            this.num2 = event.target.value;
        }
        this.total = Number(this.num1) + Number(this.num2)
        
        console.log("num 1", this.num1);
        console.log("num 2", this.num2);// test etmek icin console log kullanilir.
    }    

}







