/**
 * @description: Basic Programming - Question-4:
 *               Method which will accept String as Parameter and performs following operations :
 *
 *               String : ‘Welcome to @pex Programming’
 *               a. Replace the occurrences of ‘@’ with A and print it
 *               b. Print the substring ‘Apex Programming’
 *               c. Split the String using space and print the result
 *               d. Remove the spaces in the String and Print the result
 *               e. Convert the string to the upper case and print the result
 *               f. Convert the string to the lower case and print the result
 * @author: Sonali Kakade
 *
 * @revision:
 * Version      Date            Description
 * ------------------------------------------------
 * 1.0          10-May-2017     Initial revision.
 * 1.1          14-Jun-2017     
 **/

public class StringOperationsUtility {

    /**
     * @description: Base Method to call different string manipulation methods.
     * @author: Sonali Kakade
     * @date: 10-May-2017
     **/
    public static void performOPerations() {
        StringOperationsUtility operation = new StringOperationsUtility();
        String inputString = 'Welcome to @pex Programming';
        inputString = operation.replaceCharacter(inputString);
        operation.printSubstring(inputString);
        operation.splitString(inputString);
        operation.removeSpaces(inputString);
        operation.printUpperCase(inputString);
        operation.printLowerCase(inputString);
    }

    /**
     * @description: Method to replace the occurrences of ‘@’ with A and print it
     * @author: Sonali Kakade
     * @date: 10-May-2017
     **/
    public String replaceCharacter(String inputString) {
        if(String.isBlank(inputString)) {
            System.debug('Null value found as input.');
            return inputString;
        }
        String outputString = inputString.replace('@', 'A');
        System.debug('After Replacement String is: ' + outputString);
        System.debug('----------------------------------------------------------');
        return outputString;
    }

    /**
     * @description: Method to Print the substring ‘Apex Programming’.
     * @author: Sonali Kakade
     * @date: 10-May-2017
     **/
    public void printSubstring(String inputString) {
        if(String.isBlank(inputString)) {
            System.debug('Null value found as input.');
            return;
        }
        String outputString = inputString.substring(11, 27);
        System.debug('Substring is: ' + outputString);
        System.debug('----------------------------------------------------------');
    }

    /**
     * @description: Method to split the String using space and print the result.
     * @author: Sonali Kakade
     * @date: 10-May-2017
     **/
    public void splitString(String inputString) {
        if(String.isBlank(inputString)) {
            System.debug('Null value found as input.');
            return;
        }
        String[] arrayString = new List<String>();
        arrayString = inputString.split(' ');
        System.debug('String after splitting:');
        for (String word : arrayString) {
            System.debug('*' + word);
        }
        System.debug('----------------------------------------------------------');
    }

    /**
     * @description: Method to remove the spaces in the String and Print the result.
     * @author: Sonali Kakade
     * @date: 10-May-2017
     **/
    public void removeSpaces(String inputString) {
        if(String.isBlank(inputString)) {
            System.debug('Null value found as input.');
            return;
        }
        String outputString = inputString.replace(' ' , '');
        System.debug('After Removing Spaces String is: ' + outputString);
        System.debug('----------------------------------------------------------');
    }

    /**
     * @description: Method to convert the string to the upper case and print the result.
     * @author: Sonali Kakade
     * @date: 10-May-2017
     **/
    public void printUpperCase(String inputString) {
        if(String.isBlank(inputString)) {
            System.debug('Null value found as input.');
            return;
        }
        String outputString = inputString.toUpperCase();
        System.debug('Upper Case: ' + outputString);
        System.debug('----------------------------------------------------------');
    }

    /**
     * @description: Method to convert the string to the lower case and print the result.
     * @author: Sonali Kakade
     * @date: 10-May-2017
     **/
    public void printLowerCase(String inputString) {
        if(String.isBlank(inputString)) {
            System.debug('Null value found as input.');
            return;
        }
        String outputString = inputString.toLowerCase();
        System.debug('Lower Case: ' + outputString);
    }
}