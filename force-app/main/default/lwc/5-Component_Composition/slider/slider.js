import { api, LightningElement } from 'lwc';

export default class Slider extends LightningElement {
    @api val;

    @api resetSlider(){
        this.val = 50;  // reset icin 50 kullanilir.
    }
}