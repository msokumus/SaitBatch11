public class Ogrenci11 {
// burada void kulanmadık. bu yapıya method denmez, constructor denir. return type'ı yoktur. Aşağıdaki gibi her seferinde bir mesaj yazdırılabilir.
    
    public static integer ogrenciSayisi = 0; // başlangıç değeri sıfır
    public integer oSayisi = 0; // static kullanmazsak ne olur onu gormek icin bu satir.

    public string firstName;
    public string lastName;
    private string schoolName = 'Dream School';
    public string className;
    public string language;
    public Boolean art;
    public Boolean sport;
    public integer ingGrade;
    public integer mathGrade;
    public Integer fenGrade;

    // parametresiz contsractor
    public Ogrenci11() {
        ogrenciSayisi++; // burasi dogru calisir. toplama yapar.
        oSayisi++; // yukarida static kullanmazsak ogrenci eklenince toplama yapmaz.
        System.debug('yeni bir kayit yapildi. Ogrenci sayimiz : ' + ogrenciSayisi);
        System.debug('statik olmayan ogrenci sayisi = ' + oSayisi); // hatayi gormek icin
    }

    // parametreli contsractor
    public Ogrenci11(string firstName, string lName, integer ingNot){
        // parametreli ve parametresiz constrator birlikte varsa sadece parametreli olan calisir. digerini cagirmak icin this() kullanilir.
        this(); //this() yukaridaki parametresiz constructor'i calistirir..
        this.firstName = firstName; // class degiskeni ile ayni ismi verebiliriz.
        this.lastName = lName;
        this.ingGrade = ingNot;
    }
 
}