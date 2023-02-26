import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {
    fullname = 'Sait';
    age = '30+';
    location = {
        city : "Vancouver",
        country : 'Canada'
    };

    sum(a, b){
        return a + b;
    }
}

/*
* Sayfa yenilemesini hizlandirmak icin
* SETUP / Session Settings
* [Enable secure and persistent browser caching to improve performance] // Bu secenegi disable yapin.
*/