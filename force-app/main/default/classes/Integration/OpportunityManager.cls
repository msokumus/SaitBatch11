//* Turkce ders

@RestResource(urlmapping='/Opp/*')
global with sharing class OpportunityManager {
    @HttpGet
    global static id getOpportunity() {
        RestRequest Request= RestContext.Request;
        string uri = Request.requestURI;
        id oppId = uri.substringAfterLast('/'); // bu method / isaretinden sonrasini getirir. / yerine baska bir ayirici da olur.
        Opportunity op = [select id, name, closedate, stageName,amount from Opportunity where id =:oppId];
        return op.id;
    }
    @HttpPost
    global static id createOpportunity(string name, string closeDate, string stagename, string amount) { // webden bu sekilde gelmesi gerekiyor.
        Opportunity opp = new Opportunity();
        opp.Name = name;
        opp.CloseDate = Date.valueOf(closeDate);
        opp.StageName = stagename;
        opp.Amount = Decimal.valueOf(amount);
        insert opp;
        return opp.id;
    }
    @HttpDelete
    global static string deleteOpportunity() {
        RestRequest Request = RestContext.Request;
        string uri = Request.requestURI;
        id oppId = uri.substringAfterLast('/');
        Opportunity op = [select id from Opportunity where id =:oppId];
        delete op;
        return 'Recordunuz basariyla silindi..';
    }
    @HttpPut
    global static id upsertOpportunity(string id, string name, string closeDate, string stageName, string amount) {
        Opportunity opp = new Opportunity();
        opp.id = id;
        opp.Name = name;
        opp.CloseDate = Date.valueOf(closeDate);
        opp.StageName = stageName;
        opp.Amount = Decimal.valueOf(amount);
        upsert opp;
        return opp.id;
    }
    @HttpPatch
    global static Opportunity updateOpportunity() { // burada parametre olmadigi icin body'ye bakiyoruz.
        RestRequest Request = RestContext.Request; // WEB den gelen istegi karsiladik. workbench webden gelenler: Patch komutu, URL adresi ve body
        string jsonString = Request.requestBody.toString(); // burada bize sadece body lazim sadece onu alip blok olarak stringe cevirdik. 
        Opportunity op = (Opportunity)JSON.deserialize(jsonString, Opportunity.Class);
        update op;
        Opportunity opNew = [select id, name, stageName, closeDate, amount from Opportunity where id =:op.id];
        return opNew;
    }

}

/*
Endpoint - https://soft13-dev-ed.develop.my.salesforce.com/services/apexrest/Opp/xxxxxxxxxx 18 digit ID

{
"id" : "006Do000003a4ppIAA",
"name" : "John",
"closeDate" : "2003-7-3",
"stageName" : "Prospecting",
"amount" : "999999"
}

PUT ile PATCH farki:
Put da belirlediginiz parametreleri yazmak zorundasiniz, patch de buna gerek yok. patch sadece update yapabilir.
put sizin parametrede belirlediğiniz fieldlara göre update eder patch ise istediği fieldi update eder. bunun icin bodyyi yakalayip ona baktik.
   
*/