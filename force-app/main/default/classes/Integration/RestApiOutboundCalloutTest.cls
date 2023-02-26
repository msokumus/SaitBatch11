@istest
public class RestApiOutboundCalloutTest {
   @istest
    private static void getFlagsCountryTest() {
        //1. Bir mock create edelim..
        GetFlagCountryCalloutMock mock = new GetFlagCountryCalloutMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2. metodu cagirma start test
        HttpResponse response = FlagsCountry.getCountry();

        //3. asserts kontrolleri..
        system.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getStatus());
   } 
}

// Bu class icin GetFlagCountryCalloutMock isimli bir Mock class olusturduk. Mock datayi oradan cagirdik. 
// Bunu class icinde class olarak da yapabiliriz.
// Unit test yaparken REST API callout a izin verilmez. O yuzden HTTP Response object olusturduk. 
// HTTP Response object iki turlu olabilir HTTP Callout Mock veya Static Response (Static icin animalmockresponse.txt olusturduk)
// HTTP Response icin gerekenler --> Header, Body, Status, Status code
// Static Resource --> Bir txt dosya olustur, buna sadece JSON Body ekle(Insomiadan copy past), status vs bu txt dosyada olmaz -> Fetch JSON -> Static Resorse CalloutMock
// 2. yol yani HTTP Callout Mock --> Satus, Status code, body, header. Bunu icin Bir Mock Apex class olustur. (Bunu olusturmak Mandotory). Ya inner ya da separate class olustur.   