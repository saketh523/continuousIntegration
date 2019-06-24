public with sharing class AccContact {
    
	public list<Contact> accconts2 { get; set; }   
    
    public AccContact() {
         accconts2=[select id,Name, email,phone,firstName,LastName,account.name from Contact];
    	}
    
    public void sendingmail()
		{
			Messaging.SingleEmailMessage sendemail = new Messaging.SingleEmailMessage();
			PageReference PDf =  Page.usecasevf1;
			PDf.setRedirect(true);
			Attachment attach = new Attachment();
			Blob pdfs = PDf.getContentAsPDF();
			Messaging.EmailFileAttachment att = new Messaging.EmailFileAttachment();
			att.setFileName('Account-Contact.pdf');
			att.setBody(pdfs);
   			sendemail.setToAddresses(new String[] {'amurishetty@salesforce.com'});
			sendemail.setSubject('Sending Account and Contact Details as PDF');
			sendemail.setHtmlBody('Looks like this is working!');
			sendemail.setFileAttachments(new Messaging.EmailFileAttachment[] {att}); 
			Messaging.SendEmailResult [] result = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {sendemail});
        }
}