public with sharing class SearchKeywordController
{
    public String searchText {get; set;}
    public List<Account> accountRecords {get; set;}
    public List<Contact> contactRecords {get; set;}
    public List<Lead> leadRecords {get; set;}
    public List<Opportunity> opportunityRecords {get; set;}

    public void searchRecords()
    {
        if(searchText.length() < 2) {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,
                                'Please enter atleast 3 characters.'));
        } else {
            searchText = searchText + '%';
            accountRecords = [Select Name, Phone from Account where Name Like :searchText];
            contactRecords = [Select Name, Phone from Contact where FirstName Like :searchText
                                                            or LastName Like :searchText];
            leadRecords = [Select Name, Phone, Company from Lead where FirstName Like :searchText
                                                            or LastName Like :searchText];
            opportunityRecords = [Select Name, StageName from Opportunity where Name Like :searchText];
        }
    }
}
