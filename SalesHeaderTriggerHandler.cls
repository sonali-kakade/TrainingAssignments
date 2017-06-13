public with sharing class SalesHeaderTriggerHandler {
    public static void handleSalesHeaderTrigger(List<Sales_Header__c> salesHeaderList) {
        List<Case> caseList = new List<Case>();
        Case caseRecord;
        AssignmentRule AR = new AssignmentRule();
        AR = [select id from AssignmentRule where SobjectType = 'Case' and Active = true limit 1];
        Database.DMLOptions dmlOpts = new Database.DMLOptions();
        dmlOpts.assignmentRuleHeader.assignmentRuleId = AR.id;
        Map<Id,EFT_Transaction_Status__c> EftMap = new Map<Id,EFT_Transaction_Status__c>();
        for(EFT_Transaction_Status__c EftRecord : [Select Id, Sales_Header__r.Id, Transaction_Date__c,
                                    Transaction_Status__c from EFT_Transaction_Status__c
                                    where Sales_Header__r.Id IN :salesHeaderList]) {
            EftMap.put(EftRecord.Sales_Header__r.Id,EftRecord);
        }
        for(Sales_Header__c salesHeaderRecord : salesHeaderList) {
            if(salesHeaderRecord.Status__c == 'Open'
                && salesHeaderRecord.Pick_Status__c == 'Open' 
                && salesHeaderRecord.Amount__c > 300) {
                if(salesHeaderRecord.Bill_To_Street__c <> salesHeaderRecord.Ship_To_Street__c
                    || salesHeaderRecord.Bill_To_City__c <> salesHeaderRecord.Ship_To_City__c
                    || salesHeaderRecord.Bill_To_State__c <> salesHeaderRecord.Ship_To_State__c
                    || salesHeaderRecord.Bill_To_Postal_Code__c <> salesHeaderRecord.Ship_To_Postal_Code__c) {
                    caseRecord = new Case(AccountId = salesHeaderRecord.BILL_TO_ORGANISATION__C,
                                            ContactId = salesHeaderRecord.BILL_TO_CUSTOMER__C,
                                            Origin = 'Internal',
                                            Reason = 'Unable to Cross Ship',
                                            Priority = 'Medium',
                                            Status = 'New',
                                            Type = 'Unable to Cross Ship',
                                            Open_Sales_Order__c = salesHeaderRecord.Id);
                    caseRecord.Subject = salesHeaderRecord.BILL_TO_ORGANISATION__r.Name
                                            + ' ' + caseRecord.Type;
                    if(!EftMap.isEmpty()) {
                        caseRecord.Transaction_Status__c = EftMap.get(salesHeaderRecord.Id).Transaction_Status__c;
                        caseRecord.Order_Date__c = EftMap.get(salesHeaderRecord.Id).Transaction_Date__c;
                    }
                    caseRecord.setOptions(dmlOpts);
                    caseList.add(caseRecord);
                }
            }
        }
        insert caseList;
    }
}