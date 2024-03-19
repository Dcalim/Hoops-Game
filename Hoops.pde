// Dion Calim
// January 9, 2023
// Processing Coding Assignment(Hoops)
// The goal of the game is to put the ball in the hoop as many times as you
// can before the time runs out. You are able to control the way the ball jumps
// by the click of your mouse and its x positioning on the screen
// As you play the game a power ball might appear on the screen get it before it disappears 
// Because it may give you a more time to play and beat your high score


Basketball ball = new Basketball(width/2, height/2);
//will create a object of the Basketball class with the parameters for the center of the screen
//this is so that the ball display right in the middle when game starts

String time;
//Sting time will be used later on to convert currentTime to a string variable
//This will be used to display the time on the screen

Rim[] net = new Rim[3];
//This will create 3 rim objects

int totalScore;
//int totalScore will hold the value of how many total baskets the user has made

boolean game = false;
//boolean game will be the switch of if the game will run or not
//booleean game will switch throughout the code

PowerUps power = new PowerUps();
//creates a object called power of the PowerUps class

String displayTime;
//This String variable will hold the number of remaining seconds in the game

Timer timer = new Timer();
//creates a object called timer to the Timer class

int countdownTime;
//This int will hold how much time is left in the game in seconds

int setTime = 20;
//This variable is used to set the countdown time to the time limit before the game begins
//I have this variable incase I wanted to change how long the game lasts

void setup()
{
  timer = new Timer();
  //Initializes timer as a object

  countdownTime = setTime;
  //sets the countdownTime to the setTime;

  power = new PowerUps();
  //Initializes power as a object

  size(1000, 700);
  //Creates a screen size of 1000 pixels wide and 700 pixels in height

  ball = new Basketball(width/2, height/2);
  //calls the constructor Basketball
  //uses width/2 and height/2 to set where the ball is first before the game begins
  //In this the Basketball will start in the center of the screen

  smooth();
  //Adds Anti-Aliasing
  //It will smooth the edges

  for (int i = 0; i < net.length; i++)
    //For loop that will iterate through how many rim objects there are
    //This is used to call the Rim constructor 3 times and generate a random x and y position
    //for the nets to appear on the screen
  {
    net[i] = new Rim();
    //This will call the rim constructor which will generate a random x and y position
  }
}

