/**
 * @description: Advanced concepts / Collections/SOQL Queries/DML Operations - Question-6:
 *               Prepare the Following Map Structures :
 *               a. AccountName as key and AccountId as Value
 *               b. AccountId as key Entire Account object as Value
 * @author: Sonali Kakade
 *
 * @revision:
 * Version      Date            Description
 * ------------------------------------------------
 * 1.0          12-May-2017     Initial revision.
 **/

public with sharing class MapStructures {

    /**
     * @description: Method to prepare map with AccountName as key and AccountId as Value and map with
     *               AccountId as key Entire Account object as Value.
     * @author: Sonali Kakade
     * @date: 12-May-2017
     **/
    public static void createMapStructures() {

        List<Account> accountList = new List<Account>([Select id, name from account]);
        Map<String, Id> accountMap = new Map<String, Id>();
        for(Account accountRecord : accountList) {
            accountMap.put(accountRecord.name, accountRecord.id);
        }
        System.debug(accountMap);

        Map<Id, Account> accountRecordMap = new Map<Id, Account>([Select name from account]);
        System.debug(accountRecordMap);

    }
}