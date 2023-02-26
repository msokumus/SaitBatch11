import { LightningElement, track } from 'lwc';

export default class TrackProperty extends LightningElement {
    @track location = {
        city : 'istanbul',
        country : 'Turkey'
    };

    changeHandler(event){
        this.location.city = event.target.value;
    }
}

// @track ekledigimizde en tepeye de otomatik eklenir. track parantez icinde birden fazla element varsa kullanilir. parantez ici degisiklikleri aktif hale getirir. eger tek bir element olsa gerek yoktu.