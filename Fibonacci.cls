public class Fibonacci
{
    public static void printFibonacci(Integer input)
    {
        Integer firstNumber=0, secondNumber=1, thirdNumber, i;
        if(input <= 0)
        {
        	System.debug('Please Provide Valid Input...');
        }
        else
        {
        	if(input == 1)
        	{
        		System.debug(firstNumber);
        	}
        	else
        	{
        		System.debug(firstNumber);
        		System.debug(secondNumber);
        		for(i = 0; i < input-2; i++)
        		{
            		thirdNumber = firstNumber + secondNumber;
            		System.debug(thirdNumber);
            		firstNumber = secondNumber;
            		secondNumber = thirdNumber;
        		}
        	}
        }
    }
}