@isTest
public class LeadFactory {

    public static List<Lead> createLeads(Integer count, String rsvp) {
        List<Lead> leadList = new List<Lead>();
        for (Integer i = 1; i <= count; i++) {
            Lead leadRecord = new Lead();
            leadRecord.FirstName = 'Test';
            leadRecord.LastName = 'Lead#'+i;
            leadRecord.Company = 'ESPL';
            leadRecord.Status = 'Open - Not Contacted';
            leadRecord.Email = 'abc' + i + '@gmail.com';
            leadRecord.Phone = '12345' + i;
            leadRecord.RSVP__c = rsvp;
            leadList.add(leadRecord);
        }
        return leadList;
    }

    public static List<Lead> createAndInsertLeads(Integer count, String rsvp) {
        List<Lead> leadList = createLeads(count, rsvp);
        return insertData(leadList);
    }

    public static List<Lead> insertData(List<Lead> leadList) {
        insert leadList;
        return leadList;
    }

}