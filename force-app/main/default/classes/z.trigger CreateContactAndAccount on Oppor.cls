// interview sorusu ornegi
// Write a trigger when an Opp is created a Contact and an Account will be created with the same name.

trigger CreateContactAndAccount on Opportunity (after insert) {
    List<Contact> contactsToInsert = new List<Contact>();
    List<Account> accountsToInsert = new List<Account>();
    
    for (Opportunity opp : Trigger.new) {
        Contact c = new Contact();
        c.FirstName = opp.Name;
        c.LastName = 'Contact';
        contactsToInsert.add(c);
        
        Account a = new Account();
        a.Name = opp.Name;
        accountsToInsert.add(a);
    }
    
    insert contactsToInsert;
    insert accountsToInsert;
}


