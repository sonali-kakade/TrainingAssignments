/**************************************************************************************************
Question:5
Unable to Cross Ship
1.Create SalesHeader__c object :(Having lookup to Account & Contact ) & Add necessary fields.
2.Create assignment record type on Case
On Insert or update of a SalesHeader__c, if
SalesHeader__c.Status__c = “Open”
SalesHeader__c.Pick_Status__c = “Open”
SalesHeader__c.Total_Amount__c > 300
Evaluate Bill to and Ship to fields to see if they match, if there is any difference, create a case
IF (SalesHeader__c.Bill_to_Street__c <> SalesHeader__c.Ship_to_Street__c, OR
SalesHeader__c.Bill_to_City__c <> SalesHeader__c.Ship_to_City__c; OR
SalesHeader__c.Bill_to_Postal_Code__c <> SalesHeader__c.Ship_to_Postal_Code__c; OR
SalesHeader__c.Bill_to_State__c <> SalesHeader__c.Ship_to_State__c )
Then create a case with the following mappings:

Case Field                       Value

Account                          SalesHeader__c.Bill_to_Customer__c
Contact                          SalesHeader__c.Bill_to_Customer__c
Record Type                      Assignment
Origin                           "Internal"
Owner                            Unable to Cross Ship Queue
Reason                           Unable to Cross Ship
Priority                         Medium
Status                           New
Subject                          Account.Name + " " + Case.Type
Type                             Unable to Cross Ship
Open_Sales_Order__c              SalesHeader__c.Id
Transaction_Status__c            EFT_Transaction_Status__c.Transaction_Status__c
Sales_Order_Number__c            SalesHeader__c.Name
Order_Date__c                    EFT_Transaction_Status__c.Transaction_Date__c
**************************************************************************************************/
trigger SalesHeaderTrigger on Sales_Header__c (after insert, after update) {
    SalesHeaderTriggerHandler.handleSalesHeaderTrigger(Trigger.new);
}
