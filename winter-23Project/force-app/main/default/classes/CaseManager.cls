@RestResource(urlMapping='/track/*')
global with sharing class CaseManager {
    @HttpGet
    global static String getCaseById() {
        RestRequest request = RestContext.request;
        return ''+request;
    }    
}