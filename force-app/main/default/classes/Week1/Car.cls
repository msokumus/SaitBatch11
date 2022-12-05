//created a class.
public class Car {
   //public class variable
   public string carColor = '';
   public string carName = '';
   private integer maxSpeed = 150; //private class variable. başında private yazmasa da private olur.
   //created a method
   public void switchOn(){
      //This is method body.
      Datetime switchOnTime = Datetime.now(); //Method içindeki variable (prrivate veya public olmaz)
      system.debug('starting the car at ' + switchOnTime);
   }
   public void drive(){
      system.debug('driving ' + carName + ' of color ' + carColor);
   }
   public void driveAtMaxSpeed(){
      string drivingDescription = 'Driving ' + carName + ' at ' + maxSpeed + ' km/hr';
      system.debug(drivingDescription);
   }

}


//SAVE CLASS.
//right click. > sfdx deploy.

//class, we deploy
//anonymous apex, we execute.


/*
         Process of creating and executing class -
        1. Create a class by doing - Right click the classes folder --> Select SFDX: Create Apex Class. Enter the name
        2. Save the file.
        3. Deploy the class by doing - SFDX: Deploy Source to Org.
        3. Create anonymus class by doing - Click the scripts folder --> Right click on Apex folder --> Create new file.
        4. Save the file.
        5. Open command palette --> SFDX: Execute Anonymous Apex with Editor Contents
        */