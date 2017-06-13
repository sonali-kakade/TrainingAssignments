/**************************************************************************************************
Question:3
Write a Trigger on Opportunity which will create the clone record.
(Hint : Map trigger.new to clone record)
**************************************************************************************************/
trigger AddCloneRecord on Opportunity (after insert) {
    if(checkRecursive.runOnce()) {
            List<Opportunity> newOppotunityList = trigger.new.deepClone();
            insert  newOppotunityList;
    }
}
