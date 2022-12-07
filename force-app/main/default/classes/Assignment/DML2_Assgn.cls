public class DML2_Assgn {
    public static void insert_dml() {
        Account acc = new account();
        acc.Name = 'Sait Assignment';
        insert acc;
        acc.Name = 'Sait_2 Assignment';
        insert acc;
    }
    public static void updating_dml() {
        Account acc = new account();
        acc.Name = 'Account Created';
        insert acc;
        acc.Name = 'Account Updated';
        update acc;
    }
}
