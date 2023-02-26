// LOOP
// aynı işlemi (ufak farkları olan) çok kere yapacaksak loop kullanmammız gerekir. thanks to loop

public class LoopDemo {
    public void print_int_while() {
        integer count = 1;
        while(count <= 25) {
            system.debug(count);
            count++; // sayıya her seferinde 1 ekler 
        }
    }
    public void print_N_numbers(integer n){
        for (Integer i = 0; i < n; i++) { // saymaya sıfırdan başlanır. 9 a kadar say.
            System.debug(i);
        }
    }
    public void print_N_odd_numbers(integer startInt, integer endInt){ //asal sayıları yazdır
        for (Integer i = startInt; i < endInt; i++) { // saymaya sıfır yerine verilen sayıdan başladık.
            integer modI = math.mod(i, 2); // i sayısı 2 ye bölünürse çıkan 1 ise tam sayıdır.
            //modI == 1 then, odd number
            if (modI == 1){
                system.debug(i + ' is odd number');
            }
        }
    }
    public void print_N_odd_numbers2(integer startInt, integer endInt){ //asal sayıları yazdır
        //if startInt is bigger than endInt >> print NOT ALLOWED Bro.
        if (startInt > endInt) {
            system.debug('NOT ALLOWED !!!!');           
        } else {
            for (Integer i = startInt; i < endInt; i++) { 
                integer modI = math.mod(i, 2);
                if (modI == 1){
                    system.debug(i + ' is odd number');
                }
            }
        }
        
    }

}

