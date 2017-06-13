@isTest
public class SalesHeaderFactory
{
    public static List<Sales_Header__c> createSalesHeaders(Integer count, Integer amount) {
        List<Account> accountList = AccountFactory.createAndInsertAccounts(1, '');
        List<Contact> contactList = ContactFactory.createAndInsertContacts(1, '');
        List<Sales_Header__c> salesHeaders = new List<Sales_Header__c>();
        for (Integer i = 1; i <= count; i++) {
            Sales_Header__c salesHeader = new Sales_Header__c();
            salesHeader.Amount__c = amount;
            salesHeader.Bill_To_Organisation__c = accountList[0].Id;
            salesHeader.Bill_To_Customer__c = contactList[0].Id;
            salesHeader.Status__c = 'Open';
            salesHeader.Pick_Status__c = 'Open';
            salesHeader.Bill_To_Street__c = 'Street 1';
            salesHeader.Ship_To_Street__c = 'Street 1';
            salesHeader.Bill_To_State__c = 'Maharashtra';
            salesHeader.Ship_To_State__c = 'Maharashtra';
            salesHeader.Bill_To_City__c = 'Pune';
            salesHeader.Ship_To_City__c = 'Pune';
            salesHeader.Bill_To_Postal_Code__c = 333333;
            salesHeader.Ship_To_Postal_Code__c = 444444;
            salesHeaders.add(salesHeader);
        }
        return salesHeaders;
    }

    public static void createAndInsertSalesHeaders(Integer count, Integer amount) {
        List<Sales_Header__c> salesHeaders = createSalesHeaders(count, amount);
        insertData(salesHeaders);
    }

    public static void createInsertSalesHeadersAndEftTransactions(Integer count, Integer amount) {
        List<Sales_Header__c> salesHeaders = createSalesHeaders(count, amount);
        salesHeaders = insertData(salesHeaders);
        EFT_TransactionStatusFactory.createAndInsertEftTransactions(count,salesHeaders);
        updateData(salesHeaders);
    }

    public static List<Sales_Header__c> insertData(List<Sales_Header__c> salesHeaders) {
        insert salesHeaders;
        return salesHeaders;
    }

    public static void updateData(List<Sales_Header__c> salesHeaders) {
        for(Sales_Header__c salesHeader : salesHeaders) {
            salesHeader.Bill_To_Postal_Code__c = 222222;
            salesHeader.Ship_To_Postal_Code__c = 777777;
        }
        update salesHeaders;
    }
}