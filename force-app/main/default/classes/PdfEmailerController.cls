public with sharing class PdfEmailerController {
    
    public PageReference sendReport() {
                
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.setToAddresses(new String[]{ 'mysflearnings@gmail.com'});
        message.setSubject('PDF Generated and sent');
        
  	    PageReference reportPage = new PageReference('usecasevf');
        Blob reportPdf;
        try {
            reportPdf = reportPage.getContentAsPDF();
        }
        catch (Exception e) {
            reportPdf = Blob.valueOf(e.getMessage());
        }
        
        // Attach PDF to email and send
        Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
        attachment.setContentType('application/pdf');
        attachment.setFileName('AccountSummary.pdf');
        attachment.setInline(false);
        attachment.setBody(reportPdf);
        message.setFileAttachments(new Messaging.EmailFileAttachment[]{ attachment });
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{ message });
        
        ApexPages.addMessage(new 
            ApexPages.Message(ApexPages.Severity.INFO,
           'Email sent with PDF attachment to ' + 'mysflearnings@gmail.com'));

        return null; // Stay on same page, even on success
    }
    
}