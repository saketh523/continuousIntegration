@istest
public class TestaddDoctorPrefixName {
    static testmethod void addprefix(){
        Lead lead = new Lead();
        lead.LastName = 'Sushmitha';
        lead.Company  = 'Salesforce';
        lead.Status   = 'Open-Not Contacted';
        insert lead;
        System.debug(lead);
    }
    
}