public class myfirstcontroller3 {
   private boolean DML;
public myfirstcontroller3(){
        
    // DML= true;
    // 
    //doSomeDMLStuff();
         
   }        
       public void doSomeDMLStuff(){

       Account a= new Account();
       a.Name='@@@@Lannister';
       
       insert a;
           system.debug('@@@@@a'+a);
           //doSomeUpdate();
    }
 public void doSomeUpdate()
 {
     Account AccObj= new Account();
     AccObj=[select id,name from Account where name='@@@@Lannister'];
     system.debug('AccObj');
     AccObj.Phone='1234567890';
     update AccObj;
     system.debug('NUMNBER'+AccObj);
 }
       
}