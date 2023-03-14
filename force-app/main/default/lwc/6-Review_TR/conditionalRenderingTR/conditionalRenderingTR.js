import { LightningElement, track } from 'lwc';

export default class ConditionalRenderingTR extends LightningElement {
    areDetailsVisible = false;
    firstName = "Sait";
    @track location = { 
        city : "Vancouver",
        country : "Canada",
        region : "America"
    }

    handleChange(event) {
        if (event.target.label === "Show Details") {
            this.areDetailsVisible = event.target.checked;
        } else if (event.target.label === "First Name") {
            this.firstName = event.target.value;
        } else {
            this.location.city = event.target.value
        }
        
    }
}

//* track obje ve arraylerde icindekilere ulasmak icin gerekiyor. importa da eklenmeli.

/*
*   var a = 5, b = "5";
*   var c = a == b;	// a ile b'nin değerleri *eşit mi? burada c'ye true değeri atanır.
*   c = a === b;	// a ile b'nin değerleri ve türleri aynı mı? c'nin değeri false olur.
*/