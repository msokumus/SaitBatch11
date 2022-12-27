@istest
public class Dml11Test {
    @IsTest
    static void createAccountsAndContactsTest(){
        
        Test.startTest();
        Dml11.createAccountsAndContacts(5);
        Test.stopTest();

        List<Account> accList = [select id, name, (select id, lastName from contacts) from account];
        integer acSys = accList.size();
        system.assertEquals(5, acSys);

        integer oneAccOfCon = accList[0].contacts.size();
        System.assertEquals(5, oneAccOfCon);

        /*string conName = accList[0].Contacts[0].lastName;
        System.assertEquals('Contact 1.1', conName);*/
        
    }
}