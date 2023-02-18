public class SObjectController {
    //sobject: Salesforce's Object are know an Sobject.
    //All standard and Custom, Sobject.
    //DML: insert,Update, and Delete.
    public static void sobjectInsertLearn(){
        List<Account> accountList = new List<Account>();
        Account accObj = new Account();
        accObj.Name = 'New Account 1';
        accObj.AccountNumber = 'ABCD124';
        accObj.Active__c = 'Yes';
        //INSERT accObj;
        accountList.add(accObj);
        
        Account accObj2 = new Account();
        accObj2.Name = 'New Account 2';
        accObj2.AccountNumber = 'ABCD124';
        accObj2.Active__c = 'No';
        accountList.add(accObj2);
        
        INSERT accountList;
    }
    
    public static void sobjectUpdateLearn(){
        String accountName = 'New Account 2';
        List<Account> accountList = [SELECT Id, Name FROM Account WHERE Name = :accountName];
        
        List<Account> accountToUpdate = new List<Account>();
        for(Account accObj: accountList){
            //accObj.BillingCountry = 'IN';
            if(accObj.BillingCountry != 'IN'){
                accObj.BillingCountry = 'INN';
                accountToUpdate.add(accObj);
            }
        }
        
        if(accountToUpdate.size() > 0){
            UPDATE accountList;
        }
        
    }
    
    /*****
     * Assignment:
     * #1: Create a method that will create a primary contact for an account that does not have any contact. 
     * with the following detials
     * split Account Name with space, 1st part first name, rest part Last Name.
     * with name does not contains any space, then put in the last name.
     * Phone == phone
     * 
     * 
     * #2:
     * Create a method that will accept a data range and this will search for all opportunity
     * that are closed won, then we have to make all other opportunity to close lost
     * that are related to that same account.
     * 
     * ****/
}