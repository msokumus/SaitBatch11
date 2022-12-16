/*
•	Create an instance of Trigger_Map.
•	Call InsertSF_Project and keep it’s return value in a new variable.
(Hint : The return value will be Id so it can be stored in Id as well as String)
•	Print the Id using System.debug

•	Call UpdateSF_Project and pass Id (received from InsertSF_Project) and Name as ‘Updated Trigger Project’.
*/
Trigger_Map tm = new Trigger_Map();
Id dd = tm.InsertSF_Project();
system.debug(dd);

tm.UpdateSF_Project(dd, 'Updated Trigger Project');
