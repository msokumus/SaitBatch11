public class Candidates {
    public string Name;
    public string Gender;
    public static string CompanyName;
    public static integer countCandidates=0;

    public Candidates(){ 
        countCandidates++;
    }//buraya constracter ekledik . artik otomatik olarak saymis olacak. her satura yazmaya gerek yok. 


    public void printCandidates() {
        system.debug('name is '+ Name);
        system.debug('gender is '+ Gender);
        system.debug('company name is '+ CompanyName);
    }
    public static void printCandidatesInfo(){
        // we CAN access only static members inside static method.
    System.debug('COMPANY NAME IS ' + CompanyName);
    // WE CANNOT ACCESS NON-STATIC EMMBERS INSIDE STATIC METHOD.
    // system.debug('name is '+ Name);
    }
}
