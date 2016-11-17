PImage open;
PFont f;
ArrayList<Hex> buttons = new ArrayList<Hex>();
Button vitals;
Button mechBody;
Button computer;
Radar menu;
CPUClock yourCpu;


void setup()
{
  size (1280, 800);
  background(0);
  open = loadImage("TitleScreen.jpg");
  f = createFont("digital-7.ttf", 72, true);
  vitals = new Button(100, 100, 50, 6);
  mechBody = new Button(vitals.pos.x, vitals.pos.y + 150, vitals.size, 7);
  computer = new Button(vitals.pos.x, mechBody.pos.y + 150 , vitals.size, 8);
  menu = new Radar(width - 110, 115, 160);
  yourCpu = new CPUClock(width - 110, 400);
}

//global variables
int gameState = 0;
int x = 0;
int fade = 255;


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
       boot();
       break;
     }
     case 3:
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

void menu()
{
  background(0);
  stroke(255);
  vitals.render();
  mechBody.render();
  computer.render();
  menu.render();
  yourCpu.render();
}

void boot()
{
  background(random(255), 0, 0);
  fill(255, 160, 0);
  textFont(f, 120);
  text("W A R N I N G", (width/2) - 280, (height/2) - 100);
  if(keyPressed)
  {
    gameState = 3;
  }
  if(frameCount % 20 == 0)
  {
    x++;
  }
  if(x % 2 == 0)
  {
    if(x % 4 == 0)  {
    text("SYSTEM BOOT INITIALISED", (width/2) - 550, (height/2)+150);
    }
    else
    {
      text("PRESS START", (width/2) - 250, (height/2)+150);
    }
  }
}

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
       if(fade == 10)
       {
         gameState = 1;
       }
}

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