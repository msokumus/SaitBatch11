// main project Projemiz Accounting Service App kodu
// RestManagerGetCallout

public with sharing class RestManagerGetCallout {
   public static HttpResponse getUserManagers(){

    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://gorest.co.in/public/v2/users');
    request.setMethod('GET');

    Http http = new Http();

    HttpResponse response = http.send(request);

    if (response.getStatusCode() == 200) {
        string jsonString = response.getBody();
        list<UserWrapper> wrapperUsers =(list<UserWrapper>)JSON.deserialize(jsonString, list<UserWrapper>.class);

        List<Customer__c> listCustomers = new List<Customer__c>();
        for (UserWrapper eachUser : wrapperUsers) {
            Customer__c customer = new Customer__c();
            customer.Name = eachUser.name;
            listCustomers.add(customer);
        }

    }else{
        system.debug('Something went wrong');
    }

    return response;
   }

   
   public class UserWrapper{
        string name;

   }
}

// RestManagerGetCallout.getUserManagers();