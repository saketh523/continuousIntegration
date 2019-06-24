public class demoController{

    public demoController(ApexPages.StandardController controller) {

    }

public PageReference pageLoad(){
PageReference pg = new PageReference('http://www.google.com');
return pg;
}
}