public class LeadControllerTR {
    @AuraEnabled // buton ile cagirmada cacheable yazmaya gerek yok. 
    public static Lead[] searchname(string word) {
        string searchWord = '%' + word + '%';
        return [select FirstName, LastName, Company, Industry, LeadSource from Lead where name like : searchWord];
    }

    @AuraEnabled
    public static Lead[] searchIndustry(string industry) {
        return [select FirstName, LastName, Company, Industry, LeadSource from Lead where Industry =: industry];
    }

     // 3. method pazar HW icin 12.03.2023

    @AuraEnabled
    public static Lead[] searchRecent() {
        return [SELECT FirstName, LastName, Title, Company 
        FROM Lead with Security_Enforced 
        ORDER BY CreatedDate DESC LIMIT 5];
    }

/*  // 2. yol
    public List<Lead> getRecentlyCreatedLeads() {
        List<Lead> leads = [SELECT Id, Name, CreatedDate FROM Lead ORDER BY CreatedDate DESC LIMIT 5];
        return leads;
    } 
    
*/
    

}