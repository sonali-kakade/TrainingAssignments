public with sharing class AssociateContactToAccountTriggerHandler {
    public static void contactAccountAssociation(List<Contact> contacts) {
        Set<String> uniqueContactDomains = new Set<String>();
        List<Contact> contactsWithEmail = new List<Contact>();
        for (Contact contact : contacts) {
            if (contact.Email != null) {
                    uniqueContactDomains.add(contact.Email.split('@').get(1));
                    contactsWithEmail.add(contact);
            }
        }

        if (!uniqueContactDomains.isEmpty()) {
            Map<String, Id> accountDomainMap = new Map<String, Id>();
            for (Account a : [SELECT Domain__c,Id FROM Account WHERE Domain__c IN :uniqueContactDomains]) {
                accountDomainMap.put(a.Domain__c, a.Id);
            }
            for (Contact contact : contactsWithEmail) {
                contact.AccountId = accountDomainMap.get(contact.Email.split('@').get(1));
            }
        }
   }
}
