public with sharing class RestApiOutboundCallout {  // Step 1 Create Remote Site Setting (Org setup dan olusturduk)
                                                    // Step 2 Mock Run with Insomnia to replicate our Callout Scenario

    public static HttpResponse getAnimals() {  // Void olanlari degistirdik HttpResponse ile Test class icin
        // STEP 3 ****
        // Prepare Http Request
        HttpRequest request = new HttpRequest();
        // 3.a Setting Http Method for Request
        request.setMethod('GET');
        // 3.b Setting Endpoint URL for Target System
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        // 3.c NOTE: This Endpoint doesnot need User Authentication
        

        // STEP 4 ****
        // Make REST Callout
        Http http = new Http();
        HttpResponse response = new HttpResponse();
        response = http.send(request);
        // HttpResponse response = http.send(request);  tek satir da olur.


        // STEP 5 ****
        // Getting Http Response
        System.debug('Response Status ' + response.getStatus());
        System.debug('Response Status Code ' + response.getStatusCode());
        System.debug('Response Content/Body ' + response.getBody());


        // Step 6 ****
        // Parsing JSON Resposne
        // Condition check for Success response
        if (response.getStatusCode() == 200){
            String jsonString = response.getBody();
            // Deserailize JSON string to Apex defined data types
            // JSON keys are always String
            // JSON value can be anaything - String, Number, Boolean, Array, Nested Json So for safeguard of code we use OBJECT - Generic data type of APex
            // JSON are very much same as APex Map - As both store information in Key Value pair
            // Typecasting is a fundamental concept of converting Data type from one category to another. (sari paranteze typecasting denir)
            // JSON.des return type is Object type. But we are expecting result to be in Map. So to resolve this conflict, we are using Type-casting.
            Map<String, Object> animalInfo = (Map<String, Object>) JSON.deserializeUntyped(jsonString);  //bu islem json mesajini islenebilir parcalara ayirir
            // Mesajin key kismi string icinde value kismi object icinde kaydedilir.
            // Burada 'Object' genel data type tipidir. Daha kapsayici bir data tipi ve ne gelecegini bilmiyorsak kullanilir.
            // Sari parantez ici (Typecasting) (Map) cevap gelecek datanin formatini zorunlu olarak bu format yapmak icin. 
            // JSON da key olarak her zaman  String kullanilir. Ama value farkli farkli olabilir. 
            List<Object> animalNames = (List<Object>) animalInfo.get('animals'); // animals key'ini bildigimiz icin kullandik.
            // animalInfo.get('animals') will return value of Object data type, but if we want to get list of string values. We need to type casting      
            for(Object animal : animalNames){
                String animalName = (String) animal;
                System.debug('Final Parse Result : ' + animalName);
            }
            
        }
        return response;
    }
    public static HttpResponse getUser(){
        // Prepare
        HttpRequest request = new HttpRequest();                     
        request.setEndpoint('https://reqres.in/api/users/2');
        request.setMethod('GET');

        // Send request
        Http http = new Http();
        HttpResponse response = http.send(request);

        // Get Response
        System.debug('Response Status ' + response.getStatus());
        System.debug('Response Status Code ' + response.getStatusCode());
        System.debug('Response Body ' + response.getBody());

        // Parse Response
        // Always check for Success status in response // Bu ornekte manual deserialing yaptik. daha zor
        if (response.getStatusCode() == 200){
            String jsonString = response.getBody(); // Gelen cevabi bir VAR a atadik. Gelen JSON data string formatinda.
            Map<String, Object> dataSupportValue = (Map<String, Object>) JSON.deserializeUntyped(jsonString); // Burada sadece iki key var. detaylar yok.
            // String dataValue = (String) dataSupportValue.get('data');
            // String dataValue = String.valueOf(dataSupportValue.get('data'));  bu calismadi. Json ikinci kez parcalanmiyor.
            // Map<String, Object> userInfo = (Map<String, Object>) JSON.deserializeUntyped(dataValue); bu calismadi. Json ikinci kez parcalanmiyor.
            Map<String, Object> userInfo = (Map<String, Object>) dataSupportValue.get('data');
            // Capture User Information
            // Convert Object to string --- Similar to Type casting
            String emailId = String.valueOf(userInfo.get('email')); 
            String firstName = String.valueOf(userInfo.get('first_name')); 
            String lastName = String.valueOf(userInfo.get('last_name')); 
            Integer userId = Integer.valueOf(userInfo.get('id')); 
            System.debug('Email Id : ' + emailId);
            System.debug('Name : ' + firstName + ' ' + lastName);
            System.debug('User Id : ' + userId);            
            // TASK : Do the Same with Support part       
                
           Map<String, Object> supportInfo = (Map<String, Object>) dataSupportValue.get('support');

           String url = String.valueOf(supportInfo.get('url'));
           String text = String.valueOf(supportInfo.get('text'));
           System.debug('URL : ' + url);
           System.debug('TEXT : ' + text);
 
        }
        return response;
    }
    public static HttpResponse getListOfUsers(){
        // Preapare Request
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://gorest.co.in/public/v2/users');
        request.setMethod('GET');

        // Send Request
        Http http = new Http();
        HttpResponse response = http.send(request);

        // Fetch Response
        System.debug('Response Status Code : ' + response.getStatusCode());
        System.debug('Response Status : ' + response.getStatus());
        System.debug('Response Body : ' + response.getBody());

        // Parsing Response
        if(response.getStatusCode() == 200){
            String jsonString = response.getBody();
            // Deserialising JSON using APex Wrapper Class //  %70-80 durumda Wrapper class kullanilir.
            List<UserWrapper> userInfos = (List<UserWrapper>) JSON.deserializeStrict(jsonString, List<UserWrapper>.class); // burada strict kullandik
            for(UserWrapper user : userInfos){
                String userName = user.name;
                System.debug(' Famous Person Name :  ' + userName);
                Integer userId = user.id;
                System.debug(' Famous Person Id :  ' + userId);
                System.debug(' Famous Person Email : ' + user.email);
                System.debug(' Famous Person Status : ' + user.status);
                System.debug(' Famous Person Gender : ' + user.gender);
            }
        }
        return response;
    }
        /*
        Wrapper Class to store User Information
        Key name of JSON should match the variable name in APex Wrapp[er class
        Datatype needs to be determined */

    public class UserWrapper {
        public Integer id;
        public String name;
        public String email;
        public String gender;
        public String status;
    }
        /*  
        REST Callout - Post Http Method
        Create Resource/Data Information in External System */
    public static HttpResponse postAnimal() {
        // Preapare Request
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        // Bu satirda gonderecegimiz mesajin JSON formatinda olacagini tanimliyoruz.
        // Content which wea re adding to Http Request is of JSON type
        // We are calling out to External SYstem and referring that our Data Contenrt is of JSON type
        request.setHeader('Content-Type', 'application/json');
        request.setBody('{ "name" : "Domestic Longhair Black Cat" }'); // JSON Body Content

        // Send Request
        Http http = new Http();
        HttpResponse response = http.send(request);

        // Fetch Response
        System.debug('Response Status : ' + response.getStatus());
        System.debug('Response Status Code : ' + response.getStatusCode());
        System.debug('Response Body : ' + response.getBody());

        // Process Response
        if(response.getStatusCode() == 201){
        // Success Scenario
        System.debug('Animal Resorce is Created!! ');
        } else {
            // Failure Scenario
            System.debug('Animal Resorce is NOT Created!! Something went wrong !!! ');
        }
        return response;
    }
        // REST Callout - POST Http Method
        // Create an User in External System
    public static HttpResponse postUser(){
         // Preapare Request
         HttpRequest request = new HttpRequest();
         request.setEndpoint('https://reqres.in/api/users');
         request.setMethod('POST');

        // Declare Content Type is of JSON type
         request.setHeader('Content-Type', 'application/json'); // Datayi Json olarak gonderecegimizi burada belirtiyoruz
        
         // Preapare JSON String
         // Birinci yol - Approach 1 - Manual String Construction
         // request.setBody('{ "name" : "Sait Okumus", "job" : "Saleforce Developer" }'); // JSON Body Content eger kompleks bir yapi ise bu sekilde yapamayiz. Wrapper class ile olur
 
         // ikinci yol - Approach 2 - Wrapper Class and Serialise
         UserRequest obj = new UserRequest();
         obj.name = 'Sait Okumus';
         obj.job = 'Saleforce Developer';
         
         // Convert Wrapper Class content to JSON String
         String jsonBody = JSON.serialize(obj);
         request.setBody(jsonBody);

         // Send Request
         Http http = new Http();
         HttpResponse response = http.send(request);
 
         // Fetch Response
         System.debug('Response Status : ' + response.getStatus());
         System.debug('Response Status Code : ' + response.getStatusCode());
         System.debug('Response Body : ' + response.getBody());

         // Process Response
        if(response.getStatusCode() == 201){
            // Success Scenario
            System.debug('User Resorce Successfully Created!! ');

            // TASK - Olusan user ID yi getirin
           
            // JSON deserailisation
            // 1. yol - Approach 1
            String jsonString = response.getBody();  // bu satir her iki yolda da olmali
            // Map<String,Object> userResp = (Map<String,Object>) JSON.deserializeUntyped(jsonString);
            // String userId = String.valueOf(userResp.get('id'));
            // System.debug('User Created!! New ID is : ' + userId);

            // 2. yol - Approach 2 - Olusan user ID yi getirin - Wrapper class ile 
            UserResponse userResp = (UserResponse) JSON.deserializeStrict(jsonString,UserResponse.class);
            String userId = userResp.id;
            System.debug('User Craeted Newly Generated Id : '+ userId);

            } else {
                // Failure Scenario
                System.debug('User Resorce Failed !!! ');
            }
            return response;
    }
        // Wrapper Class to hold User Information
    public class UserRequest {
        public String name;
        public String job;    
    }
    public class UserResponse {  // burasi JSON ile birebir ayni olmali key ler ayni olmali
        public String id;
        public String name;
        public String job;
        public String createdAt;
    }
    /*
     * As a best pratice, Authentication details for Outbound Integration needs to be stored in Named Credential****
     * 1. End Point
     * 2. Username & Password
     * REST Callout - To Heroku App with AUthentication using Named Credential*****
     */
    public static void getAnimalWithAuthenticationNamedCredential(){ // Burasi VOID olacak. 
        // Prepare Request
        HttpRequest request = new HttpRequest();
        // ERefering Named Credential
        // ***** ORG / Setup / Named Credentials / New Legacy *****
        request.setEndpoint('callout:Animal_Heroku_App'); // ORG da kaydedilen adres ve username&password bu sekilde cagrilir. Arada bosluk olmayacak
        /*
         * Apex Code before Named Credential -- DO NOT USE (JUST FOR EXPLANANTION) // eski method bu sekilde yaziliyordu
         * request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals');
         * String username = 'panigrahi.abinash@outlook.com';
         * String password = 'FunkyArchitect';
         * Blob userCredential = Blob.valueOf(username + ':' + password);
         * request.setHeader('Authorization', 'BASIC '+ EncodingUtil.base64encode(userCredential));
         */    
        request.setMethod('GET');
        
        // Sending Request
        Http http = new Http();
        HttpResponse response = http.send(request);

        // Fetch Response
        System.debug('Response Status : ' + response.getStatus());
        System.debug('Response Status Code : ' + response.getStatusCode());
        System.debug('Response Body : ' + response.getBody());
    }
}
    
