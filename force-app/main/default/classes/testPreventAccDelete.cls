@istest
public class testPreventAccDelete{
		static testmethod void preventdel(){
			Account acc = new Account(Name = 'SampleAccount');
			insert acc;
			delete acc;
		}
}