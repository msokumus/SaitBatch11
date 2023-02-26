/*
 * SOAP (Simple Object Access Protocol) - Old School - Earlier framework of doing Web Communication/Integration, Secure way of data transfering, XML Messaging Format only
 * Outbound Callout using SOAP Api - 4 Steps of Implementation
 * Step 1: Create Remote Site Setting - to whitelist Domain
 * Step 2: WSDL (Web Service Description Language) - Get WSDL from External System
 *  a. Endpoint Url, Features available, Input parameters (Request), Reponse - XML format
 * Step 3: Convert WSDL to Apex Class using Salesforce framework
 *  a. Useful information to extract from APex Class -
 *      i.      Identify Inner Class - ImplementationPort
 *      ii.     Endpoint
 *      iii.    Features available - (Methods/Functiones defined in Inner Class)
 *      iv.     Utilise any Feature - Understand Datatype for Input Paramets and Output Parameters
 * Step 4: Use/Consume/Invoke the Soap Apex Class to make callout
 */
// Advance --> SOAP UI bu isin testi icin kullaniliyor. Burada Ogrenmedik.

    public with sharing class SoapApiOutboundCallout {

        // SOAP API Callout to Calcultor Heroku APpp to do multiplication
        public static Double makeMultiplication() { // Double bir return tipi. Hesap islerinde kullaniliyor. Kusurati olan decimal gibi. 8.0 gibi kullamilir.

            // Create Instance of INNER CLASS of WSDL APex
            // All features of SOAP are non-static methods
            CalculatorSOAPApex.CalculatorImplPort calc = new CalculatorSOAPApex.CalculatorImplPort(); // method icin instance olusturduk. Class icinde class var. onun altinda method var. Bu static olmayan method a ulasmak icin instance lazim
            // Preparing Request parameters
            Double num1 = 8.0;
            Double num2 = 2.0;
            // Sending SOAP Api callout to Calcultor Heroku App
            // Fetching Response
            Double result = calc.doMultiply(num1, num2);
            System.debug('Calculator Request parameters is : ' + num1 + '*' + num2);
            System.debug('Remote system Response is :' + result);
            return result;
        }
        //SOAP API Callout to Park Heroku APp to get list of Park names based on Country
        public static List<String> makeParkCallout(){
            ParkSOAPApex.ParksImplPort park = new ParkSOAPApex.ParksImplPort();
            String inputCountry = 'India';
                List<String> parkNames = park.byCountry(inputCountry);
            System.debug('Park SOAP API Response for Country-Wise Feature is: ' + parkNames);
            return parkNames;
        }
}

// SoapApiOutboundCallout.makeMultiplication();
// SoapApiOutboundCallout.makeParkCallout();

/*
1. Dis sistemden gelen XML dosyasini kaydet.
2. XML dosyasini Class a cevir. ORG --> SETUP --> Apex Classes --> Generate from WSDLsd --> Class ismi ver.
3. Olusan yeni classi VS Code a indir. Dosya Class altina gelir.
4. Yeni class da Impl port ile biten class icindeki classi bul. Buradaki domain adresini ORG --> Settings --> Remote Site Settings e ekle.
5. Impl Port ile biten class icinde kac tane method oldugunu bul. Bu methodlari nasil ve hangi parametre ile cagiracagini anla. 
6. Imput ve output parameterlari kontrol et. Ornek public String[] byCountry(String arg0) Buna gore input Single String ama output List String.
7. Yeni OutboundCallout Class olustur ve bu Impl Port icindeki metodlari uygun paremetre ile cagir. Anonymous apex ile calistir.
*/




// Today Task : DoAddition, doDivision, doSubration using SOAP APi Callout

