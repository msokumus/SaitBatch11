// Queueable ise Future method'un interface halidir. record sayilari benzer sayidadir.  Sobject alabilir. JobID kullanilabilir. Future'da JobID yok. Queueable icinden Queueable cagrilabilir. Future da yok. 

public class AccountQueueableExample implements Queueable{
    //class variable
    public list<account> listAcc;
    public AccountQueueableExample(List<account> accounts) {
        //assign parameter variable to Class variable
        listAcc = accounts;
    }

    public void execute(QueueableContext qc){
        list<account> updateAccs = new list<account>();
        for (account eachAcc : listAcc) {
            account a = new account();
            a.id = eachAcc.id;
            a.Name = eachAcc.Name + ' -- SI';
            updateAccs.add(a);
        }
        update updateAccs;
    }
}

// ilk olarak Anon.apex ile cagirdik
// trigger.new read only in after insert. update edemeyiz. pipeline ortasindan sonra read only olur. 
// Accounttrigger.trigger da da satir ekledik. oradan calisacak artik.