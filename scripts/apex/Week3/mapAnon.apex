// buna Class yazmadik
//   key     value
Map<string, string> mapCntCurrency = new Map<string, string>();
mapCntCurrency.put('USA', 'Dollar');
mapCntCurrency.put('Japon', 'Yen');
mapCntCurrency.put('Spain', 'Euro');
mapCntCurrency.put('Germany', 'Euro'); // ayni value degeri olabilir
mapCntCurrency.put('Turkey', 'Lira');
mapCntCurrency.put('Salvador', 'Bitcoin');
mapCntCurrency.put('India', 'Rupees');
mapCntCurrency.put('India', 'Rupee'); // overwrite. ayni key degeri bir kere listelenir. ikinci key guncelleme kabul edilir.

system.debug(mapCntCurrency);

String IndiaCurrency = mapCntCurrency.get('India');
String country = 'Turkey';
String countryCurrency = mapCntCurrency.get(country);
system.debug(' India curreny is ' + IndiaCurrency);
system.debug(country + ' currency is ' + countryCurrency);


// Week 4 devam

// get all (keys) countries 
Set<String> countrySet = mapCntCurrency.keySet();
system.debug('country set --> ' + countrySet);

//List all values
List<String> currencyList = mapCntCurrency.values();
system.debug('currency set --> ' + currencyList);

// for each loop
Set<String> countries = mapCntCurrency.keySet();
for(String eachCountry: countries){
    system.debug('* each country is ' + eachCountry);
    string eachCurrency = mapCntCurrency.get(eachCountry);  // .get(key) metodu ile veriyi cekeriz
    system.debug('* each currency is ' + eachCurrency);
    system.debug('**** each country is ' + eachCountry + ', its currency is ' + eachCurrency);
}

// key den value yu cekebiliriz ama tersi olmaz.