// normal way
// if we DO NOT HAVE any constructor then this works.
// or if we have parameter-less contructor then this works.
Cat sfcat = new Cat();
sfcat.name ='Leo';
sfcat.color ='white';
system.debug('sfcat is-> ' + sfcat);


//constructor way
Cat batch11Cat = new Cat('Missy', 'Black');
system.debug('batch11Cat is-> ' + batch11Cat);

// Cat wrongEx + new Cat(4,8); //String - Integer oldugu icin calismaz. hatali