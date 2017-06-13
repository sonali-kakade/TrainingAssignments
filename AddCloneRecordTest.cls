@isTest
private class AddCloneRecordTest {

    static testMethod void forSingleRecord() {
        Test.startTest();
            List<Opportunity> opportunityList = OpprotunityFactory.createAndInsertOpportunities(1);
        Test.stopTest();
        List<Opportunity> opportunities = [select id from Opportunity where 
                                            Name Like 'Opportunity#%'];
        system.assertEquals(2, opportunities.size());
    }

    static testMethod void testForBulkInsertion() {
        Test.startTest();
            List<Opportunity> opportunityList = OpprotunityFactory.createAndInsertOpportunities(400);
        Test.stopTest();
        List<Opportunity> opportunities = [select id from Opportunity where 
                                            Name Like 'Opportunity#%'];
        system.assertEquals(800, opportunities.size());
   }
}