trigger EmployeeFutureCalloutTrigger on Employee__c (after insert) {
    if (trigger.isAfter && trigger.isInsert) {
        EmployeeFutureCalloutTriggerHandler.postEmployee(trigger.new); 
    }
}