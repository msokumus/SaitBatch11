/*
trigger AccountTrigger on Account (before insert, after insert) {

    if(Trigger.isBefore){
        system.debug('account before insert trigger called.');
    }
    if(Trigger.isAfter){
    system.debug('account after insert trigger called.');
    }
}


trigger AccountTrigger on Account (before insert, before update) {
    //before insert
    if (trigger.isInsert){
        system.debug('account before INSERT trigger called.'); //when will this code run?
    }
    if (trigger.isUpdate){
        system.debug('account before UPDATE trigger called.');
    }  
    
}


trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    if (trigger.isInsert && trigger.isAfter) { 
        system.debug('account after insert trigger called');
    }
    if (trigger.isInsert && trigger.isBefore) { 
        system.debug('account before insert trigger called');
    }
    if (trigger.isUpdate && trigger.isAfter) { 
        system.debug('account after UPDATE trigger called');
    }
    if (trigger.isUpdate && trigger.isBefore) { 
        system.debug('account before UPDATE trigger called');
    }
}


trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    if (trigger.isAfter) { 
        system.debug('newly inserted record ==>' + trigger.new); // trigger.new her zaman listedir.
}
}

// eger cagirdigimiz objenin alt detaylarini kullanacaksak list ve for dongosu kullaniyoruz.
trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    
    list<account> accTriggerNew = trigger.new;
    if (Trigger.isBefore && Trigger.isInsert) {
        system.debug('BEFORE INSERT new record ==> '  + accTriggerNew);
        system.debug('BEFORE INSERT  new accounts size ==> ' + accTriggerNew.size());

        for (account eachAcc : accTriggerNew) {
            system.debug('BEFORE each acc id is ' + eachAcc.Id + ', each acc name is ' + eachacc.Name);
        }
    }
    if (Trigger.isAfter && Trigger.isInsert) {
        system.debug('AFTER newly inserted record ==> '  + accTriggerNew);
        system.debug('AFTER newly inserted accounts size ==> ' + accTriggerNew.size());

        for (account eachAcc : accTriggerNew) {
            system.debug('AFTER each acc id is ' + eachAcc.Id + ', each acc name is ' + eachacc.Name);
        }
    }
}

// eger cagirdigimiz objenin alt detaylarini kullanacaksak list ve for dongosu kullaniyoruz.
trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    
    list<account> accTriggerNew = trigger.new;
    if (Trigger.isBefore && Trigger.isUpdate) {
        system.debug('BEFORE UPDATE new record ==> '  + accTriggerNew);
        system.debug('BEFORE UPDATE  new accounts size ==> ' + accTriggerNew.size()); // burada sadece liste metodlarini okutabiliriz.

        for (account eachAcc : accTriggerNew) {
            system.debug('BEFORE each acc id is ' + eachAcc.Id + ', each acc name is ' + eachacc.Name);
        }
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        system.debug('AFTER newly UPDATEd record ==> '  + accTriggerNew);
        system.debug('AFTER newly UPDATEd accounts size ==> ' + accTriggerNew.size());

        for (account eachAcc : accTriggerNew) {
            system.debug('AFTER each acc id is ' + eachAcc.Id + ', each acc name is ' + eachacc.Name);
        }
    }
}

// trigger.old mevcut olan eski datayi gosterir. daya yoksa null olur. 
trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    
    if (Trigger.isBefore && Trigger.isInsert) {
        system.debug('Account before insert trigger.old ==> '  + trigger.old);      
    }
    if (Trigger.isAfter && Trigger.isInsert) {
        system.debug('Account after insert trigger.old  ==> '  + trigger.old);
    }
    if (Trigger.isBefore && Trigger.isUpdate) {
        system.debug('Account before update trigger.old ==> '  + trigger.old);      
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        system.debug('Account after update trigger.old  ==> '  + trigger.old);
    }
}


trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    
    if (trigger.isBefore && trigger.isUpdate) {
        List<account> accTriggerOld = trigger.old;//OLD (previous) values of records
        for (account oldAcc : accTriggerOld) {
            system.debug('old acc name = ' + oldAcc.Name + ', old acc id => ' + oldAcc.Id);
        }

        List<account> accTriggerNew = trigger.New;//New (updated) values of records
        for (account newAcc : accTriggerNew) {
            system.debug('new acc name = ' + newAcc.Name + ', new acc id => ' + newAcc.Id);
        }
    }
}


// SET kullanalim.
trigger AccountTrigger on Account (before insert, before update, after insert, after update) {

    if (trigger.isAfter) {
        List<account> accTriggerNew = trigger.New; // New (updated) values of records

        set<id> setIds = new set<id>(); //add all IDS of accounts which are inserted/updated 
        for (account newAcc : accTriggerNew) {
            Id accId = newAcc.id;
            setids.add(accId);//adding ID to newly created set.
        }
        system.debug(setids);
    }
}


// MAP kullanimi
trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    
    List<account> accTriggerOld = trigger.old; //list of old records
    List<account> accTriggerNew = trigger.new; //list of new records
    map<id, account> accTriggerOldMap = trigger.oldMap; //map of old records, id is key. (List'ten farki, key ve value olmasi)
    map<id, account> accTriggerNewMap = trigger.newMap; //map of new records, id is key

    //what elements we have in these maps.
    if (Trigger.isBefore && Trigger.isInsert) {
        system.debug('before insert old => ' + accTriggerOld);
        system.debug('before insert new => ' + accTriggernew);
        system.debug('before insert old map => ' + accTriggerOldMap);
        system.debug('before insert new map => ' + accTriggernewMap);
    }
    if (Trigger.isAfter && Trigger.isInsert) {
        system.debug('after insert old => ' + accTriggerOld);
        system.debug('after insert new => ' + accTriggernew);
        system.debug('after insert old map => ' + accTriggerOldMap);
        system.debug('after insert new map => ' + accTriggernewMap);
    }

    if (Trigger.isBefore && Trigger.isUpdate) {
        system.debug('before update old => ' + accTriggerOld);
        system.debug('before update new => ' + accTriggernew);
        system.debug('before Update old map => ' + accTriggerOldMap);
        system.debug('before Update new map => ' + accTriggernewMap);
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        system.debug('after update old => ' + accTriggerOld);
        system.debug('after update new => ' + accTriggernew);
        system.debug('after Update old map => ' + accTriggerOldMap);
        system.debug('after Update new map => ' + accTriggernewMap);
    }
}



trigger AccountTrigger on Account (before insert, before update, after insert, after update) {

    List<account> accTriggerOld = trigger.old; //list of old records
    List<account> accTriggerNew = trigger.new; //list of new records
    map<id, account> accTriggerOldMap = trigger.oldMap; //map of old records, id is key
    map<id, account> accTriggerNewMap = trigger.newMap; //map of new records, id is key


    if (Trigger.isAfter && Trigger.isUpdate) {

        //old account name and new account name using ONE for loop.
        
        //get set of id using map.
        set<id> accountIds = accTriggerNewMap.keySet(); // burada accTriggerOldMap.keySet de kullanabilirdik. cunku ID ler ayni.
        for (Id eachId : accountIds) {
            //get NEW account value from NewMap - id is same in newmap and oldmap
            account newAcc = accTriggerNewMap.get(eachId);
            system.debug('NEW Acc Name is ' +  newacc.Name);
            //get OLD account value from OldMap
            account oldAcc = accTriggerOldMap.get(eachId);
            system.debug('Old Acc Name is ' +  oldacc.Name);
        }
    }
}


trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    
    if (trigger.isAfter && trigger.isUpdate) {
        system.debug('after update trigger');

        map<id, account> accTriggerOldMap = trigger.oldMap; //map of old records, id is key
        map<id, account> accTriggerNewMap = trigger.newMap; //map of new records, id is key
        set<id> accountIds = accTriggerNewMap.keySet(); //all the IDS.
        system.debug('accountids -> ' + accountIds);
        system.debug('accountIdsOld -> ' + accountIdsOld);

        integer countWebsite = 0; // for un disina yazdik. toplam degisiklik sayisi icin.

        for (Id eachId : accountIds) {
            //get NEW account value from NewMap - id is same in newmap and oldmap // old veya new kullanilabilir. Cunku ID ayni
            account newAcc = accTriggerNewMap.get(eachId);
            string newWebsite = newAcc.Website;
            system.debug('** newWebsite -> ' + newWebsite);
            //get OLD account value from OldMap
            account oldAcc = accTriggerOldMap.get(eachId);
            string oldWebsite = oldAcc.Website;
            system.debug('** oldWebsite -> ' + oldWebsite);

            if (newWebsite != oldWebsite) {
                system.debug('Account is ' + newAcc.Name + ', website changed to ' + newwebsite);
                countwebsite++; // degisiklikleri sayiyoruz...
            }
           
        }
        system.debug('website updated for # of accounts => ' + countwebsite);
    }
}


trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    
    if (Trigger.isBefore) {
        for (account eachAcc : Trigger.new) {
            if (Trigger.isInsert && eachAcc.Active__c == 'Yes') {
                //just update field
                eachAcc.Description = 'Account is now active. Enjoy buddy!!';
            }
            //if account is updated.
                //check if active field is changed from not yes to yes
                //then update description
            if (Trigger.isUpdate) {
                //get old account using OldMAP
                Account oldAccount = Trigger.OldMap.get(eachAcc.Id);
                //get new account using newMap
                Account newAccount = Trigger.NewMap.get(eachAcc.Id);
                //oldAccount.Active__c != newAccount.Active__c
                if (eachAcc.Active__c == 'Yes' &&
                   oldAccount.Active__c != newAccount.Active__c ) {
                    eachAcc.Description = 'Account is NOW ACTIVE. You must Enjoy!';
                }
            }
        }
    }
}

// yukaridaki kodu asagidaki gibi birlestirebiliriz. tek yerde aciklama guncellenmis olur
trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    
    if (Trigger.isBefore) {
        for (account eachAcc : Trigger.new) {
            boolean updateDesc = false;
            if (Trigger.isInsert && eachAcc.Active__c == 'Yes') {
                //just update field
                updateDesc = true;
            }
            //if account is updated.
                //check if active field is changed from not yes to yes
                //then update description
            if (Trigger.isUpdate) {
                //get old account using OldMAP
                Account oldAccount = Trigger.OldMap.get(eachAcc.Id);
                //get new account using newMap
                Account newAccount = Trigger.NewMap.get(eachAcc.Id); // 286 varsa bu satira gerek yok.
                //oldAccount.Active__c != newAccount.Active__c
                if (eachAcc.Active__c == 'Yes' &&
                   oldAccount.Active__c != newAccount.Active__c ) {
                    // oldAccount.Active__c != eachAcc.Active__c // bu da olur. 3. yol. bu varsa 282 ye gerek yok
                   // oldAccount.Active__c != 'Yes' // bu da olur.
                    updateDesc = true;
                }
            }
            if (updateDesc) {
                eachAcc.Description = 'Account is now active. Enjoy buddy!!';
            }
        }
    }
}
*/
// yukaridaki kodu AccountTriggerHandler.cls icine tasidik....

trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    
    if (Trigger.isBefore) {
        AccountTriggerHandler.updateDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        //HERE we call handler method to update all contacts VIP field
        AccountTriggerHandler.updateVIPforContacts(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
}

