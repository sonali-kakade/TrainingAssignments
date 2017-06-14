/**
 * @description: SOQL - Question-5:
 *               Write a SOQL query to find all Account records where 'Billing State' is not 'Maharashtra' and
 *               'Kerala'. Order the results by Billing State in descending order with null values at the end.
 *               Display first 10,000 records only. NOTE: do not use AND operator.
 * @author: Sonali Kakade
 *
 * @revision:
 * Version      Date            Description
 * ------------------------------------------------
 * 1.0          13-May-2017     Initial revision.
 **/

public with sharing class AccountRecordsBasedOnBillingState {

    /**
     * @description: Method to find all Account records where 'Billing State' is not 'Maharashtra' and
     *               'Kerala'. Order the results by Billing State in descending order with null values at the end.
     *               Display first 10,000 records only.
     * @author: Sonali Kakade
     * @date: 13-May-2017
     **/
    public static void fetchAccountRecords() {

        List<Account> accountList = [SELECT Name,BillingState FROM Account
                                        WHERE BillingState NOT IN ('Maharashtra','Kerala')
                                        ORDER BY BillingState DESC NULLS LAST LIMIT 10000];
        System.debug(accountList);
    }
}