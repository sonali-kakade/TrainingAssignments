/**************************************************************************************************
Question:2
System.debug the following statements for all events (Before & After)
a)Trigger.New b) Trigger.Old c)Trigger.NewMap d)Trigger.oldMap
**************************************************************************************************/
trigger DepartmentTrigger on DEPARTMENT__c (after insert, after update, before insert, before update) {
    if (Trigger.isBefore) {
        if(Trigger.isInsert) {
            System.debug('BEFORE INSERT(new)'+Trigger.new);
        } else {
            System.debug('BEFORE UPDATE(old)'+Trigger.old);
        }
    } else {
        if(Trigger.isInsert) {
            System.debug('AFTER INSERT(newMap)'+Trigger.newMap);
        } else {
            System.debug('AFTER UPDATE(oldMap)'+Trigger.oldMap);
        }
    }
}
