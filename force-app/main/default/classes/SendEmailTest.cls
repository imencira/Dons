@isTest
public class SendEmailTest {

    
     @isTest public static void testsend   () {
                 SendEmailDon controller = new SendEmailDon();
                controller.subject ='test subject';
         controller.email_body='test';           String  addresses ='test@outlook.com;test2@outlook.com';   

                             String[] toAddresses = addresses.split(';', 0);

         controller.emails=toAddresses;
 
     Test.StartTest();
        controller.send();
        Integer invocations = Limits.getEmailInvocations();
        Test.stopTest();
 
        System.assertEquals(1, invocations, 'An email has not been sent');
           
         
   
    
    
     }}