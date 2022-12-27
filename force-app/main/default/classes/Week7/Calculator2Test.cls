@isTest  // class becomes test class
public class Calculator2Test { 
    @isTest // method becomes test method
    private static void testMessage() { //private da olabilir. Static, void ve no parameter in TEST methods
    Calculator2.welcomeMessage();  //we want to test our calculator class's methods.
    Calculator2.printNewMessage('this is from test method');  //can we call parameterized methods from test class? yes...
    }
    @isTest
    private static void addTest1() { 
        integer i = 10;
        integer j = 15;
        integer sum1 = Calculator2.add(i,j);
        system.assertEquals(25, sum1);
    }
    @isTest
    private static void addTest2() {       
        integer sum1 = Calculator2.add(10,15,25);
        system.assertEquals(50, sum1);
        }

}