void draw()
  //This will display and will run everytime a variable is updated
{
  background(#11094D);
  //Creates a purple Background

  ball.display();
  //Calls the display method in the basketball class
  //Method will display how the ball looks


  if (game == true)
    //Once there is a mouse click boolean game will become true
    //therefore this if statement will run and the game will begin
  {

    if (timer.complete() == true)
      //calls the complete boolean method in timer class
      //and checks if the varialbe timePassed is still greater than Interval variable
      //If timePassed is greater than interval than this is true and will run
    {

      if (countdownTime > 0)
        //It will then check if the countDown time is greater than 0
        //If this is true this will run
      {
        countdownTime--;
        //If statement will result in the countdownTime variable to decrease by 1
      } else
        //If countdownTime is at 0 or anything below this will run
      {
        countdownTime = setTime;
        //Will set countdownTime back to 30 so once the game is started up again the countdown will reset back to 30

        game = false;
        //Will set game boolean to false which will result in the game not running anymore
        //When game is false the pop up menu will display
      }

      timer.start();
      //Calls the start void method to run from the Timer class
    }

    fill(255, 255, 255, 200);
    //Sets the fill to a opaque white colour

    textSize(60);
    //Sets the font size for the next text display to 100

    textAlign(CENTER);
    //Aligns the text to the center

    displayTime = "Time: " + countdownTime;
    //Will assign the int variable countdownTime as a string so that it can be used to display
    //The time while the game runs

    if (countdownTime > 5)
      //if countdownTime is above 5 then this will run
    {

      text(displayTime, width*8.5/10, height/10);
      //Will display the countdownTime in the top right corner of the screen
    }

    if (countdownTime <= 5)
      //if countdownTime becomes less than or equal to 5 then this will run
      //If statement is used to bring the text to the middle for the player to be more aware
      //thate time is running out
    {
      displayTime = str(countdownTime);
      //will display countdownTime as a string variable
      //sets displayTime to whatever the countdownTime is at so anything at or below 5

      textSize(100);
      //sets the text size to bigger to make the player more aware they do not have much time

      text(displayTime, width/2, height/2);
      //displays displayTime right in the middle for the player to see
    }

    displayScore(150, height/10);
    //The method display score will begin to run
    // Which will display the score of each basket made before the time runs out

    ball.fall();
    //The method fall in the basketball class will run
    //This method will act as gravity so the ball will fall and throughout the game

    ball.move();
    //The method move in the basketball class will run
    //This method will effect the x and y position of the ball depending on the x and y speed

    ball.hitBorder();
    //Calls the hitBoarder method
    //This only runs when the Ball hits the edges of the screen

    power.displayPowerup();
    //Will display the Power up ball
    //This will only display if the random number that is called from every mouse click generates the number 1

    power.movePowerup();
    //This will move the power up

    if (ball.getXPos() > power.getXPos()-20 && ball.getXPos() < power.getXPos() + 20)
      //In this if statement it will first call the basketballs xPos and the power balls xPos and compare them
      //If the baketballs xPos is between the power balls xPos -20(which is the left half of the power ball since the ellipse mode is center) and 
      //the power balls xPos +20(which is the right half of the power ball since the ellipse mode is center) then this would be true
    {
      if (ball.getYPos() > power.getYPos()-20 && ball.getYPos() < power.getYPos() + 20)
        //In this if statement it will first call the basketballs yPos and the power balls yPos and compare them
        //If the baketballs yPos is between the power balls yPos -20(which is the upper half of the power ball since the ellipse mode is center) and 
        //the power balls yPos +20(which is the bottom half of the power ball since the ellipse mode is center) then this would be true
      {
          //if all was true then this next would run
          
          countdownTime += 5;
          //The power balls ability gives the player a chance to increase the countdownTime by 5 seconds
          //countdownTime would increase by 5
          

          
          power.hit();
          //It would then call the hit method from the PowerUps class which would erase the power ball
          //and also set the onScreen boolean to false and also generate a random number 
          //Player would have to continue playing and clicking for another chance at the power ball
       
      }
    }

    for (int i = 0; i < net.length; i++)
    {
      net[i].display();
      //This will display each rim once iterated

      ball.hitRim(net[i].getXPos(), net[i].getYPos(), net[i].getXSize(), net[i].getYSize());
      //This will check if the ball has hit any of the rims and will check everytime the
      //ball is moved through the draw method

      net[i].madeBasket(ball.getXPos(), ball.getYPos(), ball.getYSpeed());
      //This will check if the ball has gone through any of the hoops and the basket is made
      //If a basket is made this will also be the function that adds to the totalScore
    }
  } else
    //This runs if boolean Game becomes false
    //Only runs when either the game is first booted up or if the times runs out
  {
    startUpScreen();
    //Will display the start up Screen

    displayScore(width/2, (height/3) * 2);
    //This will display the score of the last game played or 0 if it is the first time played
    //Score will be displayed middle of the screen and 2/3 from the top
  }
}




void mousePressed()
  //This void only runs when a mouse is pressed

{
  ball.jump();
  //When a mouse press occurs it will trigger the jump feature in the Basketball class to run
  //This feature makes the ball jump towards the x direction of your mouse


  if (game == false)
    //If a mouse press occurs while the boolean game is false this will run
    //this If function is used to reset the score because the game is over
  {
    game = true;
    //Switches boolean game to true because mouse press means that the user wants to play

    for (int i = 0; i < net.length; i++)
      //Will iterate through each rims score and reset each of them to 0
    {
      net[i].reset();
      //This sets each rim score back to 0;
    }
  }

  if (power.check() == false)
    //If statement to see if there is a power ball already displayed on the screen
    //if there is not than check() will return false and this will run
  {
    power.generatePowerup();
    //calls the generatePowerup function which just generates a random number from 0-100
    //If the number generated is 1 then a power ball will display the check will become true 
    //therefore this will not run
  }
}



void startUpScreen()
  //This is the void method for the main menu
  //This void will display the start up menu when the game is first ran or game is over
{
  PFont nameFont;
  //creates a font called nameFont

  String name = "Hoops";
  //String name will hold the name of the game which is "Hoops"

  nameFont = loadFont("AgencyFB-Bold-48.vlw");
  //Will load the Bold Arial font to variable nameFont

  textFont(nameFont);
  //This will allow whatever the next text used to be in the font held in nameFont variable

  fill(255);
  //This will make the fill colour of the text be white

  textSize(120);
  //Changes the font size to 120

  textAlign(CENTER);
  //will align the text to the middle

  text(name, width/2, height/5);
  //Will place the text in the middle of the screen towards the top
  //the text used will be whatever is held in the name variable


  String direction = "Click to Start";
  //String direction will hold the phrase "Click to start"
  //This is to display and tell the player how to start a new game

  fill(255);
  //creates a new fill of 255

  textSize(40);
  //makes a textSize of 40
  //a lot smaller than some of other fonts to bring away attention from the title

  textLeading(20);
  //Holds how much space there is between each word in the string
  //In this case direction

  textAlign(CENTER);
  //aligns the text to center

  text(direction, width/2, (height/5) * 4);
  //will display the string variable direction to the middle of the screen a fifth above from the bottom
}



void displayScore(float xPos, float yPos)
  //void method to display the score depending on the parameters passed when called

{
  for (int i = 0; i < net.length; i++)
    //Will iterate through each net object
    //This is used to get the score from each net since they will all hold different scores because they are seperate objects
  {
    totalScore += net[i].getScore();
    //gets each score from every net and assigns it to totalScore
    //this will hold how many baskets the player has made
  }
  fill(255, 255, 255, 200);
  //sets a fill to all white with a bit of a opaqueness

  textSize(55);
  //Makes the textSize 55

  String count = "Score: " + totalScore;
  //String count is to hold the number of totalScore
  //This variable will be used to display the score

  text(count, xPos, yPos);
  //displays the count variable to whatever parameters were used when this void was called

  totalScore = 0;
  //sets totalScore to 0 so that the score does not keep on increasing by however many baskets
  //ex, if 2 baskets are made and totalScore is not reset to 0 then totalScore will begin to 
  //increase by 2 from everytime the draw method is ran
}
