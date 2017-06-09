public class StringOperations
{
    public static void performOPerations()
    {
    	StringOperations operation = new StringOperations();
    	String inputString = 'Welcome to @pex Programming';
		inputString = operation.replaceCharacter(inputString);
    	operation.printSubstring(inputString);
    	operation.splitString(inputString);
    	operation.removeSpaces(inputString);
    	operation.printUpperCase(inputString);
    	operation.printLowerCase(inputString);
    }
    
    public String replaceCharacter(String inputString)
    {
    	String outputString = inputString.replace('@','A');
    	System.debug('After Replacement String is: '+outputString);
    	System.debug('----------------------------------------------------------');
    	return outputString;
    }
    
    public void printSubstring(String inputString)
    {
    	String outputString = inputString.substring(11,27);
    	System.debug('Substring is: '+outputString);
    	System.debug('----------------------------------------------------------');
    }
    
    public void splitString(String inputString)
    {
    	String[] arrayString = inputString.split(' ');
    	System.debug('String after splitting:');
    	for (String word : arrayString)
    		System.debug(word);
    	System.debug('----------------------------------------------------------');
    }
    
    public void removeSpaces(String inputString)
    {
    	String outputString = inputString.replace(' ','');
    	System.debug('After Removing Spaces String is: '+outputString);
    	System.debug('----------------------------------------------------------');
    }
    
    public void printUpperCase(String inputString)
    {
    	String outputString = inputString.toUpperCase();
    	System.debug('Upper Case: '+outputString);
    	System.debug('----------------------------------------------------------');
    }
    
    public void printLowerCase(String inputString)
    {
    	String outputString = inputString.toLowerCase();
    	System.debug('Lower Case: '+outputString);
    }
}