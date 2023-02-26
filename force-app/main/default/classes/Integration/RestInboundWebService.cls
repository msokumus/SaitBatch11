/*
 * External System/Insomnia/Workbench   -->  Salesforce (Inbound Integration) -daha cok web services olarak adlandirilir.
 * AGENDA: Build Custom APex REST Web Services -- Example: Case Manager
 * Http Methods - GET, POST, PATCH, DELETE, PUT
 
 * Whenever we are setting up any Inbound Integration with Salesforce, it is mandatory to do following steps
 * 1. Authorization - Create Connected App - (Api Access Monitoring Tool)
 * 2. Authentication - Create User Account -  (Username + Password) // kendi sifreni kullan. User acamiyoruz.
 
 * When to build Custom Apex REST WebServices?
 * Check in Salesforce REST API Documentation, if you think Feature requested by Business is not possible through Standard APIs provided by Salesforce
 * Then only resort to create a Custom WebService
 * Documention : https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/resources_list.htm
 
 * Testing Endpoint: https://soft13-dev-ed.develop.my.salesforce.com/services/apexrest/InboundCaseManager/  //benim adresim
 
 *  How to build Testing Endpoint URL?
 *      1. Identify Domain: ORG - Setup => My Domain . i.e, soft13-dev-ed.develop.my.salesforce.com  //benim adresim
 *      2. /services/apexrest/ - This is Constant url mapping, which will always remains the same
 *      3. urlMapping provided at RestResource annotation, i.e. InboundCaseManager
 
 * Access Modifier of WebService Apex Class needs to be Global when exposing Custom REST Api So it can be access externally
*/
 @RestResource(urlmapping='/InboundCaseManager/*')
 global with sharing class RestInboundWebService {
/*     GET
     - this method will enable feature where we will expose/send Case record by their Saleforce Id
     - HTTPMethod - GET
     - Return type of method will be mapped directly to Response Body
     - Endpoint - https://soft13-dev-ed.develop.my.salesforce.com/services/apexrest/InboundCaseManager/xxxxxxxxxx 18 digit ID
     - In GET Request, Input parameters are always provided at the URL level       
*/
    @HttpGet
    global static Case getCaseById(){       // ORG disindan ulasilmasi icin global yaptik.
        // Capture Http Request details sent by the External Syetm during Inbound Integration
        RestRequest request = RestContext.request;
        System.debug('HTTP Request Details sent by External SYstem ' + request);
        System.debug('Endpoint ' + request.requestURI);
        System.debug('Http Method ' + request.httpMethod);
        System.debug('Header ' + request.headers);
        // Grab Case Record ID from the URL - Burada case ID yi adresten izole ettik ve caseID ye esitledik.
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1); // URL adresindeki son kesme isaretini bu sekilde seciyoruz. index numarasini bulup ona +1 ekliyoruz. Yani kesmeden sonraki karekterleri al demek. Kesme isaretini alma demek.
        System.debug('Case Record Id: '+ caseId);
        // SOQL to fetch Case record information
        // Best Pratice: ALways use With SEcurity Enforced whenever writing a SOQL Query
        // Asagidaki sorguda hangi alanlari eklersek o alanlar 3.parti ile paylasilmis olur. Sadece onlar gozukur.
        Case result = [SELECT Id, Description, CaseNumber, Status, Origin, Subject, Priority FROM Case WHERE Id =: caseId WITH SECURITY_ENFORCED]; // security onemli
        System.debug('Case Record : '+ result);
        // Return Case information
        return result; // return edecek veriler SOQL verileri...Bunlar gozukur. Return de neyi secersek 3.parti onu gorur. 
    }
/*     DELETE
	 * This Method is deleting Case record by their Salesforce Id
	 * Endpoint - https://soft13-dev-ed.develop.my.salesforce.com/services/apexrest/InboundCaseManager/500Do0000039ct6IAA
	 * HTTP Method - DELETE
	 * Create Success & Fail Response with dynmaic Status Code and Body
*/
    @HttpDelete
    global static void deleteCase(){
        // To fetch Rest Request sent by External System
        RestRequest request = RestContext.Request;
        System.debug('HTTP Request Details sent by External SYstem ' + request);
        System.debug('Endpoint ' + request.requestURI);
        System.debug('Http Method ' + request.httpMethod);
        System.debug('Header ' + request.headers);
        // Find Case Id info from the URL Endpoint
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/') + 1);
        System.debug('Case Record Id: '+ caseId);
        // Fetch Case record using SOQL
        List<Case> matchingResult = [SELECT Id FROM Case WHERE Id =: caseId WITH SECURITY_ENFORCED]; // ! limit 1 demeye gerek yok. zaten ID benzersiz olur.
        // Build Custom Response
        RestResponse response = RestContext.Response;
        if(!matchingResult.isEmpty()){
            // Success Scenario
            delete matchingResult[0];

            // Success Code for Delete operation => 204
            response.statusCode = 204;
            // Response Body always expect data to be present in Binary format
            response.responseBody = Blob.valueOf('Case record was successfully deleted! :) ');  // ! test ederken bu mesaj gozukmedi!!!!
        } else {
            // Error Scenario
            response.statusCode = 404;
            response.responseBody = Blob.valueOf('Error encountered, Record doesnot exist ! :(');
        }
    }
