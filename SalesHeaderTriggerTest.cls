@isTest
private class SalesHeaderTriggerTest {
    static testMethod void singleRecordInsertion() {
        Test.startTest();
            SalesHeaderFactory.createAndInsertSalesHeaders(1, 500);
        Test.stopTest();
        List<Case> cases = [Select Id from Case];
        system.assertEquals(1, cases.size());
    }

    static testMethod void bulkRecordsInsertion() {
        Test.startTest();
            SalesHeaderFactory.createAndInsertSalesHeaders(200, 500);
        Test.stopTest();
        List<Case> cases = [Select Id from Case];
        system.assertEquals(200, cases.size());
    }

    static testMethod void singleRecordUpdation() {
        Test.startTest();
            SalesHeaderFactory.createInsertSalesHeadersAndEftTransactions(1, 500);
        Test.stopTest();
        List<Case> cases = [Select Id from Case];
        system.assertEquals(2, cases.size());
    }

    static testMethod void bulkRecordsUpdation() {
        Test.startTest();
            SalesHeaderFactory.createInsertSalesHeadersAndEftTransactions(200, 500);
        Test.stopTest();
        List<Case> cases = [Select Id from Case];
        system.assertEquals(400, cases.size());
    }

    static testMethod void bulkRecordsUpdationMixed() {
        Test.startTest();
            SalesHeaderFactory.createInsertSalesHeadersAndEftTransactions(100, 200);
            SalesHeaderFactory.createInsertSalesHeadersAndEftTransactions(100, 500);
        Test.stopTest();
        List<Case> cases = [Select Id from Case];
        system.assertEquals(200, cases.size());
    }

    static testMethod void singleRecordInsertionNoCaseCreation() {
        Test.startTest();
            SalesHeaderFactory.createAndInsertSalesHeaders(1, 200);
        Test.stopTest();
        List<Case> cases = [Select Id from Case];
        system.assertEquals(0, cases.size());
    }

    static testMethod void bulkRecordsInsertionNoCaseCreation() {
        Test.startTest();
            SalesHeaderFactory.createAndInsertSalesHeaders(200, 200);
        Test.stopTest();
        List<Case> cases = [Select Id from Case];
        system.assertEquals(0, cases.size());
    }

    static testMethod void bulkRecordsInsertionMixed() {
        Test.startTest();
            SalesHeaderFactory.createAndInsertSalesHeaders(100, 200);
            SalesHeaderFactory.createAndInsertSalesHeaders(100, 500);
        Test.stopTest();
        List<Case> cases = [Select Id from Case];
        system.assertEquals(100, cases.size());
    }

    static testMethod void singleRecordUpdationNoCaseCreation() {
        Test.startTest();
            SalesHeaderFactory.createInsertSalesHeadersAndEftTransactions(1, 200);
        Test.stopTest();
        List<Case> cases = [Select Id from Case];
        system.assertEquals(0, cases.size());
    }

    static testMethod void bulkRecordsUpdationNoCaseCreation() {
        Test.startTest();
            SalesHeaderFactory.createInsertSalesHeadersAndEftTransactions(200, 200);
        Test.stopTest();
        List<Case> cases = [Select Id from Case];
        system.assertEquals(0, cases.size());
    }
}