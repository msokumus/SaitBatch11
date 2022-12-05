public class Cat {
    public string name;
    public string color;

    // normal way
    public Cat() { // bu method degil contractor (void vs yok)
        system.debug('cat constructor called automaticall');
    }

    //constructor way
    public Cat(string n, string clr) {
        name = n;
        color = clr; 
        sleeping(); //bunu ekledik asagidaki satir icin       
    }
    public void sleeping(){
        system.debug(name + ' is kinda sleeping');
    }
}