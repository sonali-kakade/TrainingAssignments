/**
 * @description: SOQL - Question-2:
 *               Write a SOQL query to retrieve/print the User records where Active = true. Prepare the
 *               Map having User Id as key and User record as value.(Hint : Map<Id,User>)
 * @author: Sonali Kakade
 *
 * @revision:
 * Version      Date            Description
 * ------------------------------------------------
 * 1.0          12-May-2017     Initial revision.
 **/

public with sharing class ActiveUsers {

    /**
     * @description: Method to display active users.
     * @author: Sonali Kakade
     * @date: 12-May-2017
     **/
    public static void displayActiveUsers() {
        Map<Id, User> activeUsers = new Map<Id, User>([SELECT Name FROM User WHERE IsActive = true]);
        System.debug(activeUsers);
    }
}