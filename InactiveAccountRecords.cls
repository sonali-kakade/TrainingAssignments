/**
 * @description: DML Operations - Question-2:
 *               Delete all inactive Account records created in last 90 days.
 * @author: Sonali Kakade
 *
 * @revision:
 * Version      Date            Description
 * ------------------------------------------------
 * 1.0          16-May-2017     Initial revision.
 **/

public with sharing class InactiveAccountRecords {

    /**
     * @description: Method to Delete all inactive Account records created in last 90 days.
     * @author: Sonali Kakade
     * @date: 16-May-2017
     **/
    public static void deleteInactiveAccountRecords() {

        List<Account> accountList = [SELECT Name,(Select Id,Name,StageName from Opportunities)
                                     FROM Account WHERE CreatedDate = LAST_90_DAYS AND Active__c = 'No'];
        List<Opportunity> opportunityList = new List<Opportunity>();
        for(Account accountRecord : accountList) {
            for(Opportunity opportunity : accountRecord.Opportunities) {
                if(opportunity.StageName == 'Closed Won') {
                    opportunityList.add(opportunity);
                }
            }
        }

        if(accountList.size() != 0) {
            if(opportunityList.size() != 0) {
                delete opportunityList;
            }
            delete accountList;
            System.debug('Successfully deleted Inactive Account records...');
        }
    }
}