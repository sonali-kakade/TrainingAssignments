public class ContactProcessing
{
    public static void processQuery()
    {
        List<Contact> contactList = [Select Name, Birthdate, MobilePhone from Contact];
        System.debug(contactList);
    }
}