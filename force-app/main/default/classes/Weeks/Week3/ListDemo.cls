public class ListDemo {
    public static void cadidatesList() {
        
        List<string> listcandidates = new List<string>();
        listcandidates.add('Marc');
        listcandidates.add('Elon');
        listcandidates.add('Bill');
        listcandidates.add('Marc');
        listcandidates.add('45'); // string olabilir sadece, niye; cunku data type oyle

        system.debug('List of candidates ' + listcandidates);        
    }
    public static void randomIntegerList() {
        List<integer> listInteger = new List<integer>();
        listInteger.add(10); // index= 0
        listInteger.add(15); // index= 1
        listInteger.add(21); // index= 2
        listInteger.add(15); // index= 3
        listInteger.add(15); // index= 4
        
        integer index3value = listInteger.get(3); //bu iki yolla da listedeki 3. index cagrilir.
        integer index3value2 = listInteger[3]; // bu iki yolla da listedeki 3. index cagrilir.

        system.debug('index at value 3 is ' + index3value);
        system.debug('list of random integer is ' + listInteger);
    }
    public static string cadidatesList2(integer i) {
        
        List<string> listcandidates = new List<string>();
        listcandidates.add('Marc');
        listcandidates.add('Elon');
        listcandidates.add('Bill');
        listcandidates.add('Marc');
        listcandidates.add('45'); // string olabilir sadece, niye; cunku data type oyle

        system.debug('List of candidates ' + listcandidates);
        // string returnValue = listcandidates[i];
        // return returnValue;
        string returnValue = ''; //5 index did not found 
        // burada null vermemesi icin esittir deyip bos tirnak ekledik.

         //check size of list.
        integer sizeOfList = listCandidates.size(); //4
        if(i>= 0 && i < sizeOfList){
                  returnValue = listCandidates[i]; //getting value from index i
        } else {
                  returnValue = 'No values found. come on.';
        }
      
        return returnValue;
    }
    public static void allCats(){
        List<cat> listCats = new list<cat>();
        //how to add cats in this list?
        Cat sfCat2 = new Cat('Leo', 'Orange');
        Cat sfCat3 = new Cat('Luna', 'Brown');
        Cat batch11Cat = new Cat('fluffykins', 'white');
        listCats.add(sfCat2);    
        listCats.add(sfCat3);    
        listCats.add(batch11Cat);//we add 'instances' of cat class.
        listCats.add(sfCat2);
        system.debug('cat list ' + listCats);
   }
}
