trigger addDoctorPrefixName on Lead (before insert, before update) {
    for(Lead lead : trigger.new){
        lead.LastName = 'Doctor ' + lead.LastName;
    }
}
//The following trigger describes when the leads are inserted into the database it would
//add Doctor prefixed for all lead names. 
//This is applicable for both inserting and updating the lead records.