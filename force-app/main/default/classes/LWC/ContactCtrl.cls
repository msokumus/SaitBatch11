public with sharing class ContactCtrl {
    @AuraEnabled
    public static List<Contact> getMatchingContact (String searchKey){
        searchKey = '%' + searchKey + '%';
        return [SELECT FirstName, LastName, Title, Department
                FROM Contact
                WHERE FirstName LIKE :searchKey OR LastName LIKE :searchKey
                WITH SECURITY_ENFORCED];
    }
}


/*  chat CBT

public class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> searchContacts(String searchTerm) {
        String searchQuery = '%' + searchTerm + '%';
        List<Contact> matchingContacts = [SELECT Id, FirstName, LastName, Email, Phone FROM Contact WHERE FirstName LIKE :searchQuery OR LastName LIKE :searchQuery OR Email LIKE :searchQuery OR Phone LIKE :searchQuery];
        return matchingContacts;
    }
} */