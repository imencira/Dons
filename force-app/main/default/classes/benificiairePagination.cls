public with sharing class benificiairePagination {

    public benificiairePagination(ApexPages.StandardController controller) {
Apexpages.currentPage().getHeaders().put('content-disposition', 'inline; filename=Lettre Organisateur.pdf'); 

    }


    public benificiairePagination(ApexPages.StandardSetController controller) {

    }
  public Donprotocolairesiege__c currentDon {get;set;}   
public Donprotocolairesiege__c Don{get;set;}   

public String Namedl {get;set;}
public String libelleor {get;set;}


public String Nameor {get;set;}
public String adresse{get;set;}
public string cp {get;set;}
public String ville {get;set;}
public String benificiaire {get;set;}
public String Pays {get;set;}
public String space{get;set;}

public  String decision{get;set;}
public  String civilite{get;set;}

public  String  headerdata{get;set;}
    public string urlvalue{get;set;}
    public string url{get;set;}

    public benificiairePagination () {

    }
         public Decimal Montant { get; private set; }
         public Decimal Montantdroit { get; private set; }

 
 public String currentRecordId {get;set;}

  public String render{get;set;}

  public Decimal getSomme() {
        AggregateResult[] results = [select SUM(Montant_don_HT__c) from   B_n_ficiaire__c where getclotureBen__c ='En attente' and Statut_Direction_R_seau__c ='Accord'and Type_Don__c='Appréciation du siège' and getValidationnddon__c !='Oui'];
         for (AggregateResult ar : results )  {

        Montant =(Decimal) ar.get('expr0');

    } 
        return montant ;

    }
    
    
    
     public Decimal getSommedroitsiege() {
        AggregateResult[] results = [select SUM(Montant_Perception_HT__c) from   B_n_ficiaire__c where getclotureBen__c ='En attente' and Statut_Direction_R_seau__c ='Accord'and Type_Don__c='Appréciation du siège' and getValidationnddon__c !='Oui'];
         for (AggregateResult ar : results )  {

        Montantdroit =(Decimal) ar.get('expr0');

    } 
        return Montantdroit;

    }
    
    
    
    
    
     public Decimal getSommeprotocolaire() {
        AggregateResult[] results = [select SUM(Montant_don_HT__c) from   B_n_ficiaire__c where getclotureBen__c ='En attente' and Statut_Direction_R_seau__c ='Accord' and Type_Don__c='Protocolaire' and getValidationnddon__c !='Oui'];
         for (AggregateResult ar : results )  {

        Montant =(Decimal) ar.get('expr0');

    } 
        return montant ;

    }
    
    public Decimal getSommedroitprotocolaire() {
        AggregateResult[] results = [select SUM(Montant_Perception_HT__c) from   B_n_ficiaire__c where getclotureBen__c ='En attente' and Statut_Direction_R_seau__c ='Accord' and Type_Don__c='Protocolaire' and getValidationnddon__c !='Oui'];
         for (AggregateResult ar : results )  {

        Montantdroit =(Decimal) ar.get('expr0');

    } 
        return montantdroit ;

    }
    
    
      public List<B_n_ficiaire__c> getBeniPro() {
     
      currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');
     List<B_n_ficiaire__c> ben=[Select    Name_b_n_ficiaire__c,Montant_Perception_HT__c,Montant_don_HT__c ,DL__c, Part_du_Don__c,MontantPP__c   ,  getValidationnddon__c from B_n_ficiaire__c where getclotureBen__c ='En attente' and Statut_Direction_R_seau__c ='Accord' and Type_Don__c='Protocolaire' and     getValidationnddon__c !='Oui'];
 
     return ben ;
     }
       
    
      public List<B_n_ficiaire__c> getBenisiege() {
     
      currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');
     List<B_n_ficiaire__c> ben=[Select Name_b_n_ficiaire__c,Montant_Perception_HT__c,Part_du_Don__c,MontantPP__c    ,Montant_don_HT__c ,DL__c,  getValidationnddon__c from B_n_ficiaire__c where getclotureBen__c ='En attente' and Statut_Direction_R_seau__c ='Accord' and Type_Don__c='Appréciation du siège' and    getValidationnddon__c !='Oui'];
    
     return ben ;
     }
    
    
    
   

     public void NDBeniPro() {
     
      currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');
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
     

 public void NDBeniSiege() {
     
      currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');
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
     
     
      public AggregateResult[]  getBenigrouped() {
     
      currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');
     AggregateResult[]  ben=[Select   Name_Ben__c Name ,SUM(Montant_Perception_HT__c) MontantDroits,SUM(Montant_don_HT__c) Montantdon from B_n_ficiaire__c where getclotureBen__c ='En attente' and Statut_Direction_R_seau__c ='Accord' group by    Name_Ben__c];
     return ben ;
     }
     
    
    public PageReference getRedir() {
 if(render==null){
            render='pdf';
    }
        PageReference newPage;

            newPage = Page.NDProtocolaire;
            return newPage.setRedirect(true);
        

    }
    
    
      public PageReference getRedirsiege() {
 if(render==null){
            render='pdf';
    }
        PageReference newPage;

            newPage = Page.NDAppreciationdusiege;
            return newPage.setRedirect(true);
        

    }
    
    
     public String getstatusdirection() {
        currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');

   

             Donprotocolairesiege__c  projSheet = new Donprotocolairesiege__c ();
              projSheet  =[Select id, getdirectionstatus__c from Donprotocolairesiege__c where id =: currentRecordId   ];
            decision= projSheet.getdirectionstatus__c;
                System.debug('***** ' + decision);

    return decision;
} 
     
    public boolean getRenderedlettre()

{
String d =getstatusdirection();

Boolean render = (d=='Accord' );

 

return render;

}

   
    public boolean getRenderedlettrerefus()

{
String d =getstatusdirection();

Boolean render = (d=='Refus' );

 

return render;

}
   
    
    
    public List<Donprotocolairesiege__c> Records
{

    get
    {
        try
        {
                currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');

            Records = new List<Donprotocolairesiege__c>();
            Records = [SELECT id, Name,Libelle__c, Adapt_name_resp__c,Adapt_nb_seance__c   ,Adapt_seance__c,Montantdudon__c,Type_Don__c,Civilit__c,Nom__c,Pr_nom__c,DL_DT__c,Date_Cr_ation_Don__c,D_cisiondirection__c,Nature_de_la_s_ance__c,   Lieu__c,Date_concern_e__c,Adresse__c,CP__c,Ville__c,Montant_du_Don_HT__c FROM Donprotocolairesiege__c where id =: currentRecordId ]; 
      civilite=Records[0].Civilit__c;
        } 
        catch (Exception ex)
        {
              Records = null;
        }
       
        return Records;
    }
    private set;
}








   public String getNamedelegation() {
        currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');

   

             Donprotocolairesiege__c projSheet = new Donprotocolairesiege__c ();
              projSheet  =[Select id, Name, DL_DT__c from Donprotocolairesiege__c where id =: currentRecordId ];
               RecordsDL= new List<D_l_gation__c >();

   
      RecordsDL=[SELECT id, Name FROM D_l_gation__c where id =: projSheet.DL_DT__c ]; 
        Namedl =RecordsDL[0].Name;
    return Namedl ;
}


 public String getNameOrganisateur() {
        currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');

   

             Donprotocolairesiege__c projSheet = new Donprotocolairesiege__c ();
              projSheet  =[Select id, Name, Organisateur__c from Donprotocolairesiege__c where id =: currentRecordId ];
               RecordsOrg= new List<Organisateur__c>();

   
      RecordsOrg=[SELECT id, Name FROM Organisateur__c where id =: projSheet.Organisateur__c]; 
        Nameor =RecordsOrg[0].Name;
    return Nameor ;
}

 public String getAdresseOrganisateur() {
        currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');

   

             Donprotocolairesiege__c projSheet = new Donprotocolairesiege__c ();
              projSheet  =[Select id, Name, Organisateur__c from Donprotocolairesiege__c where id =: currentRecordId ];
               RecordsOrg= new List<Organisateur__c>();

   
      RecordsOrg=[SELECT id, Adresse__c FROM Organisateur__c where id =: projSheet.Organisateur__c]; 
        adresse =RecordsOrg[0].Adresse__c;
    return adresse ;
}

 public string getCPOrganisateur() {
        currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');

   

             Donprotocolairesiege__c projSheet = new Donprotocolairesiege__c ();
              projSheet  =[Select id, Name, Organisateur__c from Donprotocolairesiege__c where id =: currentRecordId ];
               RecordsOrg= new List<Organisateur__c>();

   
      RecordsOrg=[SELECT id, CP__c FROM Organisateur__c where id =: projSheet.Organisateur__c]; 
        CP=RecordsOrg[0].CP__c ;
    return CP;
}
    







 public String getVilleOrganisateur() {
        currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');

   

             Donprotocolairesiege__c projSheet = new Donprotocolairesiege__c ();
              projSheet  =[Select id, Name, Organisateur__c from Donprotocolairesiege__c where id =: currentRecordId ];
               RecordsOrg= new List<Organisateur__c>();

   
      RecordsOrg=[SELECT id,    Ville__c FROM Organisateur__c where id =: projSheet.Organisateur__c]; 
        ville=RecordsOrg[0].Ville__c;
    return ville;
}


 /*public String getNameBeni() {
        currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');

   

             Donprotocolairesiege__c projSheet = new Donprotocolairesiege__c ();
              projSheet  =[Select id, Name,  B_n_ficiaire__c from Donprotocolairesiege__c where id =: currentRecordId ];
               RecordsBEN= new List<B_n_ficiaire__c>();

   
      RecordsBEN=[SELECT id,    Name FROM B_n_ficiaire__c where id =: projSheet.B_n_ficiaire__c ]; 
        benificiaire =RecordsBEN[0].Name;
    return benificiaire ;
}*/
  public String getNameBeni() {
  List<String> lstNames = new List<String>();

             currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');

List<B_n_ficiaire__c > conresults = [Select  Name_b_n_ficiaire__c from B_n_ficiaire__c  where Don__c=: currentRecordId ];

for(B_n_ficiaire__c  ac: [Select  Name_b_n_ficiaire__c from B_n_ficiaire__c  where Don__c=: currentRecordId]){
    lstNames.add(ac.Name_b_n_ficiaire__c );
}

String names = string.join(lstNames,' et de ');

return names ;
}




 public String getspaceOrganisateur() {
        currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');

   

             Donprotocolairesiege__c projSheet = new Donprotocolairesiege__c ();
              projSheet  =[Select id, Name, Organisateur__c from Donprotocolairesiege__c where id =: currentRecordId ];
               RecordsOrg= new List<Organisateur__c>();

   
      RecordsOrg=[SELECT id,    Ville__c FROM Organisateur__c where id =: projSheet.Organisateur__c]; 
        space=' ';
    return space;
}







public List<D_l_gation__c> RecordsDL {

    get
    {
        try
        {
               currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');

   

             Donprotocolairesiege__c projSheet = new Donprotocolairesiege__c ();
              projSheet  =[Select id, Name, DL_DT__c from Donprotocolairesiege__c where id =: currentRecordId ];
               RecordsDL= new List<D_l_gation__c >();

   
      RecordsDL=[SELECT id, Name FROM D_l_gation__c where id =: projSheet.DL_DT__c ]; 

        } 
        catch (Exception ex)
        {
              RecordsDL = null;
        }
        return RecordsDL ;
    }
    private set;
}


public List<Organisateur__c> RecordsOrg {

    get
    {
        try
        {
               currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');

   

             Donprotocolairesiege__c projSheet = new Donprotocolairesiege__c ();
              projSheet  =[Select id, Name, Organisateur__c from Donprotocolairesiege__c where id =: currentRecordId ];
               RecordsOrg= new List<Organisateur__c>();

   
      RecordsOrg=[SELECT id, Name,Adresse__c,CP__c,Ville__c,Pays__c FROM Organisateur__c where id =: projSheet.Organisateur__c  ]; 

        } 
        catch (Exception ex)
        {
              RecordsOrg = null;
        }
        return RecordsOrg ;
    }
    private set;
}



private Map<Integer, String> frenchDates = new Map<Integer, String>();


public String formattedDateNow {
    get {
    frenchDates.put(1, 'Janvier');
frenchDates.put(2, 'Février');
frenchDates.put(3, 'Mars');
frenchDates.put(4, 'Avril');
frenchDates.put(5, 'Mai');
frenchDates.put(6, 'Juin');
frenchDates.put(7, 'Juillet');
frenchDates.put(8, 'Aout');
frenchDates.put(9, 'Septembre');
frenchDates.put(10, 'Octobre');
frenchDates.put(11, 'Novembre');
frenchDates.put(12, 'Décembre'); 
        Datetime dateNow = Datetime.now();
        return 'Le '+ String.valueOf(dateNow.day()) +' '+ frenchDates.get(dateNow.month()) +' '+ String.valueOf(dateNow.year());
    }
    set;
}


public String formattedDateeven1Protocolaire {
    get {
    frenchDates.put(1, 'Janvier');
frenchDates.put(2, 'Février');
frenchDates.put(3, 'Mars');
frenchDates.put(4, 'Avril');
frenchDates.put(5, 'Mai');
frenchDates.put(6, 'Juin');
frenchDates.put(7, 'Juillet');
frenchDates.put(8, 'Aout');
frenchDates.put(9, 'Septembre');
frenchDates.put(10, 'Octobre');
frenchDates.put(11, 'Novembre');
frenchDates.put(12, 'Décembre');
    
            currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');
 
             List<Donprotocolairesiege__c> projSheet = new List<Donprotocolairesiege__c>();
              projSheet  =[Select id, Date_concern_e__c,v_nement_2_Date_concern_e__c,Nombre_de_s_ances__c from Donprotocolairesiege__c where id =: currentRecordId ];

   
        Decimal nbS=projSheet[0].Nombre_de_s_ances__c ;
        
    
    
        Datetime d1= projSheet[0].Date_concern_e__c ;
        Datetime d2= projSheet[0].v_nement_2_Date_concern_e__c ;
        
        if(nbS == 1 )

        return String.valueOf(d1.day()) +' '+ frenchDates.get(d1.month()) +' '+ String.valueOf(d1.year());
        else 
        return String.valueOf(d1.day()) +' '+ frenchDates.get(d1.month()) +' '+ String.valueOf(d1.year()) + ' et '+String.valueOf(d2.day()) +' '+ frenchDates.get(d2.month()) +' '+ String.valueOf(d2.year());

    }
    set;
}



public String formattedDateeven1Siege {
    get {
    frenchDates.put(1, 'Janvier');
frenchDates.put(2, 'Février');
frenchDates.put(3, 'Mars');
frenchDates.put(4, 'Avril');
frenchDates.put(5, 'Mai');
frenchDates.put(6, 'Juin');
frenchDates.put(7, 'Juillet');
frenchDates.put(8, 'Aout');
frenchDates.put(9, 'Septembre');
frenchDates.put(10, 'Octobre');
frenchDates.put(11, 'Novembre');
frenchDates.put(12, 'Décembre');
    
            currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');
 
             List<Donprotocolairesiege__c> projSheet = new List<Donprotocolairesiege__c>();
              projSheet  =[Select id, Date_concern_e__c from Donprotocolairesiege__c where id =: currentRecordId ];

   
        
    
    
        Datetime d1= projSheet[0].Date_concern_e__c ;
        return ' '+ String.valueOf(d1.day()) +' '+ frenchDates.get(d1.month()) +' '+ String.valueOf(d1.year());
    }
    set;
}



    
    }