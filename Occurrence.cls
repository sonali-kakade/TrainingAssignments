public class Occurrence
{
    public static void findOccurrence(String inputString)
    {
        inputString = inputString.toLowerCase().remove(' ');
        Set<String> uniqueChar = new Set<String>(inputString.split(''));
        Map<String, Integer> countMap = new Map<String, Integer>();
        for(String singleChar:uniqueChar)
        {
            countMap.put(singleChar, inputString.countMatches(singleChar)); 
        }
        System.debug('Character\tOccurrence');
        for(String singleChar : countMap.keySet())
        {
           System.debug('\t\t'+singleChar+'\t\t\t\t\t'+countMap.get(singleChar));
        }
    }
}