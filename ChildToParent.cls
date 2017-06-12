/**************************************************************************************************
Child to Parent
Question-2:
Write SOQL query on 'C'(created above) to retrieve all records of 'C' with name 'John' along with
parent details.
**************************************************************************************************/
public with sharing class ChildToParent {
    public static void fetchParentFromChild() {
        List<C__c> cList = [Select Name, A__r.Name, B__r.Name from C__c where Name Like 'John%'];
        for(C__c cRecord : cList) {
            System.debug(cRecord.Name + '\t' + cRecord.A__r.Name + '\t' + cRecord.B__r.Name);
        }
    }
}