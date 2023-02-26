public with sharing class EmployeeFutureCalloutTriggerHandler {
    public static void postEmployee (List <Employee__c> triggernew ) {
        for (Employee__c eachEmp : triggernew) {
            EmployeeFutureCallout.employeePost(eachEmp.id);            
        }
    }
}