import ddf.minim.*;
Minim minim, clicker;
AudioPlayer song, click;

PImage open, nerv;
Icon shinji1, rei, karl;
PFont f, p, b, jrpg;
Button vitals, mechBody, computer, back, quit;
Clock regClock;
Radar menu;
CPUClock yourCpu;
Table vitalList;
ArrayList<Pilot> vital = new ArrayList<Pilot>();

/*
Name; David Burton
Student Number; C15802086
Uses; Minim
Total number of commits so far; 17
Descriptor; This project is inspired by the animated series "Neon Genesis Evangelion" and its movies,
"Neon Genesis Evangelion: Death & Rebirth" and "The End of Evangelion" as well as the series of remakes
dubbed "Rebuild". 
The interface modelled here is my imagining of what a technician in this sci-fi series might see when
overseeing a mission being carried out by one of the series' many robots (mechs).
TO DO:
-Menu - Animation on grid
-Machine integrity - Content?
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
  //explain text
  jrpg = createFont("jrpg.otf", 10, true);
  //button x y size stateChange
  vitals = new Button(100, 100, 60 , 4, "PILOT\nVITALS");
  mechBody = new Button(vitals.pos.x, vitals.pos.y + seperate, vitals.size, 5, "MACHINE\nINTEGRITY");
  computer = new Button(vitals.pos.x, mechBody.pos.y + seperate , vitals.size, 6, "COMPUTER\nSYSTEMS");
  quit = new Button(vitals.pos.x, computer.pos.y + seperate, vitals.size, 8, "EXIT");
  menu = new Radar(width - 110, 115, 160);
  yourCpu = new CPUClock(width - 110, 400);
  back = new Button(yourCpu.x, height - 120, vitals.size, 3, "BACK");
  shinji1 = new Icon(width - 260, (height / 2) - 150, "shinji.png", 200);
  rei = new Icon(shinji1.x, shinji1.y, "rei.png", shinji1.size);
  karl = new Icon(shinji1.x, shinji1.y, "karl.png", shinji1.size);
  //audio stuff
  clicker = new Minim(this);
  minim = new Minim(this);
  song = minim.loadFile("NGEOP.mp3", 512);
  click = clicker.loadFile("click.wav", 512);
}

//global variables
int gameState = 0;
float seperate = 120;
int x = 0;
int fade = 255;


void draw()
{
  switch (gameState)
  {
    //title screen
     case 0:
     {
       loadIn();
       if(keyPressed)
       {
         gameState = 2;
       }
       break;
     }
     //loading
     case 1:
     {
       if(keyPressed)
       {
         gameState = 2;
       }
       loading();
       break;
     }
     //wait for user to press something
     case 2:
     {
       boot();
       break;
     }
     //main menu
     case 3:
     {
       menu();
       break;
     }
     //show pilot health stats (read in from .csv files)
     case 4:
     {
       vitals();
       break;
     }
     //The robots details
     case 5:
     {
       mechBody();
       break;
     }
     //computer details
     case 6:
     {
       background(0, 0, 255);
       computer();
       break;
     }
     //quit screen
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
  menu.render();
  quit.render();
  quit.update();
  regClock.placeClock();
  yourCpu.render();
  image(nerv, 0, height - 210);
  gridDraw();
}

float bootFade = 1;
float bootAdd = 10;

void boot()
{
  if(bootFade < 0 || bootFade > 255)
  {
    bootAdd *= -1;
  }
  bootFade += bootAdd;
  
  background(bootFade, 0, 0);
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

//pilot Vitals
void vitals()
{
  if (checkKey('1'))
  {
    pilotSelect = 1; 
    loadData();
  }
  if (checkKey('2'))
  {
    pilotSelect = 2;
    loadData();
  }
  if (checkKey('3'))
  {
    pilotSelect = 3; 
    loadData();
  }
  drawHealth();
  
  textAlign(CENTER, CENTER);
  textFont(f, 30);
 
  if(pilotSelect == 1)
  {
    shinji1.render();
    if(frameCount % 5000 >0 || frameCount % 5000 < 30){
    if((e = random(0, 100)) > 98)
    {
      shinji1.statics();
    }}
    text("Pilot - Shinji Ikari", shinji1.x + 105, shinji1.y - 10    );
  }
  else if(pilotSelect == 2)
  {
    rei.render();
    if(frameCount % 5000 >0 || frameCount % 5000 < 30){
    if((e = random(0, 100)) > 95)
    {
      rei.statics();
    }}
    text("Pilot - Rei Ayanami", shinji1.x + 105, shinji1.y - 10);
  }
  else if(pilotSelect == 3)
  {
    karl.render();
    if(frameCount % 5000 >0 || frameCount % 5000 < 30){
    if((e = random(0, 100)) > 92)
    {
      karl.statics();
    }}
    text("Pilot - Kaworu Nagisa", shinji1.x + 105, shinji1.y - 10);
  }
  
  textFont(p, 30);
  textAlign(CENTER);
  text("Press a number 1 - 3 for pilot health stats", width/2, 30);
  
}

float e;
void drawHealth()
{
  background(0);
  back.render();
  back.update();
  image(nerv, 0, height - 210);
  noFill();
  stroke(255, 180, 0);
  rect(cornerX + 50, 50, width - 550, height - 110);
  textFont(p, 20);
  textAlign(CENTER);
  //x-axis for time and y-axis for heartRate
  for(int i = 0; i < 15; i ++)
  {
    float w = cornerX + 50 + (i * (width - 550)/14);
    line(w, 50, w, height - 60);
    line(cornerX + 50, 50  + (49.4 * i), width -310, 50 + (49.4 * i));
    text((i * 10), w, height - 40);
  }
  
  for( int i = 0; i < 15; i++)
  {
    
    text( 150 - (i * 10), width - 290, 50 + (i * 49.4));
  }
  text("TIME (SECONDS)", (width/2) -30 , height - 20);
  pushMatrix();
  translate(cornerX + 45, height/2);
  rotate(-HALF_PI);
  text("Heart Rate (BPM)", 0, 0);
  popMatrix();
  for(Pilot p : vital)
  {
    flag ++;
    float x = map(p.time, 0, 120, cornerX + 55, width - 400);
    float y = map(p.heartRate, 0, 150, height - 110, 50);
    stroke(8, 232, 223);
    ellipse(x, y, 10, 10);
    if(flag > 1)
    {
      line(x, y, prevX, prevY);
    }
    prevX = x;
    prevY = y;
  }
  flag = 0;
}

float prevX;
float prevY;
int flag;
float add1 = 2;
float add = 1;
float interval = 195;

void mechBody()
{
  add1 += add;
  if(add1 > 65)
  {
    add1 = 2;
  }
  int sizeX = width/20;
  int sizeY = width/20;
  background(0);
  noStroke();
  fill(0, 180, 255);
  for(int i = 0; i < width + 60; i+=sizeX * 2)
  {
    for( int j = 0; j < height + 60; j++)
    {
      ellipse((((j + 1) % 2) * sizeY) - 55 + add1 + i ,(j * sizeY) + add1 - 55, sizeX + 20, sizeY);
    }
  }
  
  fill(0);
  rect(100, 50, width - 200, height - 250);
  rect(200, 50, width - 400, height - 100);
  
  fill(255);
  stroke(255);
  line(105, 55, width - 105, 55);
  line(105, 55, 105, height - 205);
  line(width - 105, 55, width - 105, height - 205);
  line(width - 105, height - 205, width - 205, height - 205);
  line(105, height - 205, 105 + 100, height - 205);
  line(205, height - 55, 205, height - 205);
  line(205, height - 55, width - 205, height - 55);
  line(width - 205, height - 55, width - 205, height - 205);
  
  textFont(jrpg, 24);
  textAlign(LEFT, CENTER);
  
  if((control + h) < 0)
  {
    h += reveal;
  }
  else if(control + h1 < 0 && (control + h) >= 0)
  {
    h1 += reveal;
  }
  else if((control + h2) < 0 && (control + h1) >= 0)
  {
    h2 += reveal;
  }
  else if((control + h3) < 0 && (control + h2) >= 0)
  {
    h3 += reveal;
  }
  else if((control + h4) < 0 && (control + h3) >= 0)
  {
    h4 += reveal;
  }
  else if((control + h5) < 0 && (control + h4) >= 0)
  {
    h5 += reveal;
  }
  else if((control + h6) < 0 && (control + h5) >= 0)
  {
    h6 += reveal;
  }
  noStroke();
  fill(255);
  //48 chars per line = 48 * 7 chars = 336
  text("The year is 20XX.15 years ago the world was rocked", 210, height - interval);
  text("by an event called \"The Impact\". Half the human", 210, height - interval + 20);
  text("population has been wiped out and humanity has", 210, height - interval + 40);
  text("been pushed back to the largest cities. Recently", 210, height - interval + 60);
  text("alien ships, known as Angels, have been attacking", 210, height - interval + 80);
  text("earth. A Japanese military group known as NERV", 210, height - interval + 100);
  text("has been formed to fight these Angels.", 210, height - interval + 120);
  fill(0);
  rect(width - 210, height - 200, control + h, 20);
  rect(width - 210, height - 200 + 20, control + h1, 20);
  rect(width - 210, height - 200 + 40, control + h2, 20);
  rect(width - 210, height - 200 + 60, control + h3, 20);
  rect(width - 210, height - 200 + 80, control + h4, 20);
  rect(width - 210, height - 200 + 100, control + h5, 20);
  rect(width - 210, height - 200 + 120, control + h6, 20);
  
  back.render();
  back.update();
  image(nerv, 0, height - 210);
}

int control = -860;
int h, h1, h2, h3, h4, h5, h6;
float reveal = 12;
//12

void computer()
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
  text("PRESS Q TO TERMINATE PROCESS\n\nPRESS W RESUME PROCESS", width/2, (height/2) - 100);
}

float cornerX = 190;
float cornerY;
float bCornerX;
float bCornerY;

void gridDraw()
{
  cornerY = ((height - 100) / 15) + 2;
  bCornerX = width - 410;
  bCornerY = height - 110.5;
  float increment = ((width - 100) / 15);
  float increment1 = (height - 100) / 15;
  noFill();
  stroke(255, 180, 0);
  rect(cornerX, cornerY, width - 410, height - 110.5);
  fill(255, 180, 0);
  //x
  for(int i = 1; i <= 11; i++)
  {
    line((increment * i) + cornerX, 50, (increment * i) + 130, height - 62 );
    line((increment * i) + 130, 50, (increment * i) + 190, height - 62 );
  }
  
  //y
  for(int i = 1; i <= 16; i++)
  {
    line(190, (increment1 * i) + 2, width - 220,(increment1 * i) + 2);
  }
  
  stroke(255);
}

int pilotSelect;

void loadData()
{
  switch(pilotSelect)
  {
    case 1:
    {
      vitalList = loadTable("shinji.csv", "header");
      populateArrayList();
      break;
    }
    case 2:
    {
      vitalList = loadTable("rei.csv", "header");
      populateArrayList();
      break;
    }
    case 3:
    {
      vitalList = loadTable("karl.csv", "header");
      populateArrayList();
    }
    default:
    {
      break;
    }
  }
}

void populateArrayList()
{
  for (int i = vital.size() - 1; i >= 0; i--) 
  {
    vital.remove(i);
  }

  for(TableRow row : vitalList.rows())
   {
     Pilot p = new Pilot(row);
     vital.add(p);
   }
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