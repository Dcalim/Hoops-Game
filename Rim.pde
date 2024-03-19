class Rim
{
  private float xPos, yPos;
  //Creates a float variable for the rims xPos and yPos
  //this would control where the rim would display
  
  private float xSize = 100;
  //Creates a float variable for the rims xSize
  //This would control how wide the hoop is
  
  private float ySize = 30;
  //Creates a float variable for the nets ySize
  //This would just create an illusion to make it look moew like a hoop
  
  private int score = 0;
  //Variable score is created to keep track of every basket made
 
 
  Rim()
  //Constructor 
  {
    xPos = random(100, width-100);
    //I have the xPos be generated from the random generation
    //I have it set from 100 to height-100 so that the rims do not 
    //generate half into the wall
    
    yPos = random(300, height-100);
    //I have the yPos be generated from the random generation
    //I have it set from 300 to height-100 so that the rims do not 
    // generate at the top of the screen where it is close to impossible
    //for the ball to go through the top of net. 
  }
  
  int getScore()
  //this getScore method is used in the displayScore void in the main method
  //This getScore method is used to get the total score of the game
  {
   return score; 
   //returns the value of score when it is called
  }
  
  float getXPos()
  //this getXPos method is used to compare where other objects are such as the powerball or basketball
  //This getXPos method is used to get track if the ball has hit the rim
  {
   return xPos; 
   //Returns the value of xPos when it is called
  }
  
  float getYPos()
  //this getYPos method is used to compare where other objects are such as the powerball or basketball
  //This getYPos method is used to get track if the ball has hit the rim
  {
   return yPos;
    //Returns the value of xPos when it is called
  }
  
  float getXSize()
  //this getXSize method is used to compare where other objects are such as the powerball or basketball
  //This getXSize method is used to get track if the ball has hit the rim
  {
   return xSize; 
    //Returns the value of xsize when it is called
  }
  
  float getYSize()
  //this getYSize method is used to compare where other objects are such as the powerball or basketball
  //This getYSize method is used to get track if the ball has hit the rim
  {
   return ySize; 
   //Returns the value of ySize when it is called
  }
  
  
  void reset()
  //method will reset the score 
  //only runs when the boolean game is false
  {
    score = 0; 
    //Resets the score from each basket to 0

  }
  
  void madeBasket(float ballX, float ballY, float ySpeed)
  //void madeBasket calls for variables of ballX, ballY, and the ySpeed
  {
    
    if(ballX > xPos - (xSize/2) && ballX < xPos + (xSize/2))
    //checks if the basketballs xPos is between the left edge of the rim and the right edge of the rim
    //if this is true next will run
    {
     if(ballY > yPos - ySize && ballY < yPos + ySize)
     //It then checks if the basketball is between the same height level of the top of the rim or bottom of rim
     //if this is true next will run
     {
       if(ySpeed > 0)
       //If this is true it means that the ball is moving downwards and is going through the hoop from the top
       //if this is true next will run
       {
          score++;
          //If all is true then it means the basketball has gone through the top of the hoop and a basket is counted
          //The score will increase by 1 to show that the player has scored
          
          xPos = random(100, width-100);
          //After a basket is made a new xPos is generated for the next to display at
    
          yPos = random(300, height-100);
          //After a basket is made a new yPos is generated for the next to display at
            
    
       }
     }
    }
  }
  
  
  void display()
  //The display void method control how the rim looks like
  {
    noFill();
    //There is no fill for the net to make it look like a ring
    
    stroke(255);
    //the stroke of the rim is in the colour white
    
    strokeWeight(10);
    //The stroke width is at 10 pixels
    
    ellipseMode(CENTER);
    //the ellipse mode is set to center
    
    ellipse(xPos, yPos, xSize, ySize);
    //The circle or hoop will display at the random x and y pos with the value of xSize and ySize for how large the hoop is
  }
  
}
