public with sharing class ParentControllerForCustomEvent {
    
    @AuraEnabled(cacheable = true)
    public static List<Object> getDogImages(String breedName){
        try {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://dog.ceo/api/breed/'+breedName+'/images/random/10');
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            // If the request is successful, parse the JSON response.
            if(response.getStatusCode() == 200) {
                // Deserializes the JSON string into collections of primitive data types.
                Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                
                // Cast the values in the 'message' key as a list
                List<Object> messageList = (List<Object>) results.get('message');
                
                return messageList;
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return NULL;
    }
}