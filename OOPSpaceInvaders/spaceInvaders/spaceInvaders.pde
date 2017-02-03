/*
Name; David Burton
Student Number; C15802086
Commits;
Descriptor; This is my take on Space Invaders/Gradius/Japanese shoot 'em ups.
*/

import ddf.minim.*;
Minim gameMusic, menuMusic;
AudioPlayer menu, game;
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
ArrayList<Stars> stars = new ArrayList<Stars>();
boolean[] keyStrokes = new boolean[500];
Player player0;


void setup()
{
  size(900, 600);
  background(0);
  noCursor();
  gameMusic = new Minim(this);
  menuMusic = new Minim(this);
  menu = menuMusic.loadFile("flameMan.mp3", 512);
  game = gameMusic.loadFile("moon.mp3", 512);
  
  player0 = new Player(35, height/2, 'w', 's', ' ');
  gameObjects.add(player0);
  
  //test
  PowerFast test = new PowerFast(width - 600, random(10, height - 10) );
  //test
  gameObjects.add(test);
  
}

int gameState = 2;

void draw()
{
  
  
  switch(gameState)
  {
    case 0:
    {
      background(255,0,0);
      if(keyPressed)
      {
        gameState = 1;
      }
      break;
    }
    case 1: //setup/game menu?
    {
      
      break;
    }
    case 2: //game mode 1
    {
      background(0);
      //enemy spawn trigger
      if(frameCount % 150 == 0 || frameCount % 5 == 0)
      {
        enemySpawn();
      }
      if(frameCount % 300 == 0)
      {
        for(int i = 0; i < 4; i++)
        {
          enemySpawn();
        }
      }
      
      //this must be in ascending order as a sudden decrease in ArrayList size makes the compiler unhappy!
      //for(int i = gameObjects.size()-1; i >= 0; i--)
      for(int i = 0; i < gameObjects.size(); i++)
      {
        GameObject use = gameObjects.get(i);
        use.update();
        use.render();
      }
      game.play();
      break;
    }
    case 3: //game over
    {
      break; 
    }
    default:
    {
      
      break;
    }
  }
}

float spawnTimer = 180;

void enemySpawn()
{
  float x = width + 20; 
  float y = height / 5;
  
  if(frameCount % spawnTimer == 0)
  {
    for(int i = 0; i < 3; i++)
    {
      for(int j = 0; j < 1; j++)
      {
        Baddie b = new Baddie(x + (400/3 * i), y + (random(height/5, height - 250)));
        gameObjects.add(b);
      }
    }
  }
}

void keyPressed()
{
  keyStrokes[keyCode] = true;
}

void keyReleased()
{
  keyStrokes[keyCode] = false;
}

boolean checkKey(int a)
{
  if(keyStrokes.length >= a)
  {
    return keyStrokes[a] || keyStrokes[Character.toUpperCase(a)];
  }
  return false;
}