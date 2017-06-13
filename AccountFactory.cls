@isTest
public with sharing class AccountFactory {
    public static List<Account> createAccounts(Integer count, String domain) {
        List<Account> accounts = new List<Account>();
        for (Integer i = 1; i <= count; i++) {
            Account account = new Account();
            account.Name = 'Account'+i;
            account.Domain__c = domain;
            accounts.add(account);
        }
        return accounts;
    }

    public static List<Account> createAndInsertAccounts(Integer count, String domain) {
        List<Account> accounts = createAccounts(count, domain);
        return insertData(accounts);
    }

    public static List<Account> insertData(List<Account> accounts) {
        insert accounts;
        return accounts;
    }

    public static List<Account> updateData(List<Account> accounts) {
        update accounts;
        return accounts;
    }
}