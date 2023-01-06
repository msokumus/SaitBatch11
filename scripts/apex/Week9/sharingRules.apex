/* Sharing Rules

With Sharing        --> Class A     [with sharing rules.] Sharing rule a uygun olarak calisir. 
                                    [trigger, vf page, lwc --> with sharing.] // trigger vs ile cagrilirsa 'with sharing' olur. 
    --> call method of class C. 
    --> call method of class B.     // baska tip class lardan cagrilirsa da ayni sekilde 'with sharing' olur. 



Inherited sharing   --> Class B     [with sharing when called from Class A]
                                    [trigger, vf page, lwc --> with sharing.] // Trigger vs ile cagrilirsa otomatik olarak 'with sharing' olur. 
                                    [without sharing when called from Class C]
                                    // cagrilan class hangi tip ise onun ozelligini alir.



Without Sharing     --> Class C     [without sharing rules.] sharing rule u dikkate almaz. User'in gormemesi gereken recordlari da getirir. 
                                    [trigger, vf page, lwc --> without sharing.]
    --> call method of class A      nereden cagrilirsa cagrilsin hep 'without sharing' olur.



omitted sharing     --> class D     [with sharing when called from Class A]
(bos, hicbir sey yazmazsak)         [trigger, vf page, lwc --> without sharing.] // FARKLI!!! Trigger vs ile cagrilirsa 'withOUT sharing' olur. 
 no sharing is mentioned            [without sharing when called from Class C]
                                    (bos birakilirsa Inherited gibi davranir. tek farki triggerdan cagrilirsa olur.)



https://salesforce.stackexchange.com/questions/264509/inherited-sharing-vs-no-sharing-declaration

/*