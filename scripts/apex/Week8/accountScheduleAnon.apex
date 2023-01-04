AccountSchedule asch = new AccountSchedule();
string crn = '0 0 13 * * ?';
system.schedule('account sc again', crn, asch); // ikinci calistirmada job name degismeli yoksa hata verir

// bu code ile schedule job olusturuyoruz. Org da yapmak yerine buradan yaptik. 