public with sharing class ActiveUsers
{
    public static void displayActiveUsers()
    {
        Map<Id,User> activeUsers = new Map<Id,User>([SELECT Name FROM User WHERE IsActive = true]);
        System.debug(activeUsers);
    }
}