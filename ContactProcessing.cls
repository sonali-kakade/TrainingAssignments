/**************************************************************************************************
SOQL
Question-1:
Query on All Contact records & add all to the List and print that list.
**************************************************************************************************/

public class ContactProcessing {
    public static void processQuery() {
        List<Contact> contactList = [Select Name, Birthdate, MobilePhone from Contact];
        System.debug(contactList);
    }
}