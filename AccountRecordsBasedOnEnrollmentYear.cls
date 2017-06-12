/**************************************************************************************************
SOQL
Question-4:
Create a multi-select picklist on Account object called as 'Enrollment Year' with values - 2010, 2011,
2012, 2013, 2014, 2015 and 2016. Get all account records where in selected 'Enrollment Year' is:
a. 2010
b. 2013 and 2014
**************************************************************************************************/
public with sharing class AccountRecordsBasedOnEnrollmentYear {
    public static void fetchAccountRecords() {
        List<Account> accountList = [SELECT Name FROM Account
                                        WHERE Enrollment_Year__c INCLUDES ('2010')];
        System.debug('Records with Enrollment Year as 2010:');
        System.debug(accountList);
        accountList = [SELECT Name FROM Account WHERE Enrollment_Year__c INCLUDES ('2013')
                            AND Enrollment_Year__c INCLUDES ('2014')];
        System.debug('Records with Enrollment Year as 2013 & 2014:');
        System.debug(accountList);
    }
}