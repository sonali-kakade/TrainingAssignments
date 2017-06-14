/**
 * @description: Aggregate Functions - Question-3:
 *               Write a SOQL query to find total number of Lead records by status by Lead Source. Store this
 *               information in map and display the same. (Hint: map<string,map<string,integer>>)
 * @author: Sonali Kakade
 *
 * @revision:
 * Version      Date            Description
 * ------------------------------------------------
 * 1.0          13-May-2017     Initial revision.
 **/

public with sharing class MapLeads {

    /**
     * @description: Method to find total number of Lead records by status by Lead Source
     * @author: Sonali Kakade
     * @date: 13-May-2017
     **/
    public static void mappingLeadRecords() {

        List<AggregateResult> leadRecords = [SELECT status,LeadSource,count(Name) FROM Lead
                                                group by status,LeadSource];
        Map<String,Map<String,Integer>> leadMap = new Map<String,Map<String,Integer>>();

        for(AggregateResult result : leadRecords) {
            String status = (String) result.get('Status');
            if(!leadMap.containsKey(status)) {
                leadMap.put(status, new Map<String,Integer>());
            }
            String source = (String) result.get('LeadSource');
            Integer leadCount = (Integer) result.get('expr0');
            leadMap.get(status).put(source,leadCount);
        }
        System.debug(leadMap);
    }
}