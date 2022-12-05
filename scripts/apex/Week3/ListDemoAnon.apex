ListDemo.cadidatesList();
ListDemo.randomIntegerList();

string valueAt2 = ListDemo.cadidatesList2(2);
system.debug('listedeki 2 nolu item :'+ valueAt2);

string valueAt5 = ListDemo.cadidatesList2(5); // listede 5 nolu item olmadigi icin hata mesajini yazacak
system.debug(valueAt5);

string valueAt0 = ListDemo.cadidatesList2(0);
system.debug(valueAt0);

// cat class dosyasindan kedi listesini cagirdik
ListDemo.allCats();







// Diger List kullanimlari asagidaki gibidir. bunlari class a yazmadik. anlamak icin ornek

List<string> listStr = new List<string>();
if(listStr.isEmpty()){
    System.debug('LIST IS EMPTY. OKAY?');
}

list<integer> listInteger = new List<Integer>();
listInteger.add(10); //0
listInteger.add(15); //1
listInteger.add(21); //2
listInteger.add(15); //3
listInteger.add(12); //4
listInteger.add(18); //5
system.debug('before sort :' + listInteger);
listInteger.sort();
system.debug('after sort :' + listInteger);



// atama konusunda extra not

string s= '';
s.toLowerCase();

string s;   // bu null olacagi icin hata verir. yukaridaki gibi bos tirnak ile cozulur.
s.toLowerCase();
