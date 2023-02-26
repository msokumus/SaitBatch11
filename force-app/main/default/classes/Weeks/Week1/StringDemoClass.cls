public class StringDemoClass {

    public void stringMethod1(){
         String sessionDescription = 'learning string methods in apex language.';
         system.debug(sessionDescription);
         
         // .length komutu sadece integer ile kullanılabilir.
         integer lenghtOfStr = sessionDescription.length();
         system.debug('lenght of session description is ' + lenghtOfStr);

         //return type ne olacaksa başta o data tipi seçilir. Büyük harf komutu
         string capSessionDescription = sessionDescription.toUpperCase();
         system.debug('in CAPS ->' + capSessionDescription);

         //3. check if string contains "apex"
         boolean apexContains = sessionDescription.contains('apex');
         system.debug('contains apex?????????' + apexContains);

         //3.2 check if string contains "apex"
         boolean apexContains2 = sessionDescription.contains('Apex');
         system.debug('contains Apex?????????' + apexContains2);

         //3.3 check if string contains "apex"
         boolean apexContains22 = sessionDescription.containsIgnoreCase('Apex');
         system.debug('contains Apex?????????' + apexContains22);

         //check if string contains "salesforce"
         boolean sfContains = sessionDescription.contains('salesforce');
         system.debug('contains salesforce?????????' + sfContains);

         
    }
}