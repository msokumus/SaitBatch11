    /*
    Nobel ödüllü ilk kadın bilim insanı olan Marie Curie'nin doğum tarihi 7 Kasım 1867’dir. 
    Anonim pencerede;
    ●Marie Curie'nin doğum tarihi ile günümüz arasında kaç yıl olduğunu hesaplayınız.
    ●Marie Curie'nin doğum tarihinin artık yıl olup olmadığını kontrol ediniz.
    */

    Date dt1=Date.newInstance(1867,11,7);
    Date dt2=Date.today();
    integer dayBetween=dt1.daysBetween(dt2);
    system.debug('Gun farkı ' + dayBetween);

    
    integer monthBetween=dt1.monthsBetween(dt2);
    system.debug('Ay farkı'+ monthBetween);

    integer dt1year=dt1.year();
    integer dt2year=dt2.year();
    system.debug('Yil farki ' + (dt2year-dt1year));

    boolean isLeap=Date.isLeapYear(dt1year);
    system.debug('Artik yil mi? ' + isLeap);