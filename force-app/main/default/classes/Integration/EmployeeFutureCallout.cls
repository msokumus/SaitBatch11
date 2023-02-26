//* Integration Week-2 19.02.2023 Pazar Soru(2) When an employee record is created in our system, the same detail should be sent to our inhouse system 

public with sharing class EmployeeFutureCallout {
    @Future(callout=True)
    public static void employeePost(Id eId) {
        Employee__c emp = [Select id, Name, Gender__c, Integration_Status__c, Complete_Address__c, Designation__c, Email__c, Username__c, Phone_Number__c from Employee__c where id =: eId];

        EmployeeWrapper emW = new EmployeeWrapper();
        emw.complete_address = emp.Complete_Address__c;
        emw.designation = emp.Designation__c;
        emw.email = emp.Email__c;
        emw.gender = emp.Gender__c;
        emw.username = emp.Username__c;
        emw.name = emp.Name;
        emw.phone_number = emp.Phone_Number__c;

        String responseJSON = JSON.serialize(emW); 

        Http httpObject = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.onlinewebtutorblog.com/employees'); //! ORG da SETUP Remote Site Settings e ekle.
        request.setMethod('POST');
        request.setBody(responseJSON);
        request.setHeader('Content-Type', 'application/json');
        HttpResponse response = httpObject.send(request);
        String responseBody = response.getBody();

        emp.Integration_Status__c = responseBody;
        update emp;


    }
    Public class EmployeeWrapper{
        public string username;
        public string name;
        public string email;
        public string gender;
        public string designation;
        public string phone_number;
        public string complete_address;
    }
/*
    workbench body
  {
    "username": "ebahringer",
    "name": "Braulio Luettgen",
    "email": "kaela.turner@example.net",
    "gender": "Female",
    "designation": "Mean Stack Developer",
    "phone_number": "781.322.7616",
    "complete_address": "298 Edythe Harbors Suite 697\nLake  Mathiasburgh, MN 28564-6386"
  }
*/

//* Bu class i cagirmak icin trigger olusturduk.
// EmployeeFutureCalloutTrigger.trigger
// EmployeeFutureCalloutTriggerHandler.cls


}