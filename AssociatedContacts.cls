/**************************************************************************************************
Advanced concepts / Collections/SOQL Queries/DML Operations
Question-2:
Write a Method which find all the associated contact records of the Account and Print it.
Question-4:
Write a SQOL Query to show Parent Child relationship and print the result.
(for example : Account is parent and Contact is child. Then Query on Account)
**************************************************************************************************/

public with sharing class AssociatedContacts {
    public static void fetchAssociatedContacts() {
        List<Account> accountList = [Select id, name, (Select Name, Birthdate, MobilePhone
                                     from Contacts) from Account];
        for(Account accountRecord: accountList) {
            System.debug(accountRecord + ' ' + accountRecord.contacts);
        }
    }
}