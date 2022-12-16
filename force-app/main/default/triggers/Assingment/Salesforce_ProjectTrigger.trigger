/*
Create a trigger on Salesforce_Project__c
•	Trigger should work on before update,before insert,after insert,after update.
•	Use the Trigger.New on insert and set the name of Project as ‘New Trigger Project’ before insert. Use system.debug to display the project name.
•	Use Trigger.newMap and Trigger.newMap on update. Use for loop on the map variable and use system.debug to display the project name before update and project name after update.
 */

trigger Salesforce_ProjectTrigger on Salesforce_Project__c (before insert, before update, after insert, after update) {
    /* if (Trigger.isInsert && Trigger.isBefore) {
        List<Salesforce_Project__c> oppNew = Trigger.new;
        for(Salesforce_Project__c spro : trigger.new){
            spro.Project_Name__c = 'New Trigger Project';            
        }
        system.debug('New Trigger Project ==> ' + spro.Project_Name__c);
    } */

/*     if (trigger.isUpdate && trigger.isBefore) { 
        system.debug('New Trigger Project ==>' + trigger.new);
    }
    if (trigger.isUpdate && trigger.isAfter) { 
        system.debug('New Trigger Project ==>' + trigger.new);
    }
 */
}