/**************************************************************************************************
Apex Implementation Best Practices:
ABC Containers require the ability to automatically associate a Contact created
in their Salesforce Instance with the respective Account based on the email
domain specified in the primary email address of the Contact. The association
should happen real time as soon as a Contact record is created within the
system.

TODO:
1.Ensure all the discussed implementation best practices are followed.
2.Develop the necessary piece of Apex code to implement a solution for
the given problem statement.
3.Develop the necessary Test code to attain the right code coverage
(minimum 90% with at least 4 test cases)
**************************************************************************************************/
trigger AssociateContactToAccountTrigger on Contact (before insert, before update) {
    AssociateContactToAccountTriggerHandler.contactAccountAssociation(Trigger.new);
}
