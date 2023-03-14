public with sharing class OpportunityCtrl {
    @AuraEnabled(cacheable = true) // boylece methoda ulasilabilir
    public static List<Opportunity> getMatchingOpps(String stage){
        return [SELECT Name, Type, StageName, Amount
                FROM Opportunity
                WHERE StageName =: stage AND Amount != NULL
                ORDER BY Amount DESC
                LIMIT 5];
    }

    // 2. method pazar HW icin 12.03.2023

    @AuraEnabled // (cacheable = true) ekini eger otomatik sayfa acilinca veri cikmasini istiyorsak kullaniyoruz.  DML varsa kullanmiyoruz. Button veya combobox varsa kullanmaya gerek yok.
    public static Decimal totalByStage (String stage){

        List<Opportunity> ListOpp = [SELECT StageName, Amount
                                FROM Opportunity
                                WHERE StageName =: stage AND Amount != NULL];
        decimal total = 0;
        for (Opportunity opp:ListOpp){
            total+=opp.Amount;
        }
        return total;
    }

    
}