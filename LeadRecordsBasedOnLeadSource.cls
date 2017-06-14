/**
 * @description: Aggregate Functions - Question-2:
 *               Find total number of distinct Lead records on basis of 'Lead Source' having greater than 10 leads.
 *               Print this information.
 * @author: Sonali Kakade
 *
 * @revision:
 * Version      Date            Description
 * ------------------------------------------------
 * 1.0          13-May-2017     Initial revision.
 **/

public with sharing class LeadRecordsBasedOnLeadSource {

    /**
     * @description: Method to find total number of distinct Lead records on basis of 'Lead Source'
     *               having greater than 10 leads.
     * @author: Sonali Kakade
     * @date: 13-May-2017
     **/
    public static void fetchLeadCounts() {

        List<AggregateResult> leadCounts = [SELECT LeadSource,COUNT_DISTINCT(Name) FROM Lead
                                            group by LeadSource having COUNT_DISTINCT(Name) > 10];
        System.debug(leadCounts);
    }
}