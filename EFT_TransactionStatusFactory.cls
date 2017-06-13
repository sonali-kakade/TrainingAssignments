@isTest
public class EFT_TransactionStatusFactory {
    public static List<EFT_Transaction_Status__c> createEftTransactions(Integer count, List<Sales_Header__c> salesHeaders) {
        List<EFT_Transaction_Status__c> eftTransactions = new List<EFT_Transaction_Status__c>();
        for (Integer i = 1; i <= count; i++) {
            EFT_Transaction_Status__c eftTransaction = new EFT_Transaction_Status__c();
            eftTransaction.Sales_Header__c = salesHeaders[i-1].Id;
            eftTransaction.Method_Of_Transaction__c = 'Credit Card';
            eftTransaction.Transaction_Status__c = 'Approved';
            eftTransaction.Transaction_Date__c = Date.valueOf('2017-03-03');
            eftTransactions.add(eftTransaction);
        }
        return eftTransactions;
    }

    public static void createAndInsertEftTransactions(Integer count, List<Sales_Header__c> salesHeaders) {
        List<EFT_Transaction_Status__c> eftTransactions = createEftTransactions(count, salesHeaders);
        insertData(eftTransactions);
    }

    public static List<EFT_Transaction_Status__c> insertData(List<EFT_Transaction_Status__c> eftTransactions) {
        insert eftTransactions;
        return eftTransactions;
    }

    public static List<EFT_Transaction_Status__c> updateData(List<EFT_Transaction_Status__c> eftTransactions) {
        update eftTransactions;
        return eftTransactions;
    }
}