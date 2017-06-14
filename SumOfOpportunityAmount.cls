/**
 * @description: Aggregate Functions - Question-1:
 *               Write a SOQL query to retrieve sum of all closed Opportunity amount for current fiscal year. Store
 *               this information in a map with key as year and value as sum of amount. Iterate this map to display
 *               statistics.
 * @author: Sonali Kakade
 *
 * @revision:
 * Version      Date            Description
 * ------------------------------------------------
 * 1.0          13-May-2017     Initial revision.
 **/

public with sharing class SumOfOpportunityAmount {

    /**
     * @description: Method to retrieve sum of all closed Opportunity amount for current fiscal year.
     * @author: Sonali Kakade
     * @date: 13-May-2017
     **/
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