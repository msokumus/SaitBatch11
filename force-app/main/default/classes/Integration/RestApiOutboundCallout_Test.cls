/*
* Error: Methods defined as TestMethod do not support Outbound Integration/Web service callouts
* Covering Rest Callout Test Scenario can be done using 2 Approaches:
*   1. Static Resource Callout Mock
*   2. Creating a Mock Response using HttpCallout class
*/

@IsTest
public with sharing class RestApiOutboundCallout_Test {
    /* fake it until you make it :-)
     * Unit Test Success Response for Animal Heroku App - GET Method
     * STATIC RESOURCE MOCK APPROACH
     * Step 1: Upload Response Body as a Static Resource*
     *      ORG / Setup / Static Resources / new - Buradan olusturdugumuz txt dosyasini kaynak olarak gosterdik.
     * Step 2: Fetching Mock Response from Static Resource
     * Step 3: Link/Assosiate the Mock Response to our Unit Test context
     * Step 4: Invoking REST merthod logic
     * Step 5: Assertion Statements
     */
    @IsTest
    public static void getAnimalsSuccessTestUsingStaticResource() {
        // Create a mock response besed on our Static recource
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource'); //ORG da verdigimiz ad
        mock.setStatusCode(200);
        mock.setStatus('OK');
        mock.setHeader('Content-Type', 'application/json');

        // Assosiate the Callout with this Mock Response
        Test.setMock(HttpCalloutMock.class, mock);

        // Invoking Apex logic
        Test.startTest();
        HttpResponse mockResponse = RestApiOutboundCallout.getAnimals();
        Test.stopTest();

        // Assertion Statements
        System.assertEquals(200, mockResponse.getStatusCode(), 'Success Response should be 200');
        system.assertNotEquals(null, mockResponse.getBody(), 'Mock Response content should give something');
    }
     /**
     * Unit Test Success Response Scenario for Get User callout - GET Method
     * HTTP CALLOUT MOCK RESPONSE
     * Step 1: Create a new Apex Class implementing HttpCalloutMock
     * Step 2: Inside this class we try to create HttpResponse Object
     * Step 3: Assosiate Mock Reponse to our Unit Test method
     * Step 4: Invoking REST Callout
     * Step 5: System Assertion
     */
    @IsTest
    public static void getUserSuccessTestUsingCalloutMock(){
        // Set Callout Mock Response
        Test.setMock(HttpCalloutMock.class, new GetUserCalloutMockResponse());
        

        // Rest Callout in test context
        Test.startTest();
        HttpResponse mockResponse = RestApiOutboundCallout.getUser();
        Test.stopTest();

        // Assertion statements
        System.assertEquals(200, mockResponse.getStatusCode(), 'Success Response should be 200');
        System.assertNotEquals(null, mockResponse.getBody(), 'Mock Response content should give something');
    }
    // Create Mock Response Class - Class icinde class olusturduk. Ayri bir dosya olarak da yapilabilir
    // @IsTest - ayri dosya olursa eklemek lazim.
    public class GetUserCalloutMockResponse implements HttpCalloutMock { // mock class oldugu icin bunu kullandik.
        // Implement respond Interface method
        public HttpResponse respond(HttpRequest request){ //interface method her zaman isimler degismez. respond olur.
            // Create a fake Response
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setStatus('OK');
            response.setHeader('Content-Type', 'application/json');
            response.setBody('{"data":{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"},"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}');
            return response;
        }
    }
}