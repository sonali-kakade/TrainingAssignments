@isTest
public class CampaignMemberFactory {

    public static List<CampaignMember> createCampaignMembers(Integer count, String leadRsvp, String campaignMemberRsvp) {
        List<CampaignMember> campaignMemberList = new List<CampaignMember>();
        List<Campaign> campaignList = CampaignFactory.createAndInsertCampaigns(1);
        List<Lead> leadList = LeadFactory.createAndInsertLeads(count, leadRsvp);
        for (Integer i = 1; i <= count; i++) {
            CampaignMember campaignMemberRecord = new CampaignMember();
            campaignMemberRecord.CampaignId = campaignList[0].Id;
            campaignMemberRecord.LeadId = leadList[i-1].Id;
            campaignMemberRecord.RSVP__c = campaignMemberRsvp;
            campaignMemberList.add(campaignMemberRecord);
        }
        return campaignMemberList;
    }

    public static void createAndInsertCampaignMembers(Integer count, String leadRsvp, String campaignMemberRsvp) {
        List<CampaignMember> campaignMemberList = createCampaignMembers(count, leadRsvp, campaignMemberRsvp);
        insert campaignMemberList;
    }

}