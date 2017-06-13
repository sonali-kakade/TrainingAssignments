/**************************************************************************************************
Question:4
Campaign member Trigger
Whenever a Campaign member of type lead is inserted, check the RSVP field on campaign
member, if it is blank and if the Lead RSVP field has value we would need to update that value
on the Campaign member RSVP field.
**************************************************************************************************/
trigger CampaignMemberTrigger on CampaignMember (before insert) {
    if(Trigger.isBefore && Trigger.isInsert) {
        CampaignMemberTriggerHandler.handleBeforeInsert(Trigger.new);
    }
}