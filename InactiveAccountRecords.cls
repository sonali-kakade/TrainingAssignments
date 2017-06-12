/**************************************************************************************************
DML Operations
Question-2:
Delete all inactive Account records created in last 90 days.
**************************************************************************************************/
public with sharing class InactiveAccountRecords {
    public static void deleteInactiveAccountRecords() {
        List<Account> accountList = [SELECT Name,(Select Id,Name,StageName from Opportunities)
                                        FROM Account WHERE CreatedDate = LAST_90_DAYS AND
                                        Active__c = 'No'];
        List<Opportunity> opportunityList = new List<Opportunity>();
        for(Account accountRecord : accountList) {
            for(Opportunity opportunity : accountRecord.Opportunities) {
                if(opportunity.StageName == 'Closed Won') {
                    opportunityList.add(opportunity);
                }
            }
        }
        delete opportunityList;
        delete accountList;
        System.debug('Successfully deleted Inactive Account records...');
    }
}