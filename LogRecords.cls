/**************************************************************************************************
DML Operations
Question-1:
Create a custom object called as 'Logs'. Create a long text area field called as 'Error'. Create 100
Lead records using DML operations having a unique name. For all records which were not inserted into
Lead object, insert a record in Log object along with the reason why a record was not inserted. Also,
execute assignment rules to auto allocate Lead records to correct owner.
**************************************************************************************************/
public with sharing class LogRecords {
    public static void insertLeadRecords() {
        List<Lead> leadList = new List<Lead>();
        Lead leadRecord;
        AssignmentRule AR = new AssignmentRule();
        AR = [select id from AssignmentRule where SobjectType = 'Lead' and Active = true limit 1];
        Database.DMLOptions dmlOpts = new Database.DMLOptions();
		dmlOpts.assignmentRuleHeader.assignmentRuleId= AR.id;
		
        for(Integer record = 1; record <= 80; record++) {
            leadRecord = new Lead(FirstName='Lead#'+string.valueOf(record),
                                  LastName='Record#'+string.valueOf(record),
                                  Company='ESPL',
                                  City='Pune',
                                  Status='Open - Not Contacted');
            leadRecord.setOptions(dmlOpts);
            leadList.add(leadRecord);
        }
        for(Integer record = 81; record <= 100; record++) {
            leadRecord = new Lead(FirstName='Lead#'+string.valueOf(record),
                                  Company='ESPL',
                                  Status='Open - Not Contacted');
            leadRecord.setOptions(dmlOpts);
            leadList.add(leadRecord);
        }

        Database.SaveResult[] saveList = Database.insert(leadList,false);
        List<Log__c> logList = new List<Log__c>();
        Log__c logRecord;
        for(Database.SaveResult saveRecord : saveList) {
            if(!saveRecord.isSuccess()) {
                String errorMessage;
                for(Database.Error error : saveRecord.getErrors()) {
                    errorMessage =+ error.getMessage();
                }
                logRecord = new Log__c(Error__c=errorMessage);
                logList.add(logRecord);
            }
        }
        insert logList;
    }
}