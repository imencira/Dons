trigger Validation_piecejointe on Donprotocolairesiege__c (before update) {



    System.debug(' Je suis la accord 11111');
    integer nb_pj=100;
    Integer numAtts;
    for (Donprotocolairesiege__c d : Trigger.new) {


                if (String.isNotBlank(d.Pi_ces_Jointes__c) ){

                    List<String> pj = d.Pi_ces_Jointes__c.split(';');

                    nb_pj = pj.size();

                }
        else
            nb_pj=0;
        

             
  }
                    
    
    
    for(Donprotocolairesiege__c d:Trigger.New) {

        if(d.Validation_Charg_Client_le__c == 'Dossier Complet' && d.Type_Don__c=='Appréciation du siège' && d.Type_de_Tarification__c =='Au Forfait') {

             System.debug(' Je suis la accord');

           List<ContentDocumentLink  > a = new List<ContentDocumentLink  >();

            try {

               a = [Select Id, ContentDocumentId,LinkedEntityId from ContentDocumentLink   where LinkedEntityId =:d.Id];

            }

            catch(Exception e) {

               a = null;

            }

            if (a.size() < 1)
            {


               d.addError('Veuillez vérifier les pièces jointes avant de valider, le nombre minimum de PJ est: 1');
             }
            else
                                   System.debug(a.size());
    }
        
        
   if(d.Validation_Charg_Client_le__c == 'Dossier Complet' && d.Type_Don__c=='Appréciation du siège' && d.Type_de_Tarification__c =='Au Pourcentage') {

             System.debug(' Je suis la accord');

           List<ContentDocumentLink  > a = new List<ContentDocumentLink  >();

            try {

               a = [Select Id, ContentDocumentId,LinkedEntityId from ContentDocumentLink   where LinkedEntityId =:d.Id];

            }

            catch(Exception e) {

               a = null;

            }

            if (a.size() < 2)
            {


               d.addError('Veuillez vérifier les pièces jointes avant de valider, le nombre minimum de PJ est: 2');
             }
            else
                                   System.debug(a.size());
    }
            
        
        
        
        
        
      if(d.Validation_Charg_Client_le__c == 'Dossier Complet' && d.Type_Don__c=='Protocolaire' ) {

             System.debug(' Je suis la accord');

           List<ContentDocumentLink  > a = new List<ContentDocumentLink  >();

            try {

               a = [Select Id, ContentDocumentId,LinkedEntityId from ContentDocumentLink   where LinkedEntityId =:d.Id];

            }

            catch(Exception e) {

               a = null;

            }

            if (a.size() < nb_pj)
            {


               d.addError('Veuillez vérifier les pièces jointes avant de valider, le nombre minimum de PJ est: '+nb_pj);
             }
            else
                                   System.debug(a.size());
    }
        
        
   
        
        
        
        
        
        
        
        if(d.Statut__c=='Accord'   && d.Profile_Cr_ation__c == 'Pilotage réseau' && d.Type_Don__c=='Appréciation du siège' && d.Type_de_Tarification__c =='Au Forfait') {

             System.debug(' Je suis la accord');

           List<ContentDocumentLink  > a = new List<ContentDocumentLink  >();

            try {

               a = [Select Id, ContentDocumentId,LinkedEntityId from ContentDocumentLink   where LinkedEntityId =:d.Id];

            }

            catch(Exception e) {

               a = null;

            }

            if (a.size() < 1)
            {


               d.addError('Veuillez vérifier les pièces jointes avant de valider, le nombre minimum de PJ est: 1');
             }
            else
                                   System.debug(a.size());
    }
        
        
   if(d.Statut__c=='Accord' && d.Profile_Cr_ation__c == 'Pilotage réseau' && d.Type_Don__c=='Appréciation du siège' && d.Type_de_Tarification__c =='Au Pourcentage') {

             System.debug(' Je suis la accord');

           List<ContentDocumentLink  > a = new List<ContentDocumentLink  >();

            try {

               a = [Select Id, ContentDocumentId,LinkedEntityId from ContentDocumentLink   where LinkedEntityId =:d.Id];

            }

            catch(Exception e) {

               a = null;

            }

            if (a.size() < 2)
            {


               d.addError('Veuillez vérifier les pièces jointes avant de valider, le nombre minimum de PJ est: 2');
             }
            else
                                   System.debug(a.size());
    }
            
        
        
        
        
        
      if(d.Statut__c=='Accord' && d.Profile_Cr_ation__c == 'Pilotage réseau' && d.Type_Don__c=='Protocolaire' ) {

             System.debug(' Je suis la accord');

           List<ContentDocumentLink  > a = new List<ContentDocumentLink  >();

            try {

               a = [Select Id, ContentDocumentId,LinkedEntityId from ContentDocumentLink   where LinkedEntityId =:d.Id];

            }

            catch(Exception e) {

               a = null;

            }

            if (a.size() < nb_pj)
            {


               d.addError('Veuillez vérifier les pièces jointes avant de valider, le nombre minimum de PJ est: '+nb_pj);
             }
            else
                                   System.debug(a.size());
    }
        
          
        
        
        
        
        
        
        
        
        

    }

}