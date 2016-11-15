/*
MAJOR OVERHAUL COMING TO INCLUDE CLASSES, OBJECTS, ETC.
*/



//classes
PImage open;
PFont f;

void setup()
{
  size (1280, 800);
  background(0);
  open = loadImage("TitleScreen.jpg");
  f = createFont("digital-7.ttf", 72, true);
}

//variables
float fade = 255;
int gameState = 0;
int x = 0;

void draw()
{
  switch (gameState)
  {
     case 0:
     {
       loadIn();
       if(keyPressed)
       {
         gameState = 2;
       }
       break;
     }
     case 1:
     {
       loading();
       break;
     }
     case 2:
     {
       menu();
       break;
     }
     default:
     {
       exit();
       break;
     }
    
  }
  
  
  
}

//clock using custom font
void clock()
{
  noStroke();
  fill(10,10,180);
  ellipse(78, height-48, 145, 40);
  
  //time
  int ms = millis(); //values from 0 to 999
  ms = ms % 1000;
  int s = second();  //values from 0 to 59
  int m = minute();  //values from 0 to 59
  int h = hour();    //values from 0 to 23
  String sa = nf(ms, 3);
  
  fill(255,255,0);
  ellipse(78,height -48,150, 45);
  fill(255, 180, 0);
  textFont(f, 24);
  text(h % 24 + ":", 20, height-40);
  text(m % 60 + ":", 50, height-40);
  text(s % 60 + ":", 78, height-40);
  text(sa, 105, height-40);
}

//initial Title card
void loadIn()
{
  background(0);
       if (fade > 0)
       {
         fade -= 1.0;
       }
       tint(255, fade);
       open.resize(width, height + 10);
       image(open, 0, 0);
       //gameState = 5;
       if(fade == 10)
       {
         gameState = 1;
       }
}

//interstitial card for a little animation maybe?
void loading()
{
  x++;
  textFont(f, 50);
  if(x < 60)
  {
    text("LOADING. ", (width/2) - 50, (height/2) + 25);
  }
  else if(x >= 60 && x <= 120)
  {
    text("LOADING. . ", (width/2) - 50, (height/2) + 25);
  }
  else
  {
    text("LOADING. . .", (width/2) - 50, (height/2) + 25);
  }
  //after some seconds (amount denoted by no multiplied by 60)
  if(x == (60 * 3))
  {
    gameState = 2;
    //reset counter to zero for use elsewhere
    x = 0;
  }
}

//the main menu
void menu()
{
  float r = 22;
  float R = r * (2/sqrt(3));
  float xPos = (width) - 450;
  float yPos = height - 60;
  float yPos2 = yPos - (r * 2);
  background(1,244,255); 
  for(int i = 0; i < 10; i++)
  {
    //for drawing polygons at the bottom of screen
    if(i % 2 == 0)
    {
      xPos += R + 13;
      yPos += r;
      yPos2 += r + 2;
      fill(255, 0, 0);
      polygon(xPos, yPos, r + (r*0.2), 6);
      polygon(xPos, yPos2, r + (r*0.2), 6);
      fill(255, 180, 0);
      polygon(xPos, yPos, r, 6);
      polygon(xPos, yPos2, r, 6);
    }
    else
    {
      xPos += R + 13;
      yPos -= r;
      yPos2 -= r + 2;
      fill(255, 0, 0);
      polygon(xPos, yPos, r + (r*0.2), 6);
      polygon(xPos, yPos2, r + (r*0.2), 6);
      fill(255, 180, 0);
      polygon(xPos, yPos, r, 6);
      polygon(xPos, yPos2, r, 6);
    }
  }
  clock();
}

//warning sign
void warning()
{
  background(random(255), 0, 0);
}