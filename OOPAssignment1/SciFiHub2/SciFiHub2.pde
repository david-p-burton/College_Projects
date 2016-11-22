import ddf.minim.*;
Minim minim;
AudioPlayer song;

PImage open, nerv;
PFont f, p, b;
Button vitals, mechBody, computer, mapMe, back, quit;
Clock regClock;
Radar menu;
CPUClock yourCpu;

/*
Name; David Burton
Student Number; C15802086
Uses; Minim
Descriptor; This project is inspired by the animated series "Neon Genesis Evangelion" and its movies,
"Neon Genesis Evangelion: Death & Rebirth" and "The End of Evangelion" as well as the series of remakes
dubbed "Rebuild". 
The interface modelled here is my imagining of what a technician in this sci-fi series might see when
overseeing a mission being carried out by one of the series' many robots (mechs).
*/

void setup()
{
  size (1280, 800);
  background(0);
  open = loadImage("TitleScreen.jpg");
  nerv = loadImage("nerv.png");
  nerv.resize(200, 200);
  regClock = new Clock(width - 145, height -200);
  //opening font
  f = createFont("digital-7.ttf", 72, true);
  //memory font
  p = createFont("digital-7.ttf", 10, true);
  //button font
  b = createFont("digital-7.ttf", 10, true);
  //button x y size stateChange
  vitals = new Button(100, 100, 40 , 4, "PILOT\nVITALS");
  mechBody = new Button(vitals.pos.x, vitals.pos.y + seperate, vitals.size, 5, "MACHINE\nINTEGRITY");
  computer = new Button(vitals.pos.x, mechBody.pos.y + seperate , vitals.size, 6, "COMPUTER\nSYSTEMS");
  mapMe = new Button(vitals.pos.x, computer.pos.y + seperate, vitals.size, 7, "MAP");
  back = new Button(vitals.pos.x, vitals.pos.y + (5.5*seperate), vitals.size, 3, "BACK");
  quit = new Button(vitals.pos.x, mapMe.pos.y + seperate, vitals.size, 8, "EXIT");
  menu = new Radar(width - 110, 115, 160);
  yourCpu = new CPUClock(width - 110, 400);
  //audio stuff
  minim = new Minim(this);
  song = minim.loadFile("Oblivion4OOP.wav", 512);
}

//global variables
int gameState = 0;
float seperate = 80;
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
     case 4:
     {
       vitals();

       break;
     }
     case 5:
     {
       background(0, 255, 0);
       mechBody();
       break;
     }
     case 6:
     {
       background(0, 0, 255);
       computer();
       break;
     }
     case 7:
     {
       background(255, 0, 255);
       mapMe();
       
       break;
     }
     case 8:
     {
       quitScreen();
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
  noTint();
  background(0);
  //stroke(255);
  vitals.render();
  vitals.update();
  mechBody.render();
  mechBody.update();
  computer.render();
  computer.update();
  mapMe.render();
  mapMe.update();
  menu.render();
  quit.render();
  quit.update();
  regClock.placeClock();
  yourCpu.render();
  image(nerv, 0, height - 210);
}

void boot()
{
  background(random(255), 0, 0);
  fill(255, 160, 0);
  textFont(f, 120);
  text("W A R N I N G", width/2, (height/2) - 100);
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
    text("SYSTEM BOOT INITIALISED", width/2, (height/2)+150);
    }
    else
    {
      text("PRESS START", width/2, (height/2)+150);
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
  background(0);
  textFont(f, 50);
  textAlign(CENTER, CENTER);
  if(x < 60)
  {
    text("LOADING. ", width/2, height/2);
  }
  else if(x >= 60 && x <= 120)
  {
    text("LOADING. . ", width/2, height/2);
  }
  else
  {
    text("LOADING. . .", width/2, height/2);
  }
  //after some seconds (amount denoted by no multiplied by 60)
  if(x == (60 * 3))
  {
    gameState = 2;
    //reset counter to zero for use elsewhere
    x = 0;
  }
}

void vitals()
{
  background(0);
  back.render();
  back.update();
  image(nerv, 0, height - 210);
  
}

void mechBody()
{
  back.render();
  back.update();
  image(nerv, 0, height - 210);
}

void computer()
{
  back.render();
  back.update();
  image(nerv, 0, height - 210);
}

void mapMe()
{
  back.render();
  back.update();
  image(nerv, 0, height - 210);
}

float quitFade = 31;
int adder = 5;
float secondary = 0;
float songSwitch = 0;
boolean[] keys = new boolean[1000];

void quitScreen()
{
  songSwitch++;
  if(quitFade < 30 || quitFade > 255)
  {
    adder *= -1;
  }
  if(songSwitch > 0)
  {
    song.play();
  }
  
  if (checkKey('q'))
  {
    exit();      
  }
  if (checkKey('w'))
  {
    songSwitch = 0;
    song.pause();
    song.rewind();
    gameState = 3;      
  }
  
  quitFade += adder;
  secondary = map(quitFade, 30, 255, 30, 160);
  background(quitFade, secondary, 0);
  fill(255, 0, 0);
  textFont(f, 100);
  text("PRESS Q TO TERMINATE PROCESS\n\nPRESS W TO SAVE HUMANITY", width/2, (height/2) - 100);
}

//reused from YASC
boolean checkKey(int k)
{
  if (keys.length >= k) 
  {
    return keys[k] || keys[Character.toUpperCase(k)];  
  }
  return false;
}//end checkKey()

void keyPressed()
{ 
  keys[keyCode] = true;
}//end keyPressed()
 
void keyReleased()
{
  keys[keyCode] = false; 
}