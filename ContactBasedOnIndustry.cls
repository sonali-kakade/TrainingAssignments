/**************************************************************************************************
Child to Parent
Question-1:
Write a SOQL query on Contact to retrieve all active contacts belonging to 'media' Industry. Also
display the name of the account to which it is associated to.
**************************************************************************************************/
public with sharing class ContactBasedOnIndustry {
    public static void fetchContactRecordsBasedOnIndustry() {
        List<Contact> contactList = [Select Id, Name, Account.Name, Account.Industry from Contact
                                        where Account.Industry = 'Media' AND Account.Active__c = 'Yes'];
        for(Contact contactRecord: contactList) {
            System.debug('Contact Name: '+ contactRecord.Name +
                            '\t\tAccount Name : '+ contactRecord.Account.Name);
        }
    }
}