public with sharing class CampaignMemberTriggerHandler {
    public static void handleBeforeInsert(List<CampaignMember> campaignMembers) {
        List<Id> leadIds = new List<Id>();
        for(CampaignMember c: campaignMembers) {
            leadIds.add(c.LeadId);
        }
        Map<Id, String> leadRSVP = new Map<Id,String>();
        for(Lead lead: [Select Id,RSVP__c from Lead where Id IN :leadIds]) {
            leadRSVP.put(lead.Id, lead.RSVP__c);
        }
        for(CampaignMember campaignMember : campaignMembers) {
            if(campaignMember.RSVP__c == null) {
                campaignMember.RSVP__c = leadRSVP.get(campaignMember.LeadId);
            }
        }
    }
}