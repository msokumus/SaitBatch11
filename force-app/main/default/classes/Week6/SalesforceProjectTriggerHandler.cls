public class SalesforceProjectTriggerHandler {
    public static void createDefaultTicket(List<salesforce_project__c> spTriggerNew) {  //create default salesforce ticket record
        List<Salesforce_Ticket__c>  listST = new List<Salesforce_Ticket__c>(); //create one empty LIST of salesforce ticket

        for (salesforce_project__c eachSP : spTriggerNew) {
            Salesforce_Ticket__c newST = new Salesforce_Ticket__c();  //create new S Ticket.
            newST.Subject__c = 'Default ticket';
            newST.Salesforce_Project__c = eachSP.Id;
            listST.add(newST); //add it in the list
        }
        if (!listST.isEmpty()) { //insert only if we have at least one record in the list
            insert listST;
        }
    }
}