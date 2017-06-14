/**
 * @description: SOQL - Question-6:
 *               Write a SOQL query to display 100 opportunity records with amount greater than 10,000 order by
 *               created date. Skip first 50 records and include records from recycle bin.
 * @author: Sonali Kakade
 *
 * @revision:
 * Version      Date            Description
 * ------------------------------------------------
 * 1.0          13-May-2017     Initial revision.
 **/

public with sharing class OpportunitiesBasedOnAmount {

    /**
     * @description: Method to create multiple opportunity records.
     * @author: Sonali Kakade
     * @date: 13-May-2017
     **/
    public static void addMultipleOpportunityRecords() {
        List<Opportunity> opportunityList = new List<Opportunity>();
        Opportunity opportunityRecord;
        for(Integer i = 0; i < 150; i ++) {
            opportunityRecord = new Opportunity(Name = 'Opportunity' + i,
                                                Amount = 15000,
                                                StageName = 'Negotiation/Review',
                                                CloseDate = Date.valueOf('2017-03-03'));
            opportunityList.add(opportunityRecord);
        }
        try {
            insert opportunityList;
        } catch(DmlException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }

    /**
     * @description: Method to display 100 opportunity records with amount greater than 10,000 order by
     *               created date. Skip first 50 records and include records from recycle bin.
     * @author: Sonali Kakade
     * @date: 13-May-2017
     **/
    public static void fetchOpportunityRecords() {
        List<Opportunity> opportunities = [SELECT Name,Amount FROM Opportunity WHERE Amount > 10000
                                           ORDER BY CreatedDate ASC NULLS FIRST LIMIT 100 OFFSET 50 ALL ROWS];
        System.debug(opportunities);
    }
}