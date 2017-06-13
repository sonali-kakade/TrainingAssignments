@isTest
public with sharing class OpprotunityFactory {
    public static List<Opportunity> createOpportunities(Integer count) {
        List<Opportunity> opportunityList = new List<Opportunity>();
        for (Integer i = 1; i <= count; i++) {
            Opportunity opportunityRecord = new Opportunity();
            opportunityRecord.Name = 'Opportunity#'+i;
            opportunityRecord.StageName = 'Negotiation/Review';
            opportunityRecord.CloseDate = Date.valueOf('2017-03-03');
            opportunityList.add(opportunityRecord);
        }
        return opportunityList;
    }

    public static List<Opportunity> createAndInsertOpportunities(Integer count) {
        List<Opportunity> opportunityList = createOpportunities(count);
        return insertData(opportunityList);
    }

    public static List<Opportunity> insertData(List<Opportunity> opportunityList) {
        insert opportunityList;
        return opportunityList;
    }

    public static List<Opportunity> updateData(List<Opportunity> opportunityList) {
        update opportunityList;
        return opportunityList;
    }
}