/* 
    / Execute Anonymous Apex - Hello.apex
    / RestApiOutboundCallout.getAnimals();
    / RestApiOutboundCallout.getUser();
    / RestApiOutboundCallout.getListOfUsers();
    / RestApiOutboundCallout.postAnimal();
    / RestApiOutboundCallout.postUser();
    / RestApiOutboundCallout.getAnimalWithAuthenticationNamedCredential(); 
 */


/*
 
 * OUTBOUND INTEGRATION / CALLOUT  - REST API
 *
 * Implemenatation:
 *  Step I : Create Remote Site Setting (Org setup dan olustur)
 *  Step II : Dry/Mock Run with Postman/Insomnia to replicate our Callout Scenario
 *  Step III : Create Http Request
 *          a. Endpoint URL
 *          b. HTTP Method - Define the intent of Callout request
 *              GET (Fetch), POST (Create), PATCH (Update), PUT (Update/Replace), DELETE
 *          c. Authentication - User credentials
 *          d. Request Content/Body - Placeholder information - JSON
 *  Step IV : Sending Http Request
 *  Step V : Getting Http Response
 *          a. Status Code
 *              200 (Success Response Code for GET Request)
 *              201 (Success Response Code for POST/PUT Request)
 *              204 (Success Response Code for DELETE Request)
 *              401 (Error Code for Unauthrozed Access)
 *              404 (File/URL not accessible)
 *          b. Response Content - Typically JSON
 *  Step VI : Parsing JSON Resposne
 *          i. Manually Deserialising JSON Resposne. Then Looping through to find the correct key and Value
 *          ii. Using Apex Wrapper Class for deasrailisation
 *
 *
 * 
 * PreRequistive :
 *  1. Target External System Endpoint URL
 *  2. User Credentials
 *  3. API Documentation/Guide
 * 
 * ORG Setup --> Remote Site Settings den yeni site olustur.
 */