public with sharing class MapStructures
{
    public static void createMapStructures()
    {
        List<Account> accountList = new List<Account>([Select id, name from account]);
        Map<String,Id> accountMap = new Map<String,Id>();
        for(Account accountRecord : accountList)
        {
            accountMap.put(accountRecord.name,accountRecord.id);
        }
        System.debug(accountMap);
        Map<Id,Account> accountRecordMap = new Map<Id,Account>([Select name from account]);
        System.debug(accountRecordMap);
    }
}