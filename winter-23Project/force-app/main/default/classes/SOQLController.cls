public class SOQLController {
    //SOQL to get data from salesforce.
    public SOQLController(){
        /*
        List<String> studentsList = new List<String>();
        studentsList.add('Rollnumber, Name, Email, Phone, DataOfBirth');

		List<StudentRecord> studentsList = new List<StudentRecord>();
		*/
        List<Contact> contactList = new List<Contact>();
        contactList = [SELECT Name, Email, Phone 
                       FROM Contact 
                       WHERE phone != NULL 
                       ORDER By Name DESC 
                       LIMIT 10];
        
        for(Contact contObj :contactList){
            System.debug('Name: ' + contObj.name);
            System.debug('Phone: ' + contObj.phone);
        }
    }
    
    public static void SOQLwithVariable(String searchEmail){
        List<Contact> contactList = new List<Contact>();
        //String searchEmail = 'ldcruz@uog.com';
        
        contactList = [SELECT Name, Email, Phone 
                       FROM Contact 
                       WHERE email = :searchEmail
                       ORDER By Name DESC 
                       LIMIT 10];
        
        for(Contact contObj :contactList){
            System.debug('Name: ' + contObj.name);
            System.debug('Phone: ' + contObj.phone);
        }
    }
    
    
    public static void SOQLwithVariable(){
        List<Contact> contactList = new List<Contact>();
        List<String> searchEmailList = new List<String>{'ldcruz@uog.com','rose@edge.com'};
        
        contactList = [SELECT Name, Email, Phone 
                       FROM Contact 
                       WHERE email IN :searchEmailList
                       ORDER By Name DESC 
                       LIMIT 10];
        
        for(Contact contObj :contactList){
            System.debug('Name: ' + contObj.name);
            System.debug('Phone: ' + contObj.phone);
        }
    }
    
    public static void SOQLforParentAccess(){
        List<Contact> contactList = new List<Contact>();
        List<String> searchEmailList = new List<String>{'ldcruz@uog.com','rose@edge.com'};
        
        contactList = [SELECT Name, Email, Phone, Account.Name, Account.phone 
                       FROM Contact 
                       WHERE email IN :searchEmailList
                       ORDER By Name DESC 
                       LIMIT 10];
        
        for(Contact contObj :contactList){
            System.debug('Name: ' + contObj.name);
            System.debug('Phone: ' + contObj.phone);
        }
    }
    
    /*
     * Assignment: JEET, SEETA RAM, RINKU.
     * #1: Create a method that will accept the an EMail address, and show all contact names and phone 
     * with mathching Email.
     * 
     * #2: Create a method that will accept the email addess, add show all contact and lead Names and 
     * phone with mathing Email.
     * 
     * #3: Create a method that will accept date range, start and end date and will dplay all
     * opportunities records that are closed won in that data range.
     * 
     * #4: Create a method that will accept Contact's Phone number and will display all opportunity record who
     * are attached to the same contact's Account.
     * 
     */
    
    
}