Candidates.CompanyName = 'SoftInnovas';
Candidates.printCandidatesInfo();
system.debug('start count of candidates = '+ Candidates.countCandidates);

Candidates c1 = new Candidates();
//Candidates.countCandidates++;
c1.Name = 'Jerry';
c1.Gender = 'Male';
c1.printCandidates();

Candidates c2 = new Candidates();
//Candidates.countCandidates++;
c2.Name = 'Elaine';
c2.Gender = 'Female';
c2.printCandidates();
//for mac: opt + shift + drag mouse

Candidates.CompanyName = 'NEW Company'; // company name burada guncelledik ama company name tumu guncellendi.

Candidates c3 = new Candidates();
//Candidates.countCandidates++;
c3.Name = 'George';
c3.Gender = 'Male';
c3.printCandidates();

System.debug('------');
c1.printCandidates();
System.debug('------');
c2.printCandidates();
System.debug('------');
Candidates.printCandidatesInfo();

system.debug('End count of candidates = '+ Candidates.countCandidates);