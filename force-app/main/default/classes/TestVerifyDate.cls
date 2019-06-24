@istest
public class TestVerifyDate {
public static testmethod void verifyDate()
{   
   Date d1=date.parse('11/05/2016');
   date d2=date.parse('12/05/2016');
   date d3=date.parse('12/06/2016');
   VerifyDate.CheckDates(d1,d2);
   VerifyDate.CheckDates(d2,d3);
}
}
//VerifyDate' is a class which tests 
//if a date is within a proper range, 
//and if not will return a date that 
//occurs at the end of the month within the range.