class PowerUps
{
  private int randnum;
  //This int variable will what random number is generated
  //The number generated will decide if a powerUp displays or not
  
  private float ySpeed;
  //float ySpeed to display how fast the power ball moves
  
  private float xPos, yPos;
  //float xPos and yPos will hold where the power ball is on the screen
  
  private boolean onScreen = false;
  //boolean onScreen switches if there is a power ball already on the scren
  //I have this so that not multiple balls display on screen
  
  PowerUps()
  {
    xPos = random(50, width-50);
    //will generate a random number from 50-width-50
    //number will act for the xPos of the power ball
    
    yPos = random(0, 300);
    //Generates a random number from 0 to 300
    //number generated will act as the yPos of the power ball
  }

  void generatePowerup()
  //This method will generate a random number
  //This method is called when a mouse click occurs
  {
    
    randnum = (int)random(0, 30);
    //When the method is called a random number from 0 to 100 will generate
    //The number generated will dictate weather a powerBall will display or not
    
  }

  void displayPowerup()
  //Will display the powerUp if the random number generated is 1
  {
    if (randnum == 1)
    //If the number generated is 1 this will run
    //Means that the power ball for the add 5 second ball will occur
    // Add 5 second power ball
    {
      onScreen = true;
      //Changes onScreen boolean to true so that no more numbers will be generated as I only want 1 power ball
      //to display at a time
      
      fill(#FF27E6);
      //Makes the fill colour of the ball pink
      
      stroke(0);
      //Makes the stroke colour of ball black
      
      ellipse(xPos, yPos, 40, 40);
      //Makes the a circle with the size of 40x40 at the xPos and yPos generated before
      
      ySpeed = .5;
      //Assigns ySpeed to .5 which will make the ball move
    } 
  }
  
  float getXPos()
  //will call for a float number to return back to the main method
  //This method is used to return the variable xPos
  {
   return xPos;
   //Returns the value of xPos
   //This will be used in main method to see if the basketball has hit the power ball
  }
  
  float getYPos()
   //will call for a float number to return back to the main method
  //This method is used to return the variable yPos
  {
   return yPos; 
   //Returns the value of yPos
   //This will be used in main method to see if the basketball has hit the power ball
  }

  void movePowerup()
  //This void method will run to move the power ball
  {
    yPos += ySpeed;
    //updates yPos by adding ySpeed to the value everytime the draw method runs

    if (yPos > height)
    //If the powerBall has reaches the bottom of the screen then this will run
    {
      onScreen = false;
      //Power ball will not be on the screen anymore and every mouse click will begin generating random numbers
    }
  }
  
  boolean check()
  //This boolean method will return onScren
  //This method is used to see if a random number should be generated or not
  {
    return onScreen;
    //Returns the boolean onScreen to the main method
  }


  void hit()
  //This method is called when the Basketball has hit the power ball
  {
    yPos = 0;
    //Sets the yPos to 0
    
    onScreen = false;
    //sets onScreen to false which means each mouse click will generate a random number
    
    randnum = (int)random(0, 100);
    //random number will be generated so randnum does not remain 1
  }
  
}
