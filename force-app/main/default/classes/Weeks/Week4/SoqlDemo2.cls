public class SoqlDemo2 {
   public static void soqlchildToParent_1() {
        List<contact> listContacts = [select id, name, account.name, account.industry 
                                    from contact where account.industry = 'Energy'];
        system.debug(listContacts);//by default in contact we don't have account fields. so this doesn't show.
        for (Contact eachContact : listContacts) {
            //get account name from contact record
            string accName = eachContact.Account.name;
                         //contact name from contact record
            system.debug('contact name = ' + eachContact.Name + ', its acc name is ' + accName);
        }
   }

   public static void soqlParentToChild_1() {
        //if our outer query is account. and inner query is opportunity.
        //what list it would return?
        List<account> listAccOpp = [select id, name, annualrevenue, type, (select name, amount from opportunities where stageName = 'Closed Won') from account where type = 'Customer - Direct'];
        // for icinde for dongusu, liste icinde liste
        for (account eachAcc : listAccOpp) {
            system.debug('acc name => ' + eachAcc.Name + ', annual revenue => ' + eachAcc.AnnualRevenue);
            List<Opportunity> listOpp = eachAcc.Opportunities;
            for (opportunity eachOpp : listOpp) {
                system.debug('-- opp name => ' + eachOpp.Name + ', amount is ' + eachOpp.Amount);
            }
        }

   }
}
// account icinden her bir accountun contaclarini asagidaki sekilde cagiririz.
// select id, name,(select id, lastname from contacts) from account

// Object Manager'dan object field'lerine bakarak child name bulunur. custom object icin ismin sonuna __r eklenir.
// select id, name, project_name__c, status__c, (select id, name, subject__c, status__c from salesforce_tickets__r) from salesforce_project__c


// developer console dan query yi calistirip calistigindan emin olunca apex e kopyaliyoruz.
// select id, name, annualrevenue, type, (select name, amount from opportunities where stageName = 'Closed Won') from account where type = 'Customer - Direct'

// count komutu ile dolu olanlari sayiyoruz. daha cok picklist icin kullanilir.
// select count(mailingcity) from contact
// select leadsource, count(ID) from lead group by leadsource

// cift kayitlari bulmak icin asagiki sorguyu yaptik. having komutu kullanilir.
// select name, count(id) from account group by name having count(id) > 1