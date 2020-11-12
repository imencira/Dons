trigger NDDonsCount on Donprotocolairesiege__c (after INSERT, after UPDATE, after DELETE) {
Set <Id> donIds = new Set <Id>();
List <ND__c> lstNDToUpdate = new List <ND__c>();
 if(Trigger.isInsert){
    for(Donprotocolairesiege__c don:trigger.new){
        donIds.add(don.Note_de_D_pense__c);
    }
}
if(Trigger.isUpdate|| Trigger.isDelete){
    for(Donprotocolairesiege__c don:trigger.old){
        donIds.add(don.Note_de_D_pense__c);
    }
}

for(ND__c acc:[SELECT Id,Name,Count_Don__c,(Select Id from Dons__r) from ND__c where Id IN: donIds]){
    ND__c NDobj = new ND__c ();
    NDobj.Id = acc.Id;
    NDobj.Count_Don__c = acc.Dons__r.size();
    lstNDToUpdate.add(NDobj);
}

UPDATE lstNDToUpdate;
}