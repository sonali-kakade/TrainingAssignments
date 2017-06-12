/**************************************************************************************************
SOSL
Question-1:
Find the word 'test' in all name fields returning Contact, Account, Lead and User.
**************************************************************************************************/
public with sharing class TestFinder {
    public static void findTest() {
        List<List<SObject>> searchList = [FIND 'test*' IN Name FIELDS RETURNING Contact(Id, Name),
                                                Account(Id, Name), Lead(Id, Name), User(Id, Name)];
        System.debug(searchList);
    }
}