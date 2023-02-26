@istest
public with sharing class OpportunityManagerTest {
    @istest
    private static void postOpportunityTest() {
        test.startTest();
        id oppId = OpportunityManager.createOpportunity('Ayse', '2023-7-2', 'Prospecting', '33333');
        test.stopTest();
        System.assertNotEquals(null, oppId);
        Opportunity op = [select id, name, closeDate, stageName from Opportunity where id =:oppId];
        System.assertEquals('Ayse', op.name);

    }
}