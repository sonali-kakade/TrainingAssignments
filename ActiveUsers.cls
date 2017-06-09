/**************************************************************************************************
Advanced concepts / Collections/SOQL Queries/DML Operations
Question-5:
Write a SOQL query to retrieve/print the User records where Active = true. Prepare the
Map having User Id as key and User record as value.(Hint : Map<Id,User>)
**************************************************************************************************/
public with sharing class ActiveUsers {
    public static void displayActiveUsers() {
        Map<Id, User> activeUsers = new Map<Id, User>([SELECT Name FROM User WHERE IsActive = true]);
        System.debug(activeUsers);
    }
}