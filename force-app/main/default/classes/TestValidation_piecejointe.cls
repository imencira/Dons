@isTest

public class TestValidation_piecejointe {
    
@testSetup static void setup() {
    TestHelper.delegationTest();
    TestHelper.organisateur();
}

@isTest public static void testDonPJ  () {
     integer  nb =3;
     D_l_gation__c dl = [Select Id from D_l_gation__c where Code_UO__c = 'C040701' LIMIT 1];
     Organisateur__c organisateur = [Select Id from Organisateur__c where Name = 'UNICEF' LIMIT 1];
          
    Donprotocolairesiege__c don = new Donprotocolairesiege__c( Type_Don__c='Appréciation du siège', 	DL_DT__c=dl.id,
              Organisateur__c=organisateur.id,
               Type_de_Tarification__c='Au Pourcentage',
              Civilit__c='Madame',
           Montant_des_droits__c=500, 
            Nom__c='xx',Pr_nom__c='yy', 
            Date_concern_e__c=date.newInstance(2017, 5, 1),
           Date_de_r_glement__c=date.newInstance(2017, 3, 1),
           Nature_de_la_s_ance__c=''  ,
         Pourcentage_proposition__c='30',
          Pi_ces_Jointes__c='	Etat des recettes et dépenses;	Contrat général de représentation;	Bilan détaillé manifestation;	Demande écrite de don jointe');
    insert don ;
    
              
        
   don.Validation_Charg_Client_le__c='Dossier Complet';
    
    

    }    

}