public class Basketball
{

  private float xPos, yPos, ySpeed, xSpeed;
  //Creates private float for xPos and yPos, ySpeed, xSpeed

  Basketball(float x, float y)
    //Constructor which assigns calls for two parameters
    //I have this so that the ball will always start in the middle
  {
    xPos = x;
    //converts the x parameter and assigns that value to xPos

    yPos = y;
    //converts the y parameter and assigns that value to yPos
  }

  float getXPos()
    //float get method
    //this is to return the xPos variable for other functions in the code
    //this is used especially in if statements
  {
    return xPos;
    //returns the value of xPos
  }

  float getYPos()
    //float get method
    //this is to return the yPos variable for other functions in the code
    //this is used especially in if statements
  {
    return yPos;
    //returns the value of yPos
  }

  float getYSpeed()
    //float get method
    //this is to return the ySpeed variable for other functions in the code
    //this is used especially in if statements
  {
    return ySpeed;
    //returns the value of ySpeed
  }


  void display()
    //this void method is to display the physical features of a basketball
  {
    xPos = constrain(xPos, 0, width-30);
    //constrains xPos so that it will never becomes less then 0 and no more than width-30

    yPos = constrain(yPos, 0, height-30);
    //constrains yPos so that it will never becomes less then 0 and no more than width-30

    stroke(0);
    //Sets the stroke color of the ball to 0

    strokeWeight(2);
    //Sets the stroke width to 2 pixels
    
    fill(#E39400);
    //Creates the fill colour to an orange for the basketball
    
    ellipseMode(CENTER);
    //Makes the ellipse mode to CENTER
    
    ellipse(xPos, yPos, 60, 60);
    //Creates a orange circle with a size of 60x60 
    //the position will change as ball jumps and falls
    
    noFill();
    //The next code will not have any fill
    
    line(xPos, yPos-30, xPos, yPos+30);
    //Creates a vertical line in the middle of the ball
    
    line(xPos - 30, yPos, xPos + 30, yPos);
    //Creates a horizontal line in the middle of the ball 
    
    bezier(xPos - 20, yPos - 20, xPos - 10, yPos - 5, xPos - 10, yPos + 10, xPos - 20, yPos + 20);
    //Left curve line of ball
    
    bezier(xPos + 20, yPos - 20, xPos + 10, yPos - 5, xPos + 10, yPos + 10, xPos + 20, yPos + 20);
    //Right curve line of ball
  }

  void fall()
  //This void is called in the draw method so it will always run
  
  {
    ySpeed+= .4;
    //increases speed by .4
    //Will make the ball fall faster and will act as gravity
    
  }

  void jump()
  //This void is called on a mouse click and will make the ball jump
  {
    ySpeed = -10;
    //Changes the y speed to -10
    

    if (mouseX > xPos)
    //If the mouses x position of mouse is on the right of the ball
    //This will run
    {
      xSpeed = 3;
      //Changes xSpeed to 3 which will make the xPos move to the right
      
    } 
    
    else
    //If the x position of mouse is on the left of the ball
    //This will run
    {
      xSpeed = -3;
      //Changes xSpeed to -3 which will make the xPos move to the left
      
    }
  }

  void hitRim(float rimX, float rimY, float rimXSize, float rimYSize)
  //The void hitRim function will run in the draw method
  //Function is used when the ball hits the rim
  {

    if (xPos >= rimX - rimXSize && xPos <= rimX - (rimXSize/2))
    //If ball hits towards the left side of the rim in the x axis then this runs
    //LEFT RIM
    {
      if (yPos <= rimY && yPos >= rimY - rimYSize)
      //It will then check if the yPos of ball is close to the y axis of the rim
      //If true then this will run
      {
        if (ySpeed > 0)
        //It will then check if the ySpeed is more than 0
        //If this is true it means that the ball is moving downwards and is going through the hoop from the top
        {
          ySpeed = -(ySpeed*.9);
          //Will change the direction of ySpeed and will multiply it by .9 to act as the ball not bouncing
          //as high after each bounce
          
          xSpeed = -(xSpeed*.9);
          //Will change the direction of xSpeed and will multiply it by .9 to act as the ball not bouncing
          //as far after each bounce
        }
      }
    } 
    
    else if (xPos <= rimX + rimXSize && xPos >= rimX + (rimXSize/2))
     //If ball hits towards the right side of the rim in the x axis then this runs
     //RIGHT RIM
    {

      if (yPos <= rimY && yPos >= rimY - rimYSize)
      //It will then check if the yPos of ball is close to the y axis of the rim
      //If true then this will run
      {
        if (ySpeed > 0)
        //It will then check if the ySpeed is more than 0
        //If this is true it means that the ball is moving downwards
        {
          ySpeed = -(ySpeed*.9);
           //Will change the direction of ySpeed and will multiply it by .9 to act as the ball not bouncing
          //as high after each bounce
          
          xSpeed = -(xSpeed*.9);
           xSpeed = -(xSpeed*.9);
          //Will change the direction of xSpeed and will multiply it by .9 to act as the ball not bouncing
          //as far after each bounce
        }
      }
    }
  }

  void hitBorder()
  //This is called in the draw method
  //Only will come into action if the ball hits the edges of the screen
  {
    if (xPos > width-30 || xPos < 30)
    //If the balls xPos hits the left edge of the screen or right edge of the screen
    {
      xSpeed = -(xSpeed*.9);
      //Changes the direction of the xSpeed and multiplys it by .9 to make the ball bounce not as far
      
    } 
    
    else if (yPos >= height-30 && abs(ySpeed) < .01)
    //If the yPos reaches the top of the screen and the absolute value of ySpeed is below .01
    //This would act as if the ball was rolling on the ground
    {
      ySpeed = 0;
      //Changes ySpeed to 0 so there is no bouncing feature
      
      yPos=height-30;
      //Makes the yPos to the bottom of the screen
      
    } 
    
    else if (yPos > height-30 || yPos < 30)
    //If the ball reaches the top or bottom of screen
    //This will run
    {
      ySpeed = -(ySpeed*.9);
      //Changes the direction of ySpeed and will multiply it by .9 and not make it bounce as high
      
    }
  }
  void move()
  //This move method acts to make the ball move
  //This method is called in the draw method
  {
    yPos += ySpeed;
    //Adds ySpeed to whatever the yPos
    //This will affect how high or low the basketball is at
    
    xPos += xSpeed;
    //Adds xSpeed to whatever the xPos
    //This will affect how the basketball moves on the x axis
  }
}
