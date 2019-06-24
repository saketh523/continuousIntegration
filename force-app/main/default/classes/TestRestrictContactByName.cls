@isTest
private class TestRestrictContactByName {

    static testMethod void  PerformTest() 
    {
        Contact MarkI = new Contact(FirstName='Mark', LastName = 'INVALIDNAME',email='invalid@invalid.com');
        insert MarkI;
    }
}