class Timer
{
  private int startTime;
  //This int variable will hold when the timer starts
  
  private int timePassed;
  //This int variable will hold how much time has passed
  
  private int interval = 1000;
  //This int variable will hold how long each second last
  //1000 is equal to 1 second as the millis function is in milliseconds
 
 void start()
 //When this void is called it will set variable startTime to millis()
 //millis() holds how much time in milisecconds the program has been running for
 {
  startTime = millis();
  //sets variable startTime to however long the program has been running(millis())
 }
 
 boolean complete()
 {
  timePassed = millis() - startTime;
  //int timePassed will hold the countdown from 
  
  if(timePassed > interval)
  //If the varialbe timePassed is still greater than Interval the method will return true
  {
    return true;
    //Returns true which will trigger the countdown time in the main method to decrease by 1
  }
  
  else
  //Will run once there is no more time to be passed
  {
   return false; 
   //returns false which will trigger the if statement in the main method to run the else statement
   //This will result in the game ending as the else statement will switch the game boolean to false
  }
 }
}
