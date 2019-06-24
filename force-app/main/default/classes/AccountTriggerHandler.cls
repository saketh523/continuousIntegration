public class AccountTriggerHandler {

    public List<Account> newRecords { get; set; }
    public Map<Id, Account> oldRecordMap { get; set; }

    public AccountTriggerHandler(
        List<Account> newRecords, Map<Id, Account> oldRecordMap) {
        this.newRecords = newRecords;
        this.oldRecordMap = oldRecordMap;
    }
    /**
     * Perform actions in the `before insert` context
     */
    public void beforeInsert() {  
        
        system.debug('you are here before insert ');
    }
    /**
     * Perform actions in the `before update` context
     */
    public void beforeUpdate() {
        this.retainOldTeamMemberOnOwnerChange();     
    }
    public void afterUpdate() {
       // this.retainOldTeamMemberOnOwnerChange(); 
    }

   public void afterInsert() {
          system.debug('you are here after insert ');
   }

    public void retainOldTeamMemberOnOwnerChange(){
        List<AccountTeamMember> accTeamMembers = new List<AccountTeamMember>();
        
        Map<Id,Account> m=new Map<Id,Account>([SELECT Id, 
                                                       (SELECT Id, TeamMemberRole,UserId,AccountId FROM AccountTeamMembers)
                                                        FROM Account WHERE Id IN :trigger.newMap.keyset()]);
        for (Account acc : (List<Account>)trigger.new) {
            String newId = acc.OwnerId; 
            String oldId = this.oldRecordMap.get(acc.Id).OwnerId;
            if (newId != oldId)
            { 
                for (AccountTeamMember atm : m.get(acc.id).AccountTeamMembers) {
                    system.debug('what is in atm' +atm);
                    AccountTeamMember aMem = new AccountTeamMember();
                    aMem.AccountId = acc.Id;
                    aMem.UserId = atm.UserId;
                    aMem.TeamMemberRole = atm.TeamMemberRole;
                    accTeamMembers.add(aMem);
                }
    		}
            System.debug('------>accTeamMembers' +accTeamMembers);
            Database.SaveResult[] srList = Database.insert(accTeamMembers, false);
            List<AccountTeammember> a = [SELECT ID, USERID,AccountId,TEAMMEMBERROLE FROM AccountTeammember where accountid =: acc.Id];
            System.debug('------>CHECKING' +a);
               
            // Iterate through each returned result
            for (Database.SaveResult sr : srList) {
                if (sr.isSuccess()) {
                    // Operation was successful, so get the ID of the record that was processed
                    System.debug('Successfully inserted Account Team Member: ' + sr.getId());
                }
                else {
                    // Operation failed, so get all errors                
                    for(Database.Error err : sr.getErrors()) {
                        System.debug('The following error has occurred.');                    
                        System.debug(err.getStatusCode() + ': ' + err.getMessage());
                        System.debug('Team Member fields that affected this error: ' + err.getFields());
                    }
                }
            }
    	}
    }
}