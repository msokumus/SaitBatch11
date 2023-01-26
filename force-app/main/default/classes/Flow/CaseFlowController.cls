public with sharing class CaseFlowController {
 
    @InvocableMethod(
        label='Send Email to Contact'
        description='Auto-generated email sent to Customers'
        category='Case'
 )
    public static void sendEmailToContact(List<Request> inputParameters) { // Asagidaki wrapper class larin listesi
        // We are fetching the first element of InputParameters 
        String contactId = inputParameters[0].contactIds; // inputParemeters.get(0).contactIds.get(0); bu sekilde de olur. sifir koyduk ilk elementi cagirmak icin
        String caseId = inputParameters[0].caseIds; // string yerine ID de olur. ikisi de interchangable
        String caseNumber = inputParameters[0].caseNumber;
        //Message.singleEmailMessage to prepare Email message to contact record
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.Subject = 'Your Case has been received ' + caseNumber;
        message.plaintextbody = 'Hey Customer, Thanks for reaching out to SoftInnovas. We will get back to you shortly!';
        message.toaddresses = new List<String> { contactId };
        message.setSaveAsActivity(true);

        // Send email to contact record and capture the result
        List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>();
        messages.add(message);
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        
        // (2. yol)
        // Send email to contact record and capture the result
        // Messaging.SendEmailResult[] results = Messaging.sendEmail(new List<Messaging.SingleEmailMessage> {message});

        // Return result to Flow
        if (results[0].isSuccess()) {
            system.debug('Email was sent successfully!');
        } else {
            system.debug('Email delivery got failed!!') ;
        }
    }

    // Wrapper Class -- Collection /Set of Variables -- Structural represent of Data
    // 3 tane paremetre gondermemiz lazim. bunlari wrapper class olarak ayri ayri yapiyoruz.
    Public class Request {

        @InvocableVariable(
        label='Case Record Id'
        description='The Id of Case record'
        required=true
        )
        Public String caseIds;

        @InvocableVariable(
        label='Contact Record Id'
        description='The Id of Contact record'
        required=true
        )
        Public String contactIds;

        @InvocableVariable(
        label='Case Number'
        description='The AutoNum of Case record'
        )
        Public String caseNumber;
    }
}