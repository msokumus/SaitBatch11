SoqlDemo.accountSOQL_1();
SoqlDemo.accountSOQL_11();
SoqlDemo.accountSOQL_2();
SoqlDemo.accountS0QL_3();
SoqlDemo.accountSOQL_filter('sforce'); // burada istedigimiz kelime ile arama yapiyoruz. dinamik oldu

List<string> accs = new list<string>{'sforce', '2 minutes ago'};
SoqlDemo.accountSOQL_filter(accs);