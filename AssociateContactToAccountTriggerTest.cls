@isTest
private class AssociateContactToAccountTriggerTest {

    static testMethod void singleContactWithEmail() {
        Test.startTest();
            List<Account> accounts = AccountFactory.createAndInsertAccounts(1,'espl.com');
            List<Contact> contacts = ContactFactory.createAndInsertContacts(1,'abc@espl.com');
        Test.stopTest();
        contacts = [SELECT Id,Name,AccountId,Account.Name FROM Contact];
        System.assertEquals('Account1',contacts[0].Account.Name);
    }

    static testMethod void contactsWithEmail() {
        Test.startTest();
            List<Account> accounts = AccountFactory.createAndInsertAccounts(1,'espl.com');
            List<Contact> contacts = ContactFactory.createAndInsertContacts(200, 'abc@espl.com');
        Test.stopTest();
        contacts = [SELECT Id,Name,AccountId,Account.Name FROM Contact];
        for(Contact contact : contacts) {
            System.assertEquals('Account1',contact.Account.Name);
        }
    }

    static testMethod void singleContactWithoutEmail() {
        Test.startTest();
            List<Account> accounts = AccountFactory.createAndInsertAccounts(1,'espl.com');
            List<Contact> contacts = ContactFactory.createAndInsertContacts(1,'');
        Test.stopTest();
        contacts = [SELECT Id,Name,AccountId,Account.Name FROM Contact];
        System.assertEquals(null,contacts[0].Account.Name);
    }

    static testMethod void contactsWithoutEmail() {
        Test.startTest();
            List<Account> accounts = AccountFactory.createAndInsertAccounts(1,'espl.com');
            List<Contact> contacts = ContactFactory.createAndInsertContacts(200, '');
        Test.stopTest();
        contacts = [SELECT Id,Name,AccountId,Account.Name FROM Contact];
        for(Contact contact : contacts) {
            System.assertEquals(null,contact.Account.Name);
        }
    }

    static testMethod void singleContactWithEmailNoDomain() {
        Test.startTest();
            List<Contact> contacts = ContactFactory.createAndInsertContacts(1, 'abc@espl.com');
        Test.stopTest();
        contacts = [SELECT Id,Name,AccountId,Account.Name FROM Contact];
        System.assertEquals(null,contacts[0].Account.Name);
    }

    static testMethod void contactsWithEmailNoDomain() {
        Test.startTest();
            List<Contact> contacts = ContactFactory.createAndInsertContacts(200, 'abc@espl.com');
        Test.stopTest();
        contacts = [SELECT Id,Name,AccountId,Account.Name FROM Contact];
        for(Contact contact: contacts) {
            System.assertEquals(null,contact.Account.Name);
        }
    }

    static testMethod void singleContactWithoutEmailNoDomain() {
        Test.startTest();
            List<Contact> contacts = ContactFactory.createAndInsertContacts(1, '');
        Test.stopTest();
        contacts = [SELECT Id,Name,AccountId,Account.Name FROM Contact];
        System.assertEquals(null,contacts[0].Account.Name);
    }

    static testMethod void contactsWithoutEmailNoDomain() {
        Test.startTest();
            List<Contact> contacts = ContactFactory.createAndInsertContacts(200, '');
        Test.stopTest();
        contacts = [SELECT Id,Name,AccountId,Account.Name FROM Contact];
        for(Contact contact: contacts) {
            System.assertEquals(null,contact.Account.Name);
        }
    }

    static testMethod void contactsWithDomain() {
        Test.startTest();
            List<Account> accounts = AccountFactory.createAndInsertAccounts(1,'espl.com');
            List<Contact> contacts = ContactFactory.createAndInsertContacts(100, 'abc@espl.com');
            List<Contact> contactsWithoutEmail = ContactFactory.createAndInsertContacts(100, '');
        Test.stopTest();
        for(Contact contact : [SELECT Id,Name,AccountId,Account.Name FROM Contact
                                where Email = 'abc@espl.com']) {
            System.assertEquals('Account1',contact.Account.Name);
        }
        for(Contact contact : [SELECT Id,Name,AccountId,Account.Name FROM Contact where Email = '']) {
            System.assertEquals(null,contact.Account.Name);
        }
    }

    static testMethod void contactsWithoutDomain() {
        Test.startTest();
            List<Contact> contacts = ContactFactory.createAndInsertContacts(100, 'abc@espl.com');
            List<Contact> contactsWithoutEmail = ContactFactory.createAndInsertContacts(100, '');
        Test.stopTest();
        for(Contact contact : [SELECT Id,Name,AccountId,Account.Name FROM Contact]) {
            System.assertEquals(null,contact.Account.Name);
        }
    }
}
