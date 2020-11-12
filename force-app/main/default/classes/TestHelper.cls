@isTest
public class TestHelper {

@isTest public static void delegationTest() {
	Direction_R_gionale__c dr = new Direction_R_gionale__c();
	dr.Code_UO__c = 'C0407';
	dr.Email__c = 'dr.nidf@sacem.fr';
	dr.Name = 'DR ILE de France';
	insert dr;

	D_l_gation__c delegation = new D_l_gation__c();
	delegation.Code_UO__c = 'C040701';
	delegation.DR__c = dr.id;
	delegation.Email__c = 'dl.paris@sacem.fr';
	delegation.Name = 'Direction Territoriale Paris';
	insert delegation;
}

@isTest public static void organisateur() {
	Organisateur__c org =new Organisateur__c(   Name='UNICEF', Adresse__c='1 terrasse Bellini',CP__c='92800', Pays__c='France',Ville__c='Puteaux', refclient__c='12345678');
	insert org;
}

}
