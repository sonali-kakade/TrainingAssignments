/**
 * @description: OOPS Concepts - Question-1:
 *               Write a static method in a class and call it from another (nonstatic) class.
 * @author: Sonali Kakade
 *
 * @revision:
 * Version      Date            Description
 * ------------------------------------------------
 * 1.0          10-May-2017     Initial revision.
 **/

public class CallStaticMethodClass {

    /**
     * @description: Non static method to call static method of another class.
     * @author: Sonali Kakade
     * @date: 10-May-2017
     **/
    public void callStatic()
    {
        StaticMethodClass.display();
    }
}