public with sharing class AssociatedContacts
{
    public static void fetchAssociatedContacts()
    {
        List<Account> accountList = [Select id, name, (Select Name, Birthdate, MobilePhone
                                        from Contacts) from Account];
        for(Account accountRecord: accountList)
        {
            System.debug(accountRecord+' '+accountRecord.contacts);
        }
    }
}