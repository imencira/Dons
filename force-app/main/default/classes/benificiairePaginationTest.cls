@isTest

public class benificiairePaginationTest {

@testSetup static void setup() {
    TestHelper.delegationTest();
    TestHelper.organisateur();
}

@isTest public static void  testsomme() {
	benificiairePagination BP = new benificiairePagination();
	Decimal s = BP.getSomme();
	System.debug(s);
}

@isTest public static void testsommeprotocolaire() {
	benificiairePagination BP = new benificiairePagination();
	Decimal s = BP.getSommeprotocolaire();
	System.debug(s);
}

@isTest public static void testbenipro() {
	benificiairePagination BP = new benificiairePagination();
	List<B_n_ficiaire__c> s = BP.getBeniPro();
	System.debug(s);
}

@isTest public static void testbenisiege() {
	benificiairePagination BP = new benificiairePagination();
	List<B_n_ficiaire__c> s = BP.getBenisiege();
	System.debug(s);
}

@isTest public static void testBenigrouped() {
	benificiairePagination BP = new benificiairePagination();
	AggregateResult[]  s = BP.getBenigrouped();
	System.debug(s);
}

@isTest public static void testgetRedir() {
	benificiairePagination BP = new benificiairePagination();
	PageReference s = BP.getRedir();
	System.debug(s);
}
@isTest public static void testgetRedirsiege() {
	benificiairePagination BP = new benificiairePagination();
	PageReference s = BP.getRedirsiege();
	System.debug(s);
}

@isTest public static void testgetstatusdirection() {
	benificiairePagination BP = new benificiairePagination();
    D_l_gation__c dl = [Select Id from D_l_gation__c where Code_UO__c = 'C040701' LIMIT 1];
    Organisateur__c organisateur = [Select Id from Organisateur__c where Name = 'UNICEF' LIMIT 1];
	Donprotocolairesiege__c don = new Donprotocolairesiege__c( Type_Don__c='Appréciation du siège', DL_DT__c = dl.Id,
	                                                           Organisateur__c = organisateur.Id,
	                                                           Type_de_Tarification__c='Au Pourcentage',
	                                                           Civilit__c='Madame',
	                                                           Montant_des_droits__c=500,
	                                                           Nom__c='xx',Pr_nom__c='yy',
	                                                           Date_concern_e__c=date.newInstance(2017, 5, 1),
	                                                           Date_de_r_glement__c=date.newInstance(2017, 3, 1),
	                                                           Pourcentage_proposition__c='30',
	                                                           Pi_ces_Jointes__c='	Etat des recettes et dépenses;	Contrat général de représentation;	Bilan détaillé manifestation;	Demande écrite de don jointe');

	insert don; System.debug(don);
	ApexPages.currentPage().getParameters().put('id', don.id);
	String s = BP.getstatusdirection();
	System.debug(s);
}

@isTest public static void testgetRenderedlettre() {
	benificiairePagination BP = new benificiairePagination();
    D_l_gation__c dl = [Select Id from D_l_gation__c where Code_UO__c = 'C040701' LIMIT 1];
    Organisateur__c organisateur = [Select Id from Organisateur__c where Name = 'UNICEF' LIMIT 1];
	Donprotocolairesiege__c don = new Donprotocolairesiege__c( Type_Don__c='Appréciation du siège', DL_DT__c = dl.Id,
	                                                           Organisateur__c = organisateur.Id,
	                                                           Type_de_Tarification__c='Au Pourcentage',
	                                                           Civilit__c='Madame',
	                                                           Montant_des_droits__c=500,
	                                                           Nom__c='xx',Pr_nom__c='yy',
	                                                           Date_concern_e__c=date.newInstance(2017, 5, 1),
	                                                           Date_de_r_glement__c=date.newInstance(2017, 3, 1),
	                                                           Nature_de_la_s_ance__c='',
	                                                           Pourcentage_proposition__c='30',
	                                                           Pi_ces_Jointes__c='	Etat des recettes et dépenses;	Contrat général de représentation;	Bilan détaillé manifestation;	Demande écrite de don jointe');
	insert don;
	ApexPages.currentPage().getParameters().put('id', don.id);
	boolean s = BP.getRenderedlettre();
	System.debug(s);
}


@isTest public static void getRenderedlettrerefus() {
	benificiairePagination BP = new benificiairePagination();
    D_l_gation__c dl = [Select Id from D_l_gation__c where Code_UO__c = 'C040701' LIMIT 1];
    Organisateur__c organisateur = [Select Id from Organisateur__c where Name = 'UNICEF' LIMIT 1];
	Donprotocolairesiege__c don = new Donprotocolairesiege__c( Type_Don__c='Appréciation du siège', DL_DT__c = dl.id,
	                                                           Organisateur__c = organisateur.id,
	                                                           Type_de_Tarification__c='Au Pourcentage',
	                                                           Civilit__c='Madame',
	                                                           Montant_des_droits__c=500,
	                                                           Nom__c='xx',Pr_nom__c='yy',
	                                                           Date_concern_e__c=date.newInstance(2017, 5, 1),
	                                                           Date_de_r_glement__c=date.newInstance(2017, 3, 1),
	                                                           Nature_de_la_s_ance__c='',
	                                                           Pourcentage_proposition__c='30',
	                                                           Pi_ces_Jointes__c='	Etat des recettes et dépenses;	Contrat général de représentation;	Bilan détaillé manifestation;	Demande écrite de don jointe');
	insert don;
	ApexPages.currentPage().getParameters().put('id', don.id);

	boolean s = BP.getRenderedlettrerefus();
	System.debug(s);
}

@isTest public static void testgetNamedelegation() {
	benificiairePagination BP = new benificiairePagination();
    Organisateur__c organisateur = [Select Id from Organisateur__c where Name = 'UNICEF' LIMIT 1];
    D_l_gation__c dl = [Select Id from D_l_gation__c where Code_UO__c = 'C040701' LIMIT 1];
	Donprotocolairesiege__c don = new Donprotocolairesiege__c( Type_Don__c='Appréciation du siège',
	                                                           Organisateur__c = organisateur.Id,
	                                                           Type_de_Tarification__c='Au Pourcentage',
	                                                           DL_DT__c = dl.Id,
	                                                           Civilit__c='Madame',
	                                                           Montant_des_droits__c=500,
	                                                           Nom__c='xx',Pr_nom__c='yy',
	                                                           Date_concern_e__c=date.newInstance(2017, 5, 1),
	                                                           Date_de_r_glement__c=date.newInstance(2017, 3, 1),
	                                                           Pourcentage_proposition__c='30',
	                                                           Pi_ces_Jointes__c='	Etat des recettes et dépenses;	Contrat général de représentation;	Bilan détaillé manifestation;	Demande écrite de don jointe');

	insert don;
	ApexPages.currentPage().getParameters().put('id', don.id);

	String s = BP.getNamedelegation();
	System.debug(s);
}

@isTest public static void testgetNameOrganisateur() {
	benificiairePagination BP = new benificiairePagination();
    D_l_gation__c dl = [Select Id from D_l_gation__c where Code_UO__c = 'C040701' LIMIT 1];
    Organisateur__c organisateur = [Select Id from Organisateur__c where Name = 'UNICEF' LIMIT 1];
	Donprotocolairesiege__c don = new Donprotocolairesiege__c( Type_Don__c='Appréciation du siège', DL_DT__c = dl.id,
	                                                           Organisateur__c= organisateur.id,
	                                                           Type_de_Tarification__c='Au Pourcentage',

	                                                           Civilit__c='Madame',
	                                                           Montant_des_droits__c=500,
	                                                           Nom__c='xx',Pr_nom__c='yy',
	                                                           Date_concern_e__c=date.newInstance(2017, 5, 1),
	                                                           Date_de_r_glement__c=date.newInstance(2017, 3, 1),
	                                                           Nature_de_la_s_ance__c='',
	                                                           Pourcentage_proposition__c='30',
	                                                           Pi_ces_Jointes__c='	Etat des recettes et dépenses;	Contrat général de représentation;	Bilan détaillé manifestation;	Demande écrite de don jointe');
	insert don;
	ApexPages.currentPage().getParameters().put('id', don.id);
	String s = BP.getNameOrganisateur();
	System.debug(s);
}


@isTest public static void testgetAdresseOrganisateur() {
	benificiairePagination BP = new benificiairePagination();
    D_l_gation__c dl = [Select Id from D_l_gation__c where Code_UO__c = 'C040701' LIMIT 1];
    Organisateur__c organisateur = [Select Id from Organisateur__c where Name = 'UNICEF' LIMIT 1];
	Donprotocolairesiege__c don = new Donprotocolairesiege__c( Type_Don__c='Appréciation du siège', DL_DT__c = dl.id,
	                                                           Organisateur__c=organisateur.id,
	                                                           Type_de_Tarification__c='Au Pourcentage',

	                                                           Civilit__c='Madame',
	                                                           Montant_des_droits__c=500,
	                                                           Nom__c='xx',Pr_nom__c='yy',
	                                                           Date_concern_e__c=date.newInstance(2017, 5, 1),
	                                                           Date_de_r_glement__c=date.newInstance(2017, 3, 1),
	                                                           Nature_de_la_s_ance__c='',
	                                                           Pourcentage_proposition__c='30',
	                                                           Pi_ces_Jointes__c='	Etat des recettes et dépenses;	Contrat général de représentation;	Bilan détaillé manifestation;	Demande écrite de don jointe');
	insert don;
	ApexPages.currentPage().getParameters().put('id', don.id);
	String s = BP.getAdresseOrganisateur();
	System.debug(s);
}


@isTest public static void testgetCPOrganisateur() {
	benificiairePagination BP = new benificiairePagination();
    D_l_gation__c dl = [Select Id from D_l_gation__c where Code_UO__c = 'C040701' LIMIT 1];
    Organisateur__c organisateur = [Select Id from Organisateur__c where Name = 'UNICEF' LIMIT 1];
	Donprotocolairesiege__c don = new Donprotocolairesiege__c( Type_Don__c='Appréciation du siège',
                                                               DL_DT__c = dl.id,
	                                                           Organisateur__c=organisateur.id,
	                                                           Type_de_Tarification__c='Au Pourcentage',
	                                                           Civilit__c='Madame',
	                                                           Montant_des_droits__c=500,
	                                                           Nom__c='xx',Pr_nom__c='yy',
	                                                           Date_concern_e__c=date.newInstance(2017, 5, 1),
	                                                           Date_de_r_glement__c=date.newInstance(2017, 3, 1),
	                                                           Nature_de_la_s_ance__c='',
	                                                           Pourcentage_proposition__c='30',
	                                                           Pi_ces_Jointes__c='	Etat des recettes et dépenses;	Contrat général de représentation;	Bilan détaillé manifestation;	Demande écrite de don jointe');
	insert don;
	ApexPages.currentPage().getParameters().put('id', don.id);
	string s = BP.getCPOrganisateur();
	System.debug(s);
}

@isTest public static void testgetVilleOrganisateur() {
	benificiairePagination BP = new benificiairePagination();
    D_l_gation__c dl = [Select Id from D_l_gation__c where Code_UO__c = 'C040701' LIMIT 1];
    Organisateur__c organisateur = [Select Id from Organisateur__c where Name = 'UNICEF' LIMIT 1];
	Donprotocolairesiege__c don = new Donprotocolairesiege__c( Type_Don__c='Appréciation du siège',
                                                               DL_DT__c = dl.id,
	                                                           Organisateur__c=organisateur.id,
	                                                           Type_de_Tarification__c='Au Pourcentage',
	                                                           Civilit__c='Madame',
	                                                           Montant_des_droits__c=500,
	                                                           Nom__c='xx',Pr_nom__c='yy',
	                                                           Date_concern_e__c=date.newInstance(2017, 5, 1),
	                                                           Date_de_r_glement__c=date.newInstance(2017, 3, 1),
	                                                           Nature_de_la_s_ance__c='',
	                                                           Pourcentage_proposition__c='30',
	                                                           Pi_ces_Jointes__c='	Etat des recettes et dépenses;	Contrat général de représentation;	Bilan détaillé manifestation;	Demande écrite de don jointe');
	insert don;
	ApexPages.currentPage().getParameters().put('id', don.id);
	String s = BP.getVilleOrganisateur();
	System.debug(s);
}

@isTest public static void testgetNameBeni() {
	benificiairePagination BP = new benificiairePagination();

	String s = BP.getNameBeni();
	System.debug(s);
}

@isTest public static void testgetspaceOrganisateur() {
	benificiairePagination BP = new benificiairePagination();
    D_l_gation__c dl = [Select Id from D_l_gation__c where Code_UO__c = 'C040701' LIMIT 1];
    Organisateur__c organisateur = [Select Id from Organisateur__c where Name = 'UNICEF' LIMIT 1];
	Donprotocolairesiege__c don = new Donprotocolairesiege__c( Type_Don__c='Appréciation du siège',
                                                               DL_DT__c = dl.id,
	                                                           Organisateur__c=organisateur.id,
	                                                           Type_de_Tarification__c='Au Pourcentage',
	                                                           Civilit__c='Madame',
	                                                           Montant_des_droits__c=500,
	                                                           Nom__c='xx',Pr_nom__c='yy',
	                                                           Date_concern_e__c=date.newInstance(2017, 5, 1),
	                                                           Date_de_r_glement__c=date.newInstance(2017, 3, 1),
	                                                           Nature_de_la_s_ance__c='',
	                                                           Pourcentage_proposition__c='30',
	                                                           Pi_ces_Jointes__c='	Etat des recettes et dépenses;	Contrat général de représentation;	Bilan détaillé manifestation;	Demande écrite de don jointe');
	insert don;
	ApexPages.currentPage().getParameters().put('id', don.id);
	String s = BP.getspaceOrganisateur();
	System.debug(s);
}


@isTest public static void testRecordsOrg () {
	benificiairePagination BP = new benificiairePagination();

	List<Organisateur__c>  s = BP.RecordsOrg;
	System.debug(s);
}

@isTest public static void testRecordsDL  () {
	benificiairePagination BP = new benificiairePagination();

	List<D_l_gation__c>  s = BP.RecordsDL;
	System.debug(s);
}

@isTest public static void testRecords  () {
	benificiairePagination BP = new benificiairePagination();

	List<Donprotocolairesiege__c>  s = BP.Records;
	System.debug(s);
}


@isTest public static void testrender  () {
	benificiairePagination BP = new benificiairePagination();

   String s = BP.render  ;
        System.debug(s);
    }  
    
    
    
 
    
