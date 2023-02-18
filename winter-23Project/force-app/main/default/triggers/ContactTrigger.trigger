//TRIGGER:
//Properties:
//trigger.New  --> List<Record> on which there is change happens.
//trigger.New -- List<Contact>
//Automation - Custom Automation.
trigger ContactTrigger on Contact (before insert) {
    //before: Self record ke changes.
    //before: Validation.
    /*
     * When contact inserted, then If email is blank then, Email = LastName@gmail.com

    for(Contact contObj :trigger.New){
        System.debug('FirstName: ' + contObj.FirstName);
        //if(contObj.Email == NULL){
        if(STRING.ISBLANK(contObj.Email)){
            contObj.Email = contObj.LastName + '@gmail.com';
        }
    }
	*/
    Set<String> accountIds = new Set<String>();
    for(Contact contObj :trigger.New){
        System.debug('ACC TYPE: ' + contObj.Account.Type);
        System.debug('ACC TYPE: ' + contObj.AccountId);
        if(contObj.AccountId != NULL){
            accountIds.add(contObj.AccountId);
        }
    }
    
    List<Account> accountList = [SELECT Id, Name, Type FROM Account WHERE Id IN :accountIds];
    Map<Id, Account> accountByIdMap = new Map<Id, Account>(accountList);
    
    for(Contact contObj :trigger.New){
        if(accountByIdMap.containsKey(contObj.AccountId)){
            String type = accountByIdMap.get(contObj.AccountId).Type;
            if(type == 'Prospect'){
                if(STRING.ISBLANK(contObj.LeadSource)){
                    contObj.LeadSource.addError('Lead Source Must Have a Value.');
                }
            }
        }
    }
}