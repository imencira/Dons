@isTest
public class Test_donListExt {

  @testSetup static void setup() {
    TestHelper.delegationTest();
    TestHelper.organisateur();
  }

    public static testMethod void testMyController() {
        
        // create a list
        List <Donprotocolairesiege__c> List_Dons = new List<Donprotocolairesiege__c>();
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
        don1.Adresse__c='First Test Don' ;
        List_Dons.add(don1);
        
        Donprotocolairesiege__c don2 = new Donprotocolairesiege__c(Type_Don__c='Appréciation du siège', 
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
        don2.Adresse__c='Second Test Don' ;
        List_Dons.add(don2);
        
        insert List_Dons;
        
        Test.startTest();
        Test.setCurrentPage(Page.GenerateDocumentsCA);
        ApexPages.StandardSetController stdSetController = new ApexPages.StandardSetController(List_Dons);
        stdSetController.setSelected(List_Dons);
        
        donListExt ext = new donListExt(stdSetController);
        ext.init();
        
        Test.stopTest();
    }
}