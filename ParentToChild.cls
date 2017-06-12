/**************************************************************************************************
Parent to Child
Question-3:
Write a SOQL query on 'A' and retrieve all parents with all their child records where in child name is
'John'.
**************************************************************************************************/
public with sharing class ParentToChild {
    public static void fetchChildFromParent() {
        List<A__c> aList = [Select Id,Name, (Select Name From C__r) From A__c
                                where Id IN (Select A__c From C__c where Name LIKE 'John%')];
        for(A__c aRecord:aList) {
            for(C__c cRecord:aRecord.C__r) {
                System.debug('Parent: '+aRecord.Name+'\tChild: '+cRecord.Name);
            }
        }
    }
}