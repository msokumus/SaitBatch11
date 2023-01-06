Map<string, EmailDomain__mdt> allDomains = EmailDomain__mdt.getAll();
system.debug('all domains -> ' + allDomains);



* Custom Metadata Type // hem kendisi hem de recordlar org tan org a tranfer edilebilir. Farki bu. recordlari insert veya update ederken apex kolay kullanilamaz, dezavantaji bu.

* Custon seetings // bunun ile DML yapilabilir Custom Object de oldugu gibi.. Avantaji bu.

* Custom Object
bu üçü hemen hemen aynidir. 


Custom Metadata Type
Org ==> Setup ==> Custom Metadata Types ==> new. sonra new field olustur.
Manage ile aç. New ile record olustur. 
yukaridaki kod ile bu recordlari cagirabiliyoruz.

Olusturdugumuz metadatalari VS code icine bulut logosundan cagirabiliyoruz. refresh yap. buluta tikla indir.
(Eger class ve meta larindan bir hata yoksa cagrilabiliyor. Hatayi duzelt oyle cagir.) 

Bulut acik degilse sag tikla Org Browser i ac. Bulut = Org Browser