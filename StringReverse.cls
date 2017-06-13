/**************************************************************************************************
Basic Programming
Question-2:
Method to reverse the string.
**************************************************************************************************/

public class StringReverse {
    public static void printReverseStringUsingMethod(String originalString) {
	    String reverseString = originalString.reverse();
    	System.debug('Reversed String is: ' + reverseString);
    }
    public static void printReverseStringWithoutMethod(String originalString) {
        String reverseString='';
        for (Integer i = originalString.length()-1; i >= 0; i--) {
            reverseString = reverseString+originalString.substring(i, i + 1);
        }
        system.debug('Reversed String is: ' + reverseString );
	}
}
