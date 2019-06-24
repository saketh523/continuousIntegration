public class myfirstcontroller {
  private boolean DML;
public myfirstcontroller(){
       
   // DML= true;
   // 
   //doSomeDMLStuff();
        
  }        
      public void doSomeDMLStuff(){
          

      Account a= new Account();
      a.Name='@@@@Lannister';
      
      insert a;
          system.debug('@@@@@a'+a);
          doSomeUpdate();
   }
   @future(callout=true)
public static void doSomeUpdate()
{
            Http h = new Http();

   HttpRequest req = new HttpRequest();
	string URL='http://requestbin.fullcontact.com/1ms6z6h1';
   req.setEndpoint(URL);
   req.setMethod('GET');
   HttpResponse res = h.send(req);
    system.debug('res.getBody()'+res.getBody());
    
    Account AccObj= new Account();
    AccObj=[select id,name from Account where name='@@@@Lannister' limit 1];
    system.debug('AccObj');
    AccObj.Phone='1234567890';
    //update AccObj;
    system.debug('NUMNBER'+AccObj);
    

}
      
}