      @isTest public static void testNDBeniPro() {
        
           benificiairePagination BP = new benificiairePagination(); 
         

        BP.NDBeniPro();
        List<Donprotocolairesiege__c> donvalidedirection=[Select   id,   Name,Validation_Note_de_D_pense__c from Donprotocolairesiege__c where getcloture__c='En attente' and getdirectionstatus__c='Accord' and Get_type__c='Protocolaire' and Validation_Note_de_D_pense__c !='Oui'];
   
             for(Donprotocolairesiege__c obj : donvalidedirection)
        {
            obj.Validation_Note_de_D_pense__c = 'Oui';
             
        }
    if(donvalidedirection.size() > 0)
        {
            update donvalidedirection;//this seems to just update the list. How do I actually update the custom object?
        }
        


    }
    
    
    
      @isTest public static void testNDBeniSiege() {
        
           benificiairePagination BP = new benificiairePagination(); 
         

        BP.NDBeniSiege();
        List<Donprotocolairesiege__c> donvalidedirection=[Select   id,   Name,Validation_Note_de_D_pense__c from Donprotocolairesiege__c where getcloture__c='En attente' and getdirectionstatus__c='Accord' and Get_type__c='Appréciation du siège' and Validation_Note_de_D_pense__c !='Oui'];
   
             for(Donprotocolairesiege__c obj : donvalidedirection)
        {
            obj.Validation_Note_de_D_pense__c = 'Oui';
             
        }
    if(donvalidedirection.size() > 0)
        {
            update donvalidedirection;//this seems to just update the list. How do I actually update the custom object?
        }
        


    }
    
    
}