@isTest
public class CampaignFactory {
    public static List<Campaign> createCampaigns(Integer count) {
        List<Campaign> campaignList = new List<Campaign>();
        for (Integer i = 1; i <= count; i++) {
            Campaign campaignRecord = new Campaign();
            campaignRecord.Name = 'Campaign#'+i;
            campaignRecord.IsActive = true;
            campaignRecord.StartDate = Date.valueOf('2017-05-05');
            campaignRecord.EndDate = Date.valueOf('2017-05-20');
            campaignList.add(campaignRecord);
        }
        return campaignList;
    }

    public static List<Campaign> createAndInsertCampaigns(Integer count) {
        List<Campaign> campaignList = createCampaigns(count);
        return insertData(campaignList);
    }

    public static List<Campaign> insertData(List<Campaign> campaignList) {
        insert campaignList;
        return campaignList;
    }

    public static List<Campaign> updateData(List<Campaign> campaignList) {
        update campaignList;
        return campaignList;
    }
}