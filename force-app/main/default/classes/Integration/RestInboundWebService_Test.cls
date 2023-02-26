@IsTest
public with sharing class RestInboundWebService_Test {
    @TestSetup
    public static void makeData() {
        // Creating a Test Case record
        Case testRec = new Case();
        testRec.Subject = 'Test Case';
        testRec.Description = 'Test Description';
        testRec.Origin = 'Phone';
        testRec.Status = 'New';
        testRec.Priority = 'High';
        insert testRec;
    }

    @IsTest
    public static void getCaseByIdSuccessTest(){
        // Fetch case Record id
        Id caseId = [SELECT Id FROM Case LIMIT 1].Id;
        // Setup a mock test request
        RestRequest request = new RestRequest();
        request.requestURI = 'https://soft13-dev-ed.develop.my.salesforce.com/services/apexrest/InboundCaseManager/' + caseId;
        request.httpMethod = 'GET';
        RestContext.Request = request;
        // Call the Inbound Webservice method
        Test.startTest();
        Case testRec = RestInboundWebService.getCaseById();
        Test.stopTest();
        // Verrify Results
        System.assertEquals(testRec.Id, caseId, 'Test case Record Id should be matching with the Webservice method result');
    }
    @IsTest
    public static void createCaseSuccessTest(){
        // Setup a Test requset
        RestRequest request = new RestRequest();
        request.requestURI = 'https://soft13-dev-ed.develop.my.salesforce.com/services/apexrest/InboundCaseManager/';
        request.httpMethod = 'POST';
        RestContext.Request = request;
        // Call Webservice method
        Test.startTest();
        RestInboundWebService.createCase('Test Case #2', 'Test Case Description', 'New', 'High', 'Web');
        Test.stopTest();
        // Verify results
        Case testRec = [SELECT Id, Subject FROM Case WHERE Subject = 'Test Case #2'];
        System.assertEquals('Test Case #2', testRec.Subject, 'New Test record is Created!');
    }
    @IsTest
    public static void deleteCaseSuccessTest(){
            // Fetch case Record id
            Id caseId = [SELECT Id FROM Case LIMIT 1].Id;
            // Setup a mock test request
            RestRequest request = new RestRequest();
            request.requestURI = 'https://soft13-dev-ed.develop.my.salesforce.com/services/apexrest/InboundCaseManager/' + caseId;
            // request.requestURI = System.URL.getSalesforceBaseUrl().toExternalForm() + 'services/apexrest/InboundCaseManager/' + caseId; //kodu dinamik yapmak icin
            request.httpMethod = 'DELETE';
            RestContext.Request = request;
            RestContext.response= new RestResponse();
            // Call the Inbound Webservice method
            Test.startTest();
            RestInboundWebService.deleteCase();
            Test.stopTest();
             // Verify Result
            List<Case> testRecList = [SELECT Id FROM Case];
            System.assertEquals(0, testRecList.size(), 'Not expecting any Case record to be present after Deletion!');

    }
}