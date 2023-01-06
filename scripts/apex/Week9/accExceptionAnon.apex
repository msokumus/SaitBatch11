try{
    Account ac = new account();
    insert ac; //error. so it goes back from this line.
} // catch(DmlException dex) { // bu kucuk hata yakalama elegi. bu olmazsa buyuk elek yakalar. 
  //  system.debug('DML went wrong');
//} 
 catch(exception ex) {  // exception en buyuk hata yakalama elegi. kucuk elekler yakalamazsa buna gelir. yoksa gelmez. bu satir hata yakalada en sona yazilmali. basta olursa hata verir. sistem izin vermez.
    system.debug('something went wrong buddy');
    System.debug('ex -->' + ex.getMessage()); // tam hata mesajini getirir.
    System.debug('ex line number--> ' + ex.getLineNumber()); // hata satir numarasini getirir.
}
system.debug('Apex is SIMPLE');

// hatayi yakala ve yoluna devam et...

// Exeption Handling
// TRY CATCH 



