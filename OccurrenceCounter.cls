/**
 * @description: Basic Programming - Question-5:
 *               Accept a string as a parameter and count the occurrence of every character in it.
 * @author: Sonali Kakade
 *
 * @revision:
 * Version      Date            Description
 * ------------------------------------------------
 * 1.0          10-May-2017     Initial revision.
 * 1.1          14-Jun-2017     
 **/

public class OccurrenceCounter {

    /**
     * @description: Method to count the occurrence of every character in it using
     *               countMatches string method.
     * @author: Sonali Kakade
     * @date: 10-May-2017
     **/
    public static void findOccurrenceUsingCountMatches(String inputString) {
        if(String.isBlank(inputString)) {
            System.debug('Null value found as input.');
            return;
        }
        // inputString = inputString./* toLowerCase().*/remove(' ');
        Set<String> uniqueChar = new Set<String>(inputString.split(''));
        // Map<String, Integer> countMap = new Map<String, Integer>();
        System.debug('Character\tOccurrence');
        for(String singleChar : uniqueChar) {
            // countMap.put(singleChar, inputString.countMatches(singleChar));
            System.debug('\t\t' + singleChar + '\t\t\t\t\t' + inputString.countMatches(singleChar)); 
        }
        /* System.debug('Character\tOccurrence');
        for(String singleChar : countMap.keySet()) {
           System.debug('\t\t' + singleChar + '\t\t\t\t\t' + countMap.get(singleChar));
        } */
    }
    
    /**
     * @description: Method to count the occurrence of every character in it using Map.
     * @author: Sonali Kakade
     * @date: 10-May-2017
     **/
    public static void findOccurrenceUsingMap(String inputString) {
        if(String.isBlank(inputString)) {
            System.debug('Null value found as input.');
            return;
        }
        List<String> characterList = inputString.split('');
        Set<String> uniqueChar = new Set<String>(characterList);
        Map<String, Integer> countMap = new Map<String, Integer>();
        System.debug('Character\tOccurrence');
        for(String singleChar : characterList) {
             if(!countMap.containsKey(singleChar)) {
                countMap.put(singleChar, 1);
            } else {
                countMap.put(singleChar, countMap.get(singleChar) + 1);
            }
        }
        for(String singleChar : countMap.keySet()) {
            System.debug('\t\t' + singleChar + '\t\t\t\t\t' + countMap.get(singleChar)); 
        }
    }
}