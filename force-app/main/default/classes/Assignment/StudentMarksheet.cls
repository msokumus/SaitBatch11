public class StudentMarksheet {
    public void showMarksheetUsingDatatype() {
        string firstName = ' Jane';
        string lastName = 'Woo';
        Decimal mathematics = 58.5;
        integer english = 90;
        integer chemistry = 65;
        system.debug(firstName + ' ' + lastName + ', Mathematics mark: ' + mathematics);
        system.debug(firstName + ' ' + lastName + ', English mark: ' + english);        
        system.debug(firstName + ' ' + lastName + ', Chemistry mark: ' + chemistry);
    }
    public void showMarksheetUsingObject() {
        Object fName = ' Omer';
        Object lName = 'Woo';
        Object math = 68.5;
        Object eng = 80;
        Object chem = 77;
        system.debug(fName + ' ' + lName + ', Mathematics mark: ' + math);
        system.debug(fName + ' ' + lName + ', English mark: ' + eng);
        system.debug(fName + ' ' + lName + ', Chemistry mark: ' + chem);
    }
}