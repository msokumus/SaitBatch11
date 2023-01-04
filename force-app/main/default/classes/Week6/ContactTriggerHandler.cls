public class ContactTriggerHandler {
    public static void contactUpdateValidation1(List<contact> conTriggerNew, List<contact> conTriggerOld,
             Map<id, contact> conTriggerNewMap, Map<id, contact> conTriggerOldMap) {
 
                 //validation
                 for (contact eachContact : conTriggerNew) {
                     Contact oldContact = conTriggerOldMap.get(eachContact.id);
                     if (oldContact.LeadSource == 'Partner Referral') {
                         eachContact.addError('Cannot update Partner Referral contact'); // sayfa basina hata mesaji verir
                     }
                 }
    }
    public static void contactUpdateValidation2(List<contact> conTriggerNew, List<contact> conTriggerOld,
             Map<id, contact> conTriggerNewMap, Map<id, contact> conTriggerOldMap) {
 
                 for (contact eachContact : conTriggerNew) {
                     contact oldContact = conTriggerOldMap.get(eachContact.id);
                     if (eachContact.LeadSource != oldContact.LeadSource) {
                        string customError = system.label.ContactValidation2; // org da actigimiz custom label ile dinamik hata mesajina cevirdik. eskisi altta. 
                        eachContact.LeadSource.addError(customError);
                        // eachContact.LeadSource.addError('Cannot update lead source. Don`t do it Sait!'); // field altinda hata mesaji verir
                     }
                 }
     }
 }

 // CUSTOM LABEL uygulamasi