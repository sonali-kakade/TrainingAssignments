/**************************************************************************************************
Question:1
System.debug the following statements for any object
a)Trigger.New b) Trigger.Old c)Trigger.NewMap d)Trigger.oldMap
**************************************************************************************************/
trigger AccountTrigger on Account (before update) {
    System.debug('OLD : '+Trigger.old);
    System.debug('OLD MAP : '+Trigger.oldMap);
    System.debug('NEW : '+Trigger.new);
    System.debug('NEW MAP : '+Trigger.newMap);
}