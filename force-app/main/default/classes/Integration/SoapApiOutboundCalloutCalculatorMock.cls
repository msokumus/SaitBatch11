// This Apex Class will serve the purpose of a MOCK Response Class for SOAP Api Outbound CallOut -- Calculator Example
// "SoapApiOutboundCallout_Test" class icin bu Mock class i olusturduk. bunu class icinde class olarak da yapabiliriz.

@IsTest
public with sharing class SoapApiOutboundCalloutCalculatorMock implements WebServiceMock {
    public void doInvoke(
        Object stub,
        Object request,
        Map<String, Object> response,
        String endpoint,
        String soapAction,
        String requestName,
        String responseNS,
        String responseName,
        String responseType
    ){
        // Creating Instance of Custom Reposne Class by looking at SOAP WSDL Apex Class
        CalculatorSOAPApex.doMultiplyResponse response_x = new CalculatorSOAPApex.doMultiplyResponse();
        // Manually Assigning Fake Response Body
        response_x.return_x = 30.0;

        // Assign Response Instance to the main Response Parameter
        response.put('response_x',response_x);
    }
}