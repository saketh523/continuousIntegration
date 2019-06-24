public class test {
    public static void method1(){
        List<String> ls = new List<String>();
        ls.add('one');
        ls.add('two');
        ls.add('three');
        for(Integer i = 0;i<ls.size();i++)
        	System.debug(ls[i]);
    }
    }