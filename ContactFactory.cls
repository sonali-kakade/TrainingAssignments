@isTest
public class ContactFactory {
    public static List<Contact> createContacts(Integer count, String email) {
        List<Contact> contacts = new List<Contact>();
        for (Integer i = 1; i <= count; i++) {
            Contact contact = new Contact();
            contact.FirstName = 'Test'+i;
            contact.LastName = 'Contact'+i;
            contact.Email = email;
            contacts.add(contact);
        }
        return contacts;
    }

    public static List<Contact> createAndInsertContacts(Integer count, String email) {
        List<Contact> contacts = createContacts(count, email);
        return insertData(contacts);
    }

    public static List<Contact> insertData(List<Contact> contacts) {
        insert contacts;
        return contacts;
    }

    public static List<Contact> updateData(List<Contact> contacts) {
        update contacts;
        return contacts;
    }
}