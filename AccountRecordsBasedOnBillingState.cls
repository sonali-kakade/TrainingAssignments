/**************************************************************************************************
SOQL
Question-5:
Write a SOQL query to find all Account records where 'Billing State' is not 'Maharashtra' and
'Kerala'. Order the results by Billing State in descending order with null values at the end. Display first
10,000 records only. NOTE: do not use AND operator.
**************************************************************************************************/
public with sharing class AccountRecordsBasedOnBillingState {
    public static void fetchAccountRecords() {
        List<Account> accountList = [SELECT Name,BillingState FROM Account
                                        WHERE BillingState NOT IN ('Maharashtra','Kerala')
                                        ORDER BY BillingState DESC NULLS LAST LIMIT 10000];
        System.debug(accountList);
    }
}