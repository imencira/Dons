public with sharing class donListExt {
    
    private final Donprotocolairesiege__c don;
    ApexPages.StandardSetController setCon;
    
    public PageReference init() {
        
        PageReference p = null;
        Integer index = 0;
        String queryString = '';
        
        for ( Donprotocolairesiege__c o : (Donprotocolairesiege__c[])setCon.getSelected() )
        {
            if(index > 0){
                queryString += ',';
            }
            
            index++;
            queryString += String.valueOf(o.Id);
        }
        
        String redirectUrl = '/apex/doco4cpq__VF18_MassGenerate?ids=' + queryString;
        System.debug('redirectUrl = ' + redirectUrl);
        
        if(index > 0){
            p = new PageReference(redirectUrl);
        }  
        
        return p;
        
    }
    
    public donListExt(ApexPages.StandardSetController controller) 
    {
        this.setCon = controller;
        this.don = (Donprotocolairesiege__c)controller.getRecord();
    }
    
}