/*     POST
     * This method is going to create Case record by getting all required field values from External Sytem request
     * Http Method - POST
     * Testing Endpoint - https://soft13-dev-ed.develop.my.salesforce.com/services/apexrest/InboundCaseManager/
     * Request Body - 
       { 
        "subject" : "Test WebService from Workbench", 
        "description" : "Test WebService from Workbench", 
        "status" : "New", 
        "priority" : "High", 
        "origin" : "Web"  
       }
     * Return Custom meaningful JSON response based on Success/Failure
     * Response Body - { 'id' : 'xxx', 'status' : 'Success/Failure', 'errorMessage' : 'xxx' }     
     * bu methodu test etmek icin workbench den post yaptik. yukaridaki body yi kullandik. ORG da kayit olustu ama 201 cevabi gelmedi.
*/  // not: Burada fazladan suslemeler yaptik. Sadece yeni kayit olusturmak icin daha az kod yeterli olur. 
    @HttpPost
    global static void createCase(String subject, String description, String status, String priority, String origin){
        // Get Request content sent by External System
        RestRequest request = RestContext.request;
        System.debug('HTTP Request Details sent by External SYstem ' + request);
        System.debug('Endpoint ' + request.requestURI);
        System.debug('Http Method ' + request.httpMethod);
        System.debug('Header ' + request.headers);
        System.debug('Request Body ' + request.requestBody);

        // Create Case S-object instance
        Case newRec = new Case();
        newRec.Subject = subject;
        newRec.Description = description;
        newRec.Status = status;
        newRec.Priority = priority;
        newRec.Origin = origin;

        // Prepare Custom Response
        RestResponse response = new RestResponse();
        response.addHeader('Content-Type', 'application/json');
        PostResponseWrapper responseContent = new PostResponseWrapper();

        // Insertion Case record
        try {
            insert newRec;

            // Success Response
            response.statusCode = 201;
            // Prepare JSON Response Body
            responseContent.id = newRec.Id;
            responseContent.status = 'Success';
            responseContent.errorMessage = '';

        } catch (Exception ex) {
            // Error Response
            response.statusCode = 404;
            // Prepare JSON Response Body
            responseContent.id = '';
            responseContent.status = 'Failure';
            responseContent.errorMessage = ex.getMessage();
        }

        //* Populate Response Body
        String responseBody = JSON.serialize(responseContent);
        response.responseBody = Blob.valueOf(responseBody);
    }

    // Wrapper Class for Response Building
    public class PostResponseWrapper {
        public String id;
        public String status;
        public STring errorMessage;
    }
/*     PATCH / UPDATE
     * This method is going to update Case record by looking at the Salesforce Id followed by Request body
     * HttpMethod - PATCH
     * Endpoint - https://soft13-dev-ed.develop.my.salesforce.com/services/apexrest/InboundCaseManager/500Do0000039ct6IAA
     * Request Body -  
       {
        "subject" : "Test Case PATCH from REST WebService",
        "description" : "Mock Record Creation using Patch Http Method",
        "priority" : "High",
        "origin" : "Web",
        "status" : "New",
       }
     * Request Body will only contain fieldname which you are going to update
     * Return Type will be Case JSON record
*/
    @HttpPatch
    global static Case updatecaseFields(){
        // Grab Current Inbound Integration Request
        RestRequest request = RestContext.Request;
        // Grab the Case Record Id from Endpoint URI
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        // Fetch Case record using Record Id
        List<Case> existingRec = [SELECT Id FROM Case WHERE Id =: caseId WITH SECURITY_ENFORCED];
        // Handling Request JSON Body
        // Request Body would be present in Blob format. Inoerder to convert into String value
        String requestJSON = request.requestBody.toString();
        // Deserialize the JSON STring into name-value pair
        Map<String,Object> fieldValues = (Map<String,Object>) JSON.deserializeUntyped(requestJSON);
        // Iterate through each parameter fieldname and value
        for(String fieldName : fieldValues.keySet()){
            // Set the field and value on the Case sObject
            // existingRec[0].Status = 'New';
            // existingRec[0].put('Status', 'New');
            // Above 2 lines mean the same thing. In Approach #1 field name is static content but in Approach #2 field name is dynamic content
            // Asagidaki tek bir satir ile tum fieldlari yakalamis olduk. bir onceki method da bunu ayri ayri yazarak yaptik.
            existingRec[0].put(fieldName, fieldValues.get(fieldName)); // yukaridaki List den sadece bir tane ID gelecegi icin index number 0.
        }
        // Update existing case record
        update existingRec[0];
        return existingRec[0];
    }
/*     PUT - upsert
	 * This method will be used to perform UPSERT(update/insert) Case record by parsing all required parameters from Rest Request sent by External System.
	 * Incase of Upsert, if Salesforce Id is provided then it is an Update scenario. If not, it is an insert scenario
	 * Endpoint - https://soft13-dev-ed.develop.my.salesforce.com/services/apexrest/InboundCaseManager/
	 * Http Method - PUT
	 * Request Body - 
     * {
        "subject" : "Test Case Upsertion from REST WebService",
        "description" : "Mock Record Creation uSIng PUT Http Method",
        "priority" : "High",
        "origin" : "Web",
        "status" : "New",
        "id" : ""
       }
	 * Return meaningful JSON response based on Success/Failure
	 * Response Body - { 'id' : 'xxxxx', 'status' : 'Success/Failure', 'errorMessage' : 'xxxx'}
     * if Method parameters are not added then it means We have to do Deserialisation at our own terms
*/
	@HttpPut
	global static void upsertCase() {
		 // Get Incoming Inbound REST API Request Current Context
         RestRequest request = RestContext.Request; // burada devam etmeden once Wrapper classi olusturduk. 
         // Extract Information/Data from Request Body by deserailising JSON
         String requestBody = request.requestBody.toString();
        //! Use deserializeStrict when dealing with Wrapper class
        //! Use deserilaize Untyped when dealing with Map<>String
         PutRequestWrapper requestContent = (PutRequestWrapper) JSON.deserializeStrict(requestBody, PutRequestWrapper.class);

		//Prepare case Object record
		Case newRec = new Case();
		newRec.Status = requestContent.status;
		newRec.Subject = requestContent.subject;
		newRec.Description = requestContent.description;
		newRec.Origin = requestContent.origin;
		newRec.Priority = requestContent.priority;
        if(requestContent.id != null && requestContent.id != ''){
            newRec.Id = requestContent.id;
        }
        /* bu sekilde de olabilir
        if (requestContent.id != null && requestContent.id != ''){
           newRec.Id = Id.valueOf(requestContent.id);	
        }
        */

		//Prepare Response Content
        RestResponse response = RestContext.Response;
		response.addHeader('Content-Type', 'application/json');
		PostResponseWrapper responseContent = new PostResponseWrapper(); // Onceki methoddaki wrapper classi kullandik. Birebir ayni cunku.

		try {
			//Upsert Operation
			upsert newRec;

            //Success Response
			response.statusCode = 201;			
			responseContent.status = 'Success';
			responseContent.id = newRec.Id;
			responseContent.errorMessage = '';
		} catch (Exception ex) {
			//Error Response
			response.statusCode = 404;
			responseContent.status = 'Failed';
			responseContent.id = '';
			responseContent.errorMessage = ex.getMessage();
		}

		//Prepare Response Body in JSON Serialise format
		String responseJSON = JSON.serialize(responseContent);
		response.responseBody = Blob.valueOf(responseJSON);
	}
	//Wrapper Class for Put Request to be used for Body Deserialization
	public class PutRequestWrapper {
		public String id;
		public String subject;
		public String description;
		public String priority;
		public String origin;
		public String status;
	}  
}

/*  
    ! Birinci method icin yapilanlar

    * ORG --> Setup -- > App Manager --> New Connected App  
    * Enable OAuth Settings
    verilecek izinleri sec
    Selected OAuth Scopes
    Manage user data via APIs (api)
    Perform requests at any time (refresh_token, offline_access)
    save
    
    open 
    Connected App Name: Case Manager Inbound
    Consumer Key: 3MVG9gtDqcOkH4PImTEkPhDn31Xy4HJQ0coNAhU6afXzj_BG.fDunjVesheKsfEFmx7NnSnewatw6lN_5porH
    Consumer Secret: EB47F4568D2DA24F0FB229E6EC79B85751A119E326C0F0F8D7EED514C2671C47

    Username: o.qumus@gmail.com
    password: msoSf@5425042
    org / setup/ My Personal Information / Reset My Security Token / Security token (case-sensitive): RoGkb5kFQd306JNl1LaDza345

    ! 1. YOL 
    open the Insomnia
        saleforce connection POST
            form URL Encoded
                grant_type: password
                client_id: Consumer Key yapistirilacak
                client_secret: Consumer Secret yapistirilacak
                username: sf kullanici email adresi
                password: sf password+TOKEN (arada bosluk olmadan)
                |> Send

    Case Manager GET
        URL : https://soft13-dev-ed.develop.my.salesforce.com/services/apexrest/InboundCaseManager/500Do0000039ct6IAA
        Bearer Token : yukaridaki baglanti ile gelen access token buraya yazilir.
        |> Send

    ! 2. YOL
    Workbench ile test et.
    https://workbench.developerforce.com/login.php?startUrl=%2Finsert.php

            Utilities
            REST Explorer
                GET secilir ve URL domain adresinden sonraki kismi yapistirilir.
                |> Execute
                (Raw response da gorulebilir.)

                

    ? Neden + 1 ekledik. (request.requestURI.lastIndexOf('/') + 1)

    * "/Ham/Burger" - Complete String
    [ '/', 'H','a', 'm', '/', 'B', 'u','r','g','e','r'] - String is stored as an array of Characters
    *  0    1   2    3    4    5    6   7   8   9   10

    SubString(5) => Burger
    5 is the first index # of our future substring
    
    lastIndexOf('/') => 4
*/