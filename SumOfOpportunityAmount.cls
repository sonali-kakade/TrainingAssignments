/**************************************************************************************************
Aggregate Functions
Question-1:
Write a SOQL query to retrieve sum of all closed Opportunity amount for current fiscal year. Store
this information in a map with key as year and value as sum of amount. Iterate this map to display
statistics.
**************************************************************************************************/
public with sharing class SumOfOpportunityAmount {
    public static void sumCurrentYearOpportunityAmount() {
        Integer year;
        Double amount;
        List<AggregateResult> opportunityList = [SELECT Sum(Amount),FiscalYear FROM Opportunity
                                                 WHERE StageName = 'Closed Won' group by FiscalYear];

        Map <Integer, Double> sumAmountMap = new Map <Integer, Double>();
        for(AggregateResult result : opportunityList) {
            amount = (Double)result.get('expr0');
            year = (Integer)result.get('FiscalYear');
            sumAmountMap.put(year, amount);
        }
        Integer currentYear = System.now().year();
        system.debug('Current Year : '+ currentYear +
                     ' and Total Amount : ' + sumAmountMap.get(currentYear));
    }
}