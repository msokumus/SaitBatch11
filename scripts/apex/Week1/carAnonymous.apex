//create object of car class.
//we also call it INSTANCE of class.

//ClassName
Car tesla = new car();
tesla.carName = 'Model S';
tesla.carColor = 'Black';
//new instance created, and stored in a variable named 'tesla'
tesla.switchOn();
// Methods should be verbs, in mixed case with the first letter lowercase, with the first letter of each internal word capitalized. Whole words should be used and use of acronyms and abbreviations should be limited. Name should be camelCase like switchOn();
system.debug('tesla car color -> ' + tesla.carcolor);
system.debug('tesla ->' + tesla);
tesla.drive();
tesla.driveAtMaxSpeed();
system.debug('Tesla done');

system.debug('BMW created');//kendi anlamamız için istediğmiz yere debug koyabiliriz. 
car bmw = new car();
bmw.carName = 'XYZ';
bmw.carColor = 'white';
bmw.switchOn();
system.debug('bmw car color ->' + bmw.carColor);
system.debug('bmw ->' + bmw);
//private satırı dışardan güncelleyemeyiz. direk çağıramayız. yani ".maxSpeed" ile çağrılmaz.
bmw.drive();
bmw.driveAtMaxSpeed();
system.debug('BMW done');//kendi anlamamız için istediğmiz yere debug koyabiliriz. 

car toyota = new car();
toyota.switchOn();
toyota.drive(); // burada biz değer vermedik. class içinde de değer olmadığı için null geldi.