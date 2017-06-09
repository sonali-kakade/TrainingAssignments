public with sharing class CreateRecords {
    public static void insertRecords()
    {
        try
        {
            Account accountRecord = new Account(Name='Espl');
            insert accountRecord;

            ID accounttID = accountRecord.ID;

            Contact contactRecord = new Contact(FirstName='Noopur',
                                                LastName='Naik',
                                                MobilePhone='9870345232',
                                                AccountId=accounttID);
            insert contactRecord;

            Lead leadRecord = new Lead(FirstName='Swapnil',
                                        LastName='Padwal',
                                        MobilePhone='9780344848');
            insert leadRecord;

            Opportunity opportunityRecord = new Opportunity(Name='Noopur',
                                                            AccountId=accounttID);
            insert opportunityRecord;

        }catch(DmlException e)
        {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
}