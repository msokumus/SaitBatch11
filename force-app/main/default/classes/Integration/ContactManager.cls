// Integration Week-2 19.02.2023 Pazar Soru(1)

@RestResource(urlMapping='/Con/*')
global with sharing class ContactManager {
    @HttpGet
    global static Contact getContact() {
        RestRequest Request = RestContext.Request;
        String uri = Request.requestURI;
        id conId= uri.substringAfterLast('/');
        Contact cn = [select id, firstname, lastname, title, email, department from Contact where id =: conId];
        return cn;
    }
    // workbench /services/apexrest/Con/003Do000002mmbFIAQ
    @HttpPost
    global static id createContact(string fname, string lname, string title, string email, string dept) {
       Contact cn = new Contact();
        cn.FirstName = fname;
        cn.LastName = lname;
        cn.Title = title;
        cn.Email = email;
        cn.Department = dept;
        insert cn;
        return cn.id;
    }
    // workbench /services/apexrest/Con
/*  
    {
        "fname":"group 8 cool",
        "lname": "olacak arkadaslar",
        "title": "BASARI",
        "email":"salesforce@sales.com",
        "dept":"developer"
    }
*/
    @HttpDelete
        global static string deleteContact() {
            
            RestRequest Request = RestContext.Request;
            string uri = Request.requestURI;
            id conId = uri.substringAfterLast('/');
            Contact cn = [select id from Contact where id =:conId];
            delete cn;
            return 'Recordunuz basariyla silindi..';
        }
    //   /services/apexrest/Con/003Do000002CjKxIAK
    @HttpPut
    global static Contact upsertContact(string id, string fname, string lname, string title, string email, string dept) {
       Contact cn = new Contact();
        cn.Id = id;
        cn.FirstName = fname;
        cn.LastName = lname;
        cn.Title = title;
        cn.Email = email;
        cn.Department = dept;
        upsert cn;
        return cn;
    }
    // workbench /services/apexrest/Con
/*
    {
        "id" : "003Do000002CjLlIAK",
        "fname":"group 8 cool-2",
        "lname": "olacak arkadaslar-2",
        "title": "BASARI",
        "email":"salesforce@sales.com",
        "dept":"developer"
    }
*/
@HttpPatch
    global static Contact updateContact() {
        RestRequest Request = RestContext.Request; 
        // System.debug(Request.requestBody);
        string jsonString = Request.requestBody.toString();  
        // System.debug(Request.requestBody.toString()); 
        Contact cn = (Contact)JSON.deserialize(jsonString, Contact.Class);
        update cn;
        Contact cnNew = [select id, firstname, lastname, title, email, department from Contact where id =: conId];
        return cnNew;
    }      
       
}