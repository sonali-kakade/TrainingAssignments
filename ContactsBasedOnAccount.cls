/**
 * @description: Parent to Child - Question-1:
 *               Write a SOQL query on Account and find all associated contact records of the Account which
 *               contains the word 'John'. Print all Account and Contact records retrieved above.
 * @author: Sonali Kakade
 *
 * @revision:
 * Version      Date            Description
 * ------------------------------------------------
 * 1.0          15-May-2017     Initial revision.
 **/

public with sharing class ContactsBasedOnAccount {

    /**
     * @description: Method to find all associated contact records of the Account which
     *               contains the word 'John'. Print all Account and Contact records retrieved above.
     * @author: Sonali Kakade
     * @date: 15-May-2017
     **/
    public static void fetchContactRecords() {
        List<Account> accountList = [Select Id, Name, (Select Id, Name from Contacts
                                        where Name Like '%John%') From Account];
        for(Account accountRecord: accountList) {
            if(accountRecord.contacts.size() > 0) {
                System.debug(accountRecord + ' ' + accountRecord.contacts);
            }
        }
    }
}