/**
 * @description: Advanced concepts / Collections/SOQL Queries/DML Operations - Question-2 & 4:
 *               Write a Method which find all the associated contact records of the Account and Print it.
 *
 *               Write a SQOL Query to show Parent Child relationship and print the result.
 *               (for example : Account is parent and Contact is child. Then Query on Account)
 * @author: Sonali Kakade
 *
 * @revision:
 * Version      Date            Description
 * ------------------------------------------------
 * 1.0          12-May-2017     Initial revision.
 **/

public with sharing class AssociatedContacts {

    /**
     * @description: Method to find all the associated contact records of the Account and Print it.
     * @author: Sonali Kakade
     * @date: 12-May-2017
     **/
    public static void fetchAssociatedContacts() {
        List<Account> accountList = [Select id
                                          , name
                                          , (Select Name
                                                  , Birthdate
                                                  , MobilePhone
                                               from Contacts)
                                       from Account];

        for(Account accountRecord : accountList) {
            System.debug(accountRecord + ' ' + accountRecord.contacts);
        }
    }
}