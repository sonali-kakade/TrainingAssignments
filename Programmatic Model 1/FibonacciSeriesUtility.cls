// Rename classes to have proper names.

/**
 * @desctiption: Basic Programming - Question-1:
 *               Method which will accept Integer parameter and print Fibonacci series upto that
 *               number.
 * @author: Sonali Kakade
 *
 * @revision:
 * Version      Date            Description
 * ------------------------------------------------
 * 1.0          10-May-2017     Initial revision.
 * 1.1          14-Jun-2017     
 **/

// Replace tabs with spaces.
// Comments always start with capital letter (can be called as sentence case.)
public with sharing class FibonacciSeriesUtility {

    /**
     * @description: Method to print Fibonacci series upto that number.
     * @author: Sonali Kakade
     * @date: 10-May-2017
     **/
    public static void displayFibonacciSeries(Integer input) {

        if(NULL == input) {
            return;
        }

        Integer firstNumber = 0, secondNumber = 1, thirdNumber, i; // Spaces before and after all operators
        // One space before and after single line comment
        /* One spaces before and after multi-line comment start as well as end. */
        // Remove unnecessary comments once reviewed.

        if(input < 0) {
            System.debug('Please provide positive integer as input.'); // proper message needed

        } else {

            if(input == 0) {
                System.debug(firstNumber);

            } else {
                System.debug(firstNumber);
                System.debug(secondNumber);
                thirdNumber = firstNumber + secondNumber;

                while(thirdNumber <= input) {
                    System.debug(thirdNumber);
                    firstNumber = secondNumber;
                    secondNumber = thirdNumber;
                    thirdNumber = firstNumber + secondNumber;
                }
            }
        }
    }
}