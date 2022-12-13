DmlDemo.dmlInsertDemo_stndObj();
DmlDemo.dmlInsertDemo_cstmObj();
DmlDemo.dmlUpdateDemo_1();
DmlDemo.dmlUpdateDemo_3();
DmlDemo.dmlInsertDemo_4();
DmlDemo.dmlInsertDemo_5();
DmlDemo.dmlInsertMultiple_right();
DmlDemo.dmlInsertMultiple_right2();
DmlDemo.dmlUpdateMultiple_right1();

// DML ile record lari silme..........
//list<account> delAcc = [select id, name from account where name like '%via B.0%' AND name like '%Softinnovas%']; 
delete [select id from account where createddate = THIS_WEEK];
delete [select id, name from account where name like '%via B.0%' AND name like '%Softinnovas%'];

