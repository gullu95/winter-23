//WHY?
//When we need to work on the multiple datatypes.
public class WrapperClassExample {
    
    public static void init(){
        /*
        List<String> studentsList = new List<String>();
        studentsList.add('Rollnumber, Name, Email, Phone, DataOfBirth');
		*/
        List<StudentRecord> studentsList = new List<StudentRecord>();
        /* Approach 1
        StudentRecord studObj = new StudentRecord();
        studObj.name = 'John';
        studObj.Email = 'anthony@test.com';
        studObj.Phone = '8233514999';
        studObj.dateOfBirth = Date.newInstance(1994, 3, 23);
        studObj.rollNumber = 1;
		studentsList.add(studObj);
		*/
        /* Approach 2
        StudentRecord studObj = new StudentRecord('John', 'anthony@test.com', '8233514999', Date.newInstance(1994, 3, 23), 1);
        studentsList.add(studObj);
		*/
        
        /* Approach 3 */
        studentsList.add(new StudentRecord('John', 'anthony@test.com', '8233514999', Date.newInstance(1994, 3, 23), 1));
        studentsList.add(new StudentRecord('Kapil', 'Kapil@test.com', '823808000', Date.newInstance(1992, 4, 23), 2));
        studentsList.add(new StudentRecord('Finch', 'Finch@test.com', '823351349', Date.newInstance(2002, 4, 2), 3));
        
        for(StudentRecord Obj: studentsList){
            System.debug('Name: ' + Obj.name);
            System.debug('Phone: ' + Obj.phone);
        }
    }
    
    
    public class StudentRecord{
        String name;
        String email;
        String phone;
        Date dateOfBirth;
        Integer rollNumber;
        
        public StudentRecord(String name, String email, String phone, Date dateOfBirth, Integer rollNumber){
            this.name = name;
            this.email = email;
            this.phone = phone;
            this.dateOfBirth = dateOfBirth;
            this.rollNumber = rollNumber;
        }
        
    }
}