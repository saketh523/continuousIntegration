trigger descAccount on Contact (after insert,after update) {
	Account acc = [select id,description from account where id ='0016F00002vnc3NQAQ'];
   
   for (contact con : trigger.new)
   {
       if(acc.description == null){
       acc.description =  con.lastname;
       update acc;
   }
       else{
                   acc.description += ','+ con.lastname ;
       	update acc;
       }
   }

}