/**
 * @description: Advanced concepts / Collections/SOQL Queries/DML Operations - Question-7:
 *               Demonstrate the usage of Database.query and Database.search methods.
 * @author: Sonali Kakade
 *
 * @revision:
 * Version      Date            Description
 * ------------------------------------------------
 * 1.0          12-May-2017     Initial revision.
 **/

public class DatabaseMethods {

    /**
     * @description: Method to Demonstrate the usage of Database.query method.
     * @author: Sonali Kakade
     * @date: 12-May-2017
     **/
    public static void queryDemo() {
        String nameStartingWith = 'u%';
        String query = 'SELECT Id, Name FROM Account WHERE Name LIKE :nameStartingWith';
        List<Account> acc = Database.query(query);
        System.debug('Accounts:' + acc);
    }

    /**
     * @description: Method to Demonstrate the usage of Database.search method.
     * @author: Sonali Kakade
     * @date: 12-May-2017
     **/
    public static void searchDemo() {
        String searchQuery = 'FIND \'test*\' IN ALL FIELDS RETURNING Account(id, name), Employee__c';
        List<List<sObject>> searchList = search.query(searchQuery);
        List<Account> acc = ((List<Account>)searchList[0]);
        List<Employee__c> emp = ((List<Employee__c>)searchList[1]);
        System.debug('List of account is:' + acc);
        System.debug('List of Employee is:' + emp);
    }
}