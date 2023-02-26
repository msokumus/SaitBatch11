// Asagidaki remote adresteki ulke bilgilerini kendi ORGumuzda olusturdugumuz custom object icine cektik.

public class FlagsCountry {
    public static HttpResponse getCountry() {
        //1 request enpoint and method
        HttpRequest Request = new HttpRequest();
        Request.setEndpoint('https://restcountries.com/v2/all');
        Request.setMethod('GET');

        //2 http
        Http hp = new Http();
        HttpResponse response = hp.send(request);

        //3 body alip donusturelim.. sonrada wrapper yardimi ile orgumuza kaydedelim..
        if (response.getStatusCode() == 200) {
            String jsonData = response.getBody();
            //3.1 wrapper yardimiyla bu datayi json dan wrappera donusturuyoruz..
            List<wrapperCountryFlag> listWrapper = (List<wrapperCountryFlag>)JSON.deserialize(jsonData, List<wrapperCountryFlag>.Class);

            //3.2 Orguma kaydetmek icin once bir obje listesi olusturuyorum..
            list<Flag_Country__c> listCountry = new list<Flag_Country__c>();

            //3.3 Wrapper listemi for dongusunun icine alip her eleman orguma kaydedilecek bir record olusturuyorum..
            for (wrapperCountryFlag eachWrapper : listWrapper) {
                Flag_Country__c obj = new Flag_Country__c();
                //sol taraf orgun fieldleri, sag taraf wrapperden gelen fieldler
                obj.name = eachWrapper.name;
                obj.Capital__c = eachWrapper.capital;
                obj.Flag_URL__c = eachWrapper.flags.svg;  // Wrap icinde wrap kullandik ****
                obj.Native_Name__c = eachWrapper.nativeName;
                obj.Population__c = eachWrapper.population;
                obj.Region__c = eachWrapper.region;

                listCountry.add(obj);
            }
            insert listCountry;
        }
        return response;
    }

    public class wrapperCountryFlag{
        public string name;
        public string nativeName;
        public integer population;
        public string capital;
        public string region;
        public flagsWrapper flags; // Wrap icinde wrap olusturduk ****
    }

    public class flagsWrapper{
        public string svg;
    }
}

// Anonymous.apex
// FlagsCountry.getCountry();

// Ulkeleri silmek icin
// List<Country_Flag__c> c = [SELECT Id FROM Country_Flag__c];
// delete c;