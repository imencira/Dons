@isTest
public class Test_NDDonsCount {
    
 @testSetup static void setup() {
    TestHelper.delegationTest();
    TestHelper.organisateur();
  }

   @isTest static void TestinserdontoND () {
       
     
       List <ND__c> lstNDToUpdate = new List <ND__c>();

        Direction_R_gionale__c dr =new Direction_R_gionale__c (Name='testdr',Code_UO__c='10450', Email__c='testmaildr@outlook.com');
       insert dr;
       
      
       
       
        D_l_gation__c  del =new D_l_gation__c ( 		Name='testdl',Code_UO__c='104', Email__c='testmaildl@outlook.com',DR__c=dr.id);
     insert del;
       
       Organisateur__c organisateur = [Select Id from Organisateur__c where Name = 'UNICEF' LIMIT 1];
        Donprotocolairesiege__c don1 = new Donprotocolairesiege__c(Type_Don__c='Appréciation du siège', 
              Organisateur__c=organisateur.Id,
             Type_de_Tarification__c='Au Pourcentage',

               DL_DT__c	=del.id,
              Civilit__c='Madame',
           Montant_des_droits__c=500, 
            Nom__c='xx',Pr_nom__c='yy', 
            Date_concern_e__c=date.newInstance(2017, 5, 1),
           Date_de_r_glement__c=date.newInstance(2017, 3, 1),
         Pourcentage_proposition__c='30',
          Pi_ces_Jointes__c='	Etat des recettes et dépenses;	Contrat général de représentation;	Bilan détaillé manifestation;	Demande écrite de don jointe');
              
     insert don1;    
       
           B_n_ficiaire__c ben =new B_n_ficiaire__c(Beneficiaire__c=organisateur.Id,Part_du_Don__c=100,Don__c=don1.Id);
insert ben;
        
       
       ContentVersion content=new ContentVersion(); 
        content.Title='Header_Picture1'; 
        content.PathOnClient='/' + content.Title + '.jpg'; 
        Blob bodyBlob=Blob.valueOf('Unit Test ContentVersion Body'); 
        content.VersionData=bodyBlob; 
        //content.LinkedEntityId=sub.id;
        content.origin = 'H';
        insert content;
       
        ContentVersion content2=new ContentVersion(); 
        content2.Title='Header_Picture2'; 
        content2.PathOnClient='/' + content2.Title + '.jpg'; 
        Blob bodyBlob2=Blob.valueOf('Unit Test ContentVersion Body'); 
        content2.VersionData=bodyBlob2; 
        //content.LinkedEntityId=sub.id;
        content2.origin = 'H';
        insert content2;
       
       ContentDocumentLink contentlink=new ContentDocumentLink();
        contentlink.LinkedEntityId=don1.id;
        contentlink.contentdocumentid=[select contentdocumentid from contentversion where id =: content.id].contentdocumentid;
        contentlink.ShareType = 'I';
        contentlink.Visibility = 'AllUsers'; 
        
        
        insert contentlink;   
       
        ContentDocumentLink contentlink1=new ContentDocumentLink();
        contentlink1.LinkedEntityId=don1.id;
        contentlink1.contentdocumentid=[select contentdocumentid from contentversion where id =: content2.id].contentdocumentid;
        contentlink1.ShareType = 'I';
        contentlink1.Visibility = 'AllUsers'; 
        
        
        insert contentlink1;    
       
       
       
       
       
          don1.Validation_Charg_Client_le__c='Dossier Complet';
       update don1;
       	don1.D_cisionDL__c='Accord';
       don1.DOSSIER_COMPLET__c='Oui';
      don1.Statut__c='Accord';
       
        don1.D_cisiondirection__c='Accord' ;
        //don1.Note_de_D_pense__c=ND.id;   
       update don1;
        Set <Id> donIds = new Set <Id>();
   donIds.add(don1.Note_de_D_pense__c);
       
      for(ND__c notedepense:[SELECT Id,Name,Count_Don__c,(Select Id from Dons__r) from ND__c where Id IN: donIds]){
    ND__c NDobj = new ND__c ();
    NDobj.Id = notedepense.Id;
    NDobj.Count_Don__c = notedepense.Dons__r.size();
    lstNDToUpdate.add(NDobj);
} 
       
       
       
       
   
       Test.startTest();
       Database.SaveResult[]   result = Database.update(lstNDToUpdate, false);
        Test.stopTest(); 
     
for (Database.saveResult li:  result) {
    if (li.isSuccess()) {

        // Operation was successful, so get the ID of the record that was processed

        System.debug('Successfully inserted don. don ID: ' + li.getId());

    }
    

    else {

        // Operation failed, so get all errors               

        for(Database.Error err : li.getErrors()) {

            System.debug('The following error has occurred.');                   

            System.debug(err.getStatusCode() + ': ' + err.getMessage());

            System.debug('Account fields that affected this error: ' + err.getFields());

        }

    }

}  
      
    
    
}
    
    
}