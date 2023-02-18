public with sharing class WireAnnotationLWCApexController {
    
    @AuraEnabled(cacheable = true)
    public static List<Contact> getContacts(String searchKey){
        String searchKeyStr = '%' + searchKey + '%';
        //SOQL Query.
        return [
            SELECT Id, Name, FirstName, LastName, Phone, Email, Status__c
            FROM Contact
            WHERE LastName LIKE :searchKeyStr
        ];
    }


    @AuraEnabled
    public static void updateContact(String contactId, String status){
        try {
            Contact contObj = new Contact();
            contObj.Id = contactId;
            contObj.Status__c = status;
            UPDATE contObj;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}