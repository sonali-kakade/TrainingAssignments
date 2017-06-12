/**************************************************************************************************
Aggregate Functions
Question-2:
Find total number of distinct Lead records on basis of 'Lead Source' having greater than 10 leads.
Print this information.
**************************************************************************************************/
public with sharing class LeadRecordsBasedOnLeadSource {
    public static void fetchLeadCounts() {
        List<AggregateResult> leadCounts = [SELECT LeadSource,COUNT_DISTINCT(Name) FROM Lead
                                            group by LeadSource having COUNT_DISTINCT(Name)>10];
        System.debug(leadCounts);
    }
}