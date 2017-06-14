/**
 * @description: Parent to Child - Question-2:
 *               Write a SOQL query to find all Account records which have at least an opportunity record which is
 *               'Closed Won'.
 * @author: Sonali Kakade
 *
 * @revision:
 * Version      Date            Description
 * ------------------------------------------------
 * 1.0          13-May-2017     Initial revision.
 **/

public with sharing class AccountRecordsBasedOnOpportunity {

    /**
     * @description: Method to find all Account records which have at least an opportunity record which is
     *               'Closed Won'.
     * @author: Sonali Kakade
     * @date: 13-May-2017
     **/
    public static void fetchAccountRecordsBasedOnOpportunity() {

        List<Account> accountList = [Select Id,Name,(Select Id,StageName from Opportunities
                                     where StageName = 'Closed Won') from Account];
        List<Account> accountWithOpportunity = new List<Account>();
        for(Account accountRecord : accountList) {
            if(accountRecord.opportunities.size() > 0) {
                accountWithOpportunity.add(accountRecord);
            }
        }

        System.debug(accountWithOpportunity);
    }
}