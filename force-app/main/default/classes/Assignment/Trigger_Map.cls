/*
•	Create a class Trigger_Map
•	Create a method InsertSF_Project.
•	Insert a new record of Salesforce Project (Salesforce_Project__c)
•	Method should return Id of the newly created Salesforce Project.

•	Create a method UpdateSF_Project.
•	The method accepts 2 inputs, one is the Id and second one is the name. (Choose data type accordingly)
•	Update the Project_Name__c field with the value received in name input.
*/

public class Trigger_Map {

    public Id InsertSF_Project() {
        
        Salesforce_project__c sp = new Salesforce_project__c();
        sp.project_name__c = 'Assignment-12 December 2022';
        insert sp;
        return sp.Id;
    }

    public void UpdateSF_Project(id dd, string nm) {
        
        Salesforce_project__c sPup = [select id, Project_Name__c from Salesforce_Project__c where id = :dd];
        sPup.project_name__c = nm ;
        update sPup;
    }
}
