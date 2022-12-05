public class Practice11 {
    //static bir ogrenci11 bos liste olusturalim. 
    //bir metot yazalim bu metot 3 tane Ogrenci11 classina ait obje(instance) uretsin ve bunu static listeye eklesin..
    public static List<Ogrenci11> ogrenciList = new List<Ogrenci11>();

    public static void ogrenciler() {
        Ogrenci11 s1 = new Ogrenci11('Lora', 'Fire', 95);
        ogrenciList.add(s1);

        Ogrenci11 s2 = new Ogrenci11('John', 'Fire', 85);
        ogrenciList.add(s2);

        Ogrenci11 s3 = new Ogrenci11('Adam', 'Fire', 100);
        ogrenciList.add(s3);
    }
}