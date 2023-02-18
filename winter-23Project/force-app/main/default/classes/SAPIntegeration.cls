public class SAPIntegeration {

    @AuraEnabled
    public static void makeHTTPCallout(String recordId){
        Lead ld = [SELECT Country From Lead WHERE Id =: recordId LIMIT 1];
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('http://sapintegeration-tmrz.us-e2.cloudhub.io/getdetails');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        // Set the body as a JSON object
        
        String jsonBody = '{ "recordId":"'+ recordId +'", "CountryName":"'+ ld.Country +'"}';
        request.setBody(jsonBody);
        HttpResponse response = http.send(request);
        // Parse the JSON response
        System.debug(response.getBody());
        if(response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
        }
    }
}