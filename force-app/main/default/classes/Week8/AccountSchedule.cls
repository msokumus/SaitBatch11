public class AccountSchedule implements schedulable {
   public void execute(SchedulableContext sc){
    //we will execute batch 
    //any apex code.
    //any method of any class can be called.

    database.executeBatch(new AccountsBatch());
   }
}

// buradan AcountsBatch class dosyasina zamanlanmis gorev yaptik.

// zamani ayarlamak icin asagidaki adimlar yapilir:
// Setup - Apex Classes - Schedule Apex- isim ver. class sec. kaydet
// Zamanlanmis gorevleri gormek icin setup - Apex Jobs
// https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_scheduler.htm

// Org'dan yapmak yerine anon.apex ile de zamani ayarlayabiliriz. bkz apex dosyasi