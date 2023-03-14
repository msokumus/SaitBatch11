public with sharing class AccountCtrl {
    @AuraEnabled(cacheable = true) // boylece methoda ulasilabilir
    public static List<Account> getTopAccounts(){
        return [SELECT Id, Name, Type, Industry, AnnualRevenue
                FROM Account
                WHERE AnnualRevenue != NULL
                WITH SECURITY_ENFORCED
                ORDER BY AnnualRevenue DESC
                LIMIT 5];
    }
}