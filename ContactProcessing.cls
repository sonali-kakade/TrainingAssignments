/**
 * @description: SOQL - Question-1:
 *               Query on All Contact records & add all to the List and print that list.
 * @author: Sonali Kakade
 *
 * @revision:
 * Version      Date            Description
 * ------------------------------------------------
 * 1.0          12-May-2017     Initial revision.
 **/

public class ContactProcessing {

    /**
     * @description: Method to find all contact records and Print it.
     * @author: Sonali Kakade
     * @date: 12-May-2017
     **/
    public static void processQuery() {
        List<Contact> contactList = [Select Name
                                          , Birthdate
                                          , MobilePhone
                                       from Contact];

        System.debug(contactList);
    }
}