/**
 * @description: SOSL - Question-1:
 *               Find the word 'test' in all name fields returning Contact, Account, Lead and User.
 * @author: Sonali Kakade
 *
 * @revision:
 * Version      Date            Description
 * ------------------------------------------------
 * 1.0          13-May-2017     Initial revision.
 **/

public with sharing class TestFinder {

    /**
     * @description: Method to find the word 'test' in all name fields returning Contact, Account, Lead and User.
     * @author: Sonali Kakade
     * @date: 13-May-2017
     **/
    public static void findTest() {

        List<List<SObject>> searchList = [FIND 'test*' IN Name FIELDS RETURNING Contact(Id, Name),
                                          Account(Id, Name), Lead(Id, Name), User(Id, Name)];
        System.debug(searchList);
    }
}