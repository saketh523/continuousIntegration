public class CaseRequestControllerForSalesforceSpt {
    public List<homecom__Case_Product__c> selectedCaseProducts;
    public String caseId;
    public String reqToSend;  
    
    public CaseRequestControllerForSalesforceSpt(Apexpages.StandardController stdCon){
        caseId = stdCon.getId();
    }
    
    public CaseRequestControllerForSalesforceSpt(String caseId, List<homecom__Case_Product__c> selectedCaseProducts){
        this.caseId = caseId;
        this.selectedCaseProducts = selectedCaseProducts;
    }
    
    public CaseRequestControllerForSalesforceSpt(Apexpages.StandardSetController stdSetCon){
        caseId = ApexPages.currentPage().getParameters().get('id');
        selectedCaseProducts = (List<homecom__Case_Product__c>)stdSetCon.getSelected();
    }
    
    
    public PageReference processSelectedCaseProducts(){
        Pagereference pageRef = null;
        if(selectedCaseProducts!= null && !selectedCaseProducts.isEmpty() && caseId!=null){
            
                Case subCase = createSubCase(caseId);
                insert subCase;
                List<Case_Product__c> subCaseProducts = createSubCaseProducts(subCase.Id, selectedCaseProducts);
                insert subCaseProducts;
               // pageRef = new PageReference(Url.getSalesforceBaseUrl().toExternalForm()+'/'+subCase.Id+'?vfRetURLInSFX='+Url.getSalesforceBaseUrl().toExternalForm()+'/'+subCase.Id);
                pageRef = new PageReference('/'+subCase.Id);
            
        
        }
        pageRef.setRedirect(true);
        return pageRef;
    }
    
    
       private Case createSubCase(String caseId){
        Case subCase = null;
        for(Case parentCase : [SELECT Id, OwnerId, Subject, ContactId, AccountId, Origin, Description FROM Case WHERE Id =:caseId]){
            //subCase = parentCase.clone(false,false,false,false);  
            subCase = new Case();
            
            subCase.OwnerId = parentCase.OwnerId;
            subCase.Subject = parentCase.Subject;
            subCase.ContactId = parentCase.ContactId;
            subCase.AccountId = parentCase.AccountId;
            subCase.Origin = parentCase.Origin;                   
            subCase.ParentId = parentCase.Id;
            subCase.Description = parentCase.Description;
            subCase.Status = 'Working';
        }
        return subCase;
    }
    
    private List<homecom__Case_Product__c> createSubCaseProducts(String subCaseId, List<homecom__Case_Product__c> parentCaseProducts){
        List<homecom__Case_Product__c> subCaseProducts = new List<homecom__Case_Product__c>();
        for(homecom__Case_Product__c parentCaseProduct : [SELECT Id,Name FROM homecom__Case_Product__c WHERE Id IN :parentCaseProducts]){
            homecom__Case_Product__c subCaseProduct = parentCaseProduct.clone(true);    
        }
        return subCaseProducts;
    }   
    
 
}