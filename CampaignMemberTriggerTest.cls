@isTest
public class CampaignMemberTriggerTest
{
    static testMethod void forSingleRecordWithEmptyRsvp()
    {
        Test.startTest();
            CampaignMemberFactory.createAndInsertCampaignMembers(1, 'Yes', '');
        Test.stopTest();
        List<CampaignMember> campaignMembers = [select RSVP__c,Lead.RSVP__c from CampaignMember];
        system.assertEquals(campaignMembers[0].Lead.RSVP__c, campaignMembers[0].RSVP__c);
    }

    static testMethod void forSingleRecordWithRsvp()
    {
        Test.startTest();
            CampaignMemberFactory.createAndInsertCampaignMembers(1, 'Yes', 'May be');
        Test.stopTest();
        List<CampaignMember> campaignMembers = [select RSVP__c,Lead.RSVP__c from CampaignMember];
        system.assertEquals('May be', campaignMembers[0].RSVP__c);
    }

    static testMethod void forSingleRecordWithBothEmptyRsvp()
    {
        Test.startTest();
            CampaignMemberFactory.createAndInsertCampaignMembers(1, '', '');
        Test.stopTest();
        List<CampaignMember> campaignMembers = [select RSVP__c,Lead.RSVP__c from CampaignMember];
        system.assertEquals(null, campaignMembers[0].RSVP__c);
    }

    static testMethod void forSingleRecordWithEmptyLeadRsvp()
    {
        Test.startTest();
            CampaignMemberFactory.createAndInsertCampaignMembers(1, '', 'May be');
        Test.stopTest();
        List<CampaignMember> campaignMembers = [select RSVP__c,Lead.RSVP__c from CampaignMember];
        system.assertEquals('May be', campaignMembers[0].RSVP__c);
    }

    static testMethod void testForBulkInsertionWithLeadRsvp()
    {
        Test.startTest();
            CampaignMemberFactory.createAndInsertCampaignMembers(200,'Yes', '');
        Test.stopTest();
        for(CampaignMember campaignMemberRecord : [select RSVP__c,Lead.RSVP__c from CampaignMember])
        {
            system.assertEquals(campaignMemberRecord.Lead.RSVP__c, campaignMemberRecord.RSVP__c);
        }
   }
   
    static testMethod void testForBulkInsertionWithBothRsvp()
    {
        Test.startTest();
            CampaignMemberFactory.createAndInsertCampaignMembers(200,'Yes', 'May be');
        Test.stopTest();
        for(CampaignMember campaignMemberRecord : [select RSVP__c,Lead.RSVP__c from CampaignMember])
        {
            system.assertEquals('May be', campaignMemberRecord.RSVP__c);
        }
    }
   
    static testMethod void testForBulkInsertionWithNoRsvp()
    {
        Test.startTest();
            CampaignMemberFactory.createAndInsertCampaignMembers(200,'', '');
        Test.stopTest();
        for(CampaignMember campaignMemberRecord : [select RSVP__c,Lead.RSVP__c from CampaignMember])
        {
            system.assertEquals(null, campaignMemberRecord.RSVP__c);
        }
    }

    static testMethod void testForBulkInsertionWithRsvp()
    {
        Test.startTest();
            CampaignMemberFactory.createAndInsertCampaignMembers(200,'', 'May be');
        Test.stopTest();
        for(CampaignMember campaignMemberRecord : [select RSVP__c,Lead.RSVP__c from CampaignMember])
        {
            system.assertEquals('May be', campaignMemberRecord.RSVP__c);
        }
    }

    static testMethod void testForBulkInsertion()
    {
        Test.startTest();
            CampaignMemberFactory.createAndInsertCampaignMembers(100,'Yes', '');
            CampaignMemberFactory.createAndInsertCampaignMembers(100,'Yes, With Other', 'May be');
        Test.stopTest();
        for(CampaignMember campaignMemberRecord : [select RSVP__c,Lead.RSVP__c from CampaignMember where Lead.RSVP__c = 'Yes'])
        {
            system.assertEquals('Yes', campaignMemberRecord.RSVP__c);
        }
        for(CampaignMember campaignMemberRecord : [select RSVP__c,Lead.RSVP__c from CampaignMember where Lead.RSVP__c = 'Yes, With Other'])
        {
            system.assertEquals('May be', campaignMemberRecord.RSVP__c);
        }
    }
}