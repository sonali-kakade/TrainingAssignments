// Refer to Fibonacci class for code review comments.
/**
 * @desctiption: Basic Programming - Question-2:
 *               Method to reverse the string.
 * @author: Sonali Kakade
 *
 * @revision:
 * Version      Date            Description
 * ------------------------------------------------
 * 1.0          10-May-2017     Initial revision.
 * 1.1          14-Jun-2017     
 **/

public class StringReverseUtility {

    /**
     * @description: Method to reverse the string using string method.
     * @author: Sonali Kakade
     * @date: 10-May-2017
     **/
    public void displayReverseStringWithReverseStringMethod(String originalString) {
        if(String.isBlank(originalString)) {
            System.debug('Null value found as input.');
            return;
        }
        String reverseString = originalString.reverse();
        System.debug('Reversed String is: ' + reverseString);
    }

    /**
     * @description: Method to reverse the string without using string method.
     * @author: Sonali Kakade
     * @date: 10-May-2017
     **/
    public void printReverseStringWithoutReverseStringMethod(String originalString) {
        if(String.isBlank(originalString)) {
            System.debug('Null value found as input.');
            return;
        }
        String reverseString='';
        for (Integer i = originalString.length() - 1; i >= 0; i--) {
            reverseString = reverseString+originalString.substring(i, i + 1);
        }
        system.debug('Reversed String is: ' + reverseString );
    }

}