public class Calculator {
    //void --> return type.
    //() --> parameters.
    public void welcomeMessage() {
        system.debug('welcome to apex');
        WelcomePriviteMessage();   
        //private a buradan erişilir. dışarıdan da buraya erişilir. dolaylı olarak erişilmiş olur.     
    }
    //Private satıra dışardan erişilemez.Sadece class içinden 
    //erişilir. default olarak private'dır.
    //başına public yazarak puclic yaparız.
    private void WelcomePriviteMessage(){
        system.debug('welcome to private message');
    }
    public void printNewMessage(string msg){
        // msg = variable => is used INSIDE the method.
        system.debug(msg);
    }
    public void printNewMessage2(Integer msg){
        system.debug(msg);
    }
    // return string, append '...ok cool' to parameter
    public string printAndReturnMessage(string msg){
        string returnString = msg + '...OK cool.';
        return returnString;
    }
    public integer add(integer a, Integer b){
        integer sum = a+b;
        return sum;        
    }
    public integer add(integer x, integer y, integer z){
        integer sum = x + y + z;
        return sum;
    }
    //parameter is DATE
    //return type is boolean. yani korelasyon yok. neye ihtiyaç varsa return o tip olabilir.
    public boolean leapYearCheck(date dt){
        integer year = dt.year(); //use built-in method
        boolean lp = date.isLeapYear(year);
        return lp;        
    }
}
