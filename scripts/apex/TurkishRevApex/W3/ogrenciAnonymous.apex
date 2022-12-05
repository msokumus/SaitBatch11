Ogrenci11 student1 = new Ogrenci11();
student1.firstName = 'Marry';
student1.lastName = 'Doe';
student1.className = '6E';
student1.language = 'English';
student1.art = True;
student1.sport = False;
student1.ingGrade = 95;
student1.mathGrade = 92;
student1.fenGrade = 90;
System.debug('Student 1 ' + student1);

Ogrenci11 student2 = new Ogrenci11();
student2.firstName = 'Hans';
student2.lastName = 'Doe';
student2.className = '6A';
student2.language = 'German';
student2.art = True;
student2.sport = False;
student2.ingGrade = 80;
student2.mathGrade = 82;
student2.fenGrade = 80;
System.debug('Student 2 ' + student2);



//class adi ile bir liste olusturmus oluyoruz..
System.debug('========class listesi=======');
List<Ogrenci11> studentsList = new List<Ogrenci11>();
studentsList.add(student1);
studentsList.add(student2);
System.debug('class listesi = ' + studentsList);

System.debug('====for each dongusu====='); // ogrencileri pespese yazdirmak icin for each kullandik.
for (Ogrenci11 eleman : studentsList) {
    System.debug(eleman);
    System.debug(eleman.firstName); // elemanin alt bileseni de cagrilabilir
    System.debug(eleman.lastName);
}



// constractor ile liste olusturma 

Ogrenci11 s1 = new Ogrenci11('Lisa', 'Fire', 95);
System.debug('s1 = ' + s1);

Ogrenci11 s2 = new Ogrenci11('Joseph', 'Fire', 85);
System.debug('s2 = ' + s2);

Ogrenci11 s3 = new Ogrenci11('David', 'Fire', 100);
System.debug('s3 = ' + s3);