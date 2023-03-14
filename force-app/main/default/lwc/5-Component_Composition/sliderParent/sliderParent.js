import { LightningElement } from 'lwc';

export default class SliderParent extends LightningElement {
    value;

    changeHandler(event){
        this.value = event.target.value;
    }

    clickHandler(){
        this.value = undefined;  // deger 50 de olabilir. html'e de value eklemek lazim. bu gecici bir cozum. Normalde bu degerin parent tan child a gelmesi lazim. henuz ogrenmedik
        this.template.querySelector("c-slider").resetSlider(); // child dan cagirma yolu
    }
}