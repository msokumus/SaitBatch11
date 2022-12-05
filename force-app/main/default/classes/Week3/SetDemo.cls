public class SetDemo {
    public static void citySet() {
        Set<string> cities = new Set<string>();
        cities.add('tokyo');
        cities.add('Lisbon');
        cities.add('Nairobi'); // ayni veriyi bir kere sayar
        cities.add('Berlin');
        cities.add('Tokyo'); // buyuk kucuk harf duyarli. farkli kabul eder
        cities.add('Lisbon');
        cities.add('Nairobi');
        cities.add('TOKYO');

        system.debug('cities are ' + cities);

    }
    public static void randomIntegerSet(){
        Set<Integer> setInt = new Set<Integer>();
        setInt.add(15);
        setInt.add(10);
        setInt.add(21);
        setInt.add(15);
        setInt.add(15);
        system.debug(setInt);

    }
    public static Set<Integer> setFromList(List<Integer> intList) {
        Set<Integer> returnSet = new Set<Integer>();
        returnSet.addAll(intList);
        return returnSet;
        
    }
    public static set<string> capitalizeSet(set<string> setStr) {
        Set<String> returnSet = new set<string>();

        //iterate over each element of set
            //convert each element to uppercase
            //add in a newly created set
        for (string eachString : setStr) {
            //eachStr --> each element one by one from the SET
            string tempstring = eachString.toUpperCase();
            returnSet.add(tempstring);
        }
        return returnSet;
   }
}
