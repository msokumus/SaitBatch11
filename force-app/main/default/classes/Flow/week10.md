Jan 9, 2023

*** Quick summary to relate with your Apex skill:**

* Screen flow - You receive input from user and then you may interact with database. Like if you want to build a custom screen to collect information from user to create account record.
* Scheduled Trigger - It runs on particular time similar to scheduled apex.
* Record Trigger - it run when there is any interaction in the database, similar to triggers.
* Platform event - Similar to record trigger but it is invoked when there is any interactions on the Platform event objects.
* Auto launched(No-trigger) - it is like an apex class method, you can invoke this from other flow. (edited) 

Jan 10, 2023

*** HANDS ON:**
* Button available ‘Quick Contact’ on Account Record Page
* Once you click the button, it will show Contact form to fill
* Once you have filled all the details, Save the Contact record
* If succesful inserted, we will have a success creen
* If insertion fail, we will show error screen
* Once contact is created, it should be available under Account’s related list
*** IMPLEMENTATION:**
* As we have to build Custom User Interface for Contact creation - We will choose ‘Screen Flows’
*** APPROACH:**
* 1. Contact Form(Collection of Input Fields) Screen
* 2. Save Button -> Initiate Create Record -> Map the Input values to Contact fields
* 3. Auto-fetch Account Record Id & Auto Populated for Contact
* 4. Display Success Screen/ Fault Screen


-------------------------------------------

*** HANDS ON:**
* Button available ‘Quick Opportunity’ on Account Record Page
* Once you click the button, it will show Opportunity form to fill
* Lookup fields, Picklist fields, Record Choice fields to be used
* Once you have filled all the details, Save the Opportunity record
* If succesful inserted, we will have a success creen
* If insertion fail, we will show error screen
* Once Opp is created, it should be available under Account’s related list

Hands On: We will build a Quick Action “New Opportunity” which will inturn invoke Screen Flow . It will ask for mandatory field values to be populated. Once you have filled these details, we will create Opp record.


**HandsOn:**
Create multi-screen input form capture to create Contact & Opportunity
SOLUTION: MULTI SCREEN FLOW
IMPLEMENTATION:
Step 1 -> Screen 1: Contact Form to fill
Step 2 -> Screen 2: Opportunity Form to fill
Step 3 -> Create Contact
Step 4 -> Create Opportunity
Step 5 -> Create Opportunity Contact Role Record (junction object of Contact & Opp)


AUTO-LAUNCHED FLOW -> There is no Entry Criteria/Initiation for Auto-Launched Flow. We can this flows from another Flow or Apex.
List of Actions:
1. Create a Process which will check if the Account Industry is xxxx then Update the Description field
2. When an account is updated, create a task under the same account
3. Once task is created, post a chatter notification to the same account
4. Fault Handling Step - Send Email with error Message
How to invoke Auto Launched Flow:
1. Screen Flow
2. Apex




Onemli



1. Every time a record is updated and meets the condition requirements ==> When User update a certain record in initial instance to meet the condition => Flow will be executed
Apex Trigger is executed later => Stage = 'Closed Lost' Amount = 20000 => Flow will not rerun or revert its changes
2. Only when a record is updated to meet the condition requirements =>
An User => Stage = 'Closed Lost' Amount = 20000 => Flow will executed and Condition check is failed
Later Apex trigger => Update Fields to Stage = 'Cloaded Won' Amount = 60000 => Flow will be executed with condition match


List<Contact> contactList = [SELECT ALL_FIELDS FROm Contact WHERE CreateDate = THIS_WEEK AND AccountId = null]; // Get Records
Account dummyAcc = new Account(Name = 'Dummy Acc');
insert dummyAcc; // Create Dummy Account
List<Contact> contactsToBeUpdated = new List<Contact>(); // Prepare a new variable to store Contacts
for(Contact con : contactList){ // Iteration
    con.AccountId = dummyAcc.Id; // Assignment
    contactsToBeUpdated.add(con); // Add each record to this Variable
}
update contactsToBeUpdated; // Update Contact




