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

void draw()
{
  switch (gameState)
  {
     case 0:
     {
       loadIn();
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
  int ms = millis(); //values from 0 to 
  int s = second();  //values from 0 to 59
  int m = minute();  //values from 0 to 59
  int h = hour();    //values from 0 to 23
  fill(255, 180, 0);
  textFont(f, 16);
  text(h % 24, 10, height-40);
  text(m % 60, 35, height-40);
  text(s % 60, 60, height-40);
  text(ms % 1000, 85, height-40);
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
  background(255, 0, 0);
  gameState = 2;
}

//the main menu
void menu()
{
  
}

//blur effect to be used?
void blur()
{
  smooth();
  background(0);
  noStroke();
  fill(25,50,150);
  ellipse(500,500,210,210);
  filter(BLUR, 16);
  noStroke();
  fill(255,255,0);
  ellipse(500,500,150,150);
}