
JOURNEY Of A CUSTOMER IN AMAZON

1. LOGIN WITH USER ACCOUNT ->
        a. Integration between Amazon & Salesforce to validate Customer Information    
        b. IAM (store username & password in high security data format) -> Username & Password are correct or not

2. ORDER IPHONE 13 PRO MAX ->
        a. Search 'Iphone 13 Pro Max'
            i. MDM (Master Data Management) Amazon go and perform SOSL (Search Operation)
        b. Out of STock/ Based on your location, it show estimated Delivery time
            i. Iventory Management Sytem (ERP) which hold Product information along with no. of available items in which warehouse
        c. Buy the Product
            i. Based on Credit Card Bank -> It will redirect you to that particular Bank Website
            ii. Bank will send out information of success transaction to Amzaon website


AMAZON uses in total 65 systems in background to serve their customer

//-------------------------------------------------------------------------------------------------


        X        --->          Y
    SALESFORCE              EXTERNAL SYSTEM (AMAZON)

INTEGRATION WHERE STARTING POINT IS SALESFORCE AND TARGET SYSTEM IS EXTERNAL/FOREIGN - THIS KIND OF INTEGRATION IS CALLED OUTBOUND INTEGRATION


        X       <---          Y
    SALESFORCE              EXTERNAL SYSTEM (AMAZON)

INTEGRATION WHERE STARTING POINT IS EXTERNAL/FOREIGN AND TARGET SYSTEM IS SALESFORCE - THIS KIND OF INTEGRATION IS CALLED INBOUND INTEGRATION


OUTBOUND + INBOUND INTEGRATION => BI-DIRECTIONAL INTEGRATION

//-------------------------------------------------------------------------------------------------

INTEGRATION


DATA/INFORMATION -> IS THE MAIN SOURCE OF COMMUNICATION

MESSAGE -> CHANNEL OF SYSTEM COMMUNICATION

AS PER WEB STANDARDS, THERE ARE 2 TYPE OF MESSAGE FORMAT
* JSON (JAVASCRIPT OBJECT NOTATITON)
* XML (EXTENSIBLE MARKUP LANGUAGE)


JSON

Features of JSON:
* Easy to use
* Human-readable
* Performace - (JSON) is very FontFaceSet
* All Modern Application follow JSON message format

// JSON'da her zaman bir key ve value olmasi gerekiyor. MAP gibi.
// *** All modern application follow JSON message format for data exchange. ***

{
    "schoolname" : "Soft Innovas",
    "instructors" : 65,
    "IsitVirtual" : true,
    "courses" : [
        {
            "id" : 001,
            "name" : "Basic of Salesforce"
        },
        {
            "id" : 002,
            "name" : "Advance Salesforce Developer"
        },
        {
            "id" : 003,
            "name" : "Market Read Prep"
        }
    ]
}


Slack Messages are tansmitted in JSON format

{
    "to" : "userid/channelid",
    "currentdatetime" : "xxx/xx/xx xx:xx:xx",
    "message" : "Hello!"
}



XML

Features of XML:
* Secure form of Communication (Bankalar kullaniyor)
* Well structured
* XML tags are not predifined. You can add your own tags


<?xml version="1.0" encoding="UTF-8"?>

<root>

    <schholname>Soft Innovas</schholname>
    <instructors>56</instructors>
    <isItVirtual type="boolean">true</isItVirtual>
    <courses>
        <course>
            <id>001</id>
            <name>Basic Training</name>
        </course>
        <course>
            <id>002</id>
            <name>Advnace Training</name>
        </course>
        <course>
            <id>002</id>
            <name>Super Advnace Training</name>
        </course>
    </courses>

</root>



-------------------------------------------------------------------------------------------------


API (Application Programming Interface)

Holds the defination/set of operation one system can do while integration with an external system

There are different types of API:
* REST API (Messaging Format: JSON) - Representational State Transfer
* SOAP API (Messaging Format: XML) - Simple Object Access Protocol
* Bulk APi, Streamming API (Not-popular)


     X   ->    Y
CallOUT Scenario for X to Y


Various type of Interaction
* To Fetch some data in Y
* Create/Upate/Delete some data in Y


These Interaction is generally defined by HTTP Method -- Intentaion behind Messages


REST API
OUTBOUND INTEGRATION CALLOUT USING REST API
INBOUND INTEGRATION USING REST API / EXPOSE FEATURE TO EXTERNAL SYSTEM


SOAP API
OUTBOUND INTEGRATION USING SOAP API


APEX UNIT CLASS FOR INTEGRATION


-------------------------------------------------------------------------------------------------


Business Requirement: To Ingegrate with AMazon to automate Ordering process from Salesforce


As a Developer:
1. Which Api we are going to use? SOAP API/REST API? - AMZOn team to answer whether Integration can happen over REST API or not
2. Whether Order Process is available as an API/feature to be used? - AMZON API DOCUMENT it will list out all features available to you
3. Http Method - WHat is the intent of Message? Ex. POST Data to AMAZON
4. Message Structure to used (%90 JSON kullaniliyor)
5. Callout using APex