public class SendEmailDon {
public String subject {get; set;}
    public String email_body {get; set;}
       public  String[] emails {get; set;}
    
    // Constructor to populate instance of your object
    public PageReference send() {
    
    
   
    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();   

    email.setSubject(subject);
    email.setPlainTextBody(email_body );
    email.setToAddresses(emails);
    
    Messaging.SendEmailResult [] r = Messaging.SendEmail(new Messaging.SingleEmailMessage[] {email});      
   
    return null;   
}
}