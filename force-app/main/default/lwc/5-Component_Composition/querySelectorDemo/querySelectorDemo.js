import { LightningElement } from 'lwc';

export default class QuerySelectorDemo extends LightningElement {
    fruits = ["Banana", "Apple", "Mango", "Cherries"];

    clickHandler(){
        // h1 - querySelector demo

        const h1elem = this.template.querySelector("h1");
        console.log(h1elem.innerText);
        h1elem.style.color = "#48a832";
        h1elem.style.backgroundColor = "grey";
        h1elem.style.border = "2px solid blue";

        // p - query Selector demo

        const pelem = this.template.querySelector("p");
        pelem.style.color = "yellow";
        pelem.style.backgroundColor = "black";
        pelem.style.border = "2px solid #2365b0";


        //querySelectorAll demo
        const divElems = this.template.querySelectorAll(".child");
        divElems.forEach(item => {
            console.log(item.innerText);
            item.style.color = "red";
            item.setAttribute("class", "slds-align_absolute-center");
        });

        const buttonElem = this.template.querySelector("lightning-button");
        buttonElem.label = "Don't Click Again";
        buttonElem.variant = "destructive";
    }
}

// class ismine ulasmak icin sadece nokta da kullanilir. uzun yazilmaz.  div.child yerine .child