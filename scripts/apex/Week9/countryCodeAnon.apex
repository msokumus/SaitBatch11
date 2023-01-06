Map<string, country_code__c> allCountryCodes = country_code__c.getAll();
system.debug('all country codes => ' + allCountryCodes);
for (string eachCountry : allCountryCodes.keySet()) {
    system.debug('Country is ' + eachCountry + ' its code is ' + allCountryCodes.get(eachCountry).code__c);
}
// Org da olusturdugumuz custom settings leri yukaridaki gibi cagirabiliriz. Bir map gibidir. Trigger.new gibi...



// CUSTOM SETTINGS

/*
once ORG dan asagidaki ayarlari acalim
SETUP ==> Schema Settings ==> Manage list custom settings type ==> Enable

sonra
SETUP ==> Custom Settings ==> new  isim ver, alt cizgili isim ver. List sec ve Public sec ve kaydet. 
Object acarkenki gibi name field otomatik olarak olusur. 
new ile ilave Custom field ekliyoruz. Ulke kodu icin text olarak yeni field actik.
fieldlari actiktan sonra Manage e tiklayip new ile recordlari olusturduk. 

    * List settings ile kullanicilar ornegin ulke kodlarini arama yapmadan bulup kullanabilirler. birden cok record olusturulur.
    
    * Hierarchy settings ile farkli user lar kendi profillerine gore farkli records gorurler. Ornegin indirim yuzdesi gibi.

*** Hierarchy secildiginde custom settings manage tiklayinca iki tane new secenegi cikar. Yukaridaki Org level
record icin alttaki ise user specific record icin kullanilir. org level da sadece tek bir record olusturulabilir.


Custom settings uygulamalari
Triggerlar icin on off switch yapilabilir. Boylece istendigi zaman calistirilabilir. 
*/



