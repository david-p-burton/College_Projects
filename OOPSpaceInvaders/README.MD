<h1>(Kind of Like) Gradius</h1>

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/hZUcTgwDut4/0.jpg)](https://youtu.be/hZUcTgwDut4)

This project is my video game project for my OOP module at DIT. For this module we were tasked with making a game or recreating
an old game. For this project I chose to remake an old Japanese 1985 title called Gradius. 
The project is located in the OOPSpaceInvaders/SpaceInvaders folder in this repo (I had initially planned to do space invaders
but prefered the idea of Gradius).

<h2>Controls</h2>
Menu
  - w to select up
  - s to select down
  - SPACE BAR to select an option
  
Game Play
  - w to move up
  - s to move down
  - SPACE BAR to shoot
  
<h2>Functionality</h2>
This project takes advantage of many Object Orientated concepts. Most of the game is built around polymorphism for example,
as most objects in the game (such as the enemies, bullets, powerups and even the player) are all of type gameObject with their
own subclasses. The game, in essence, is these different objects, all in one ArrayList, interacting with each other in different
ways.

Some of this was made possible with the use of interfaces e.g how the powerups interact with the player. I have made extensive
use of classes, both abstract as well as classes that can be instanciated.

Seperate to the game objects ArrayList is the stars in the background of this game. They have their own seperate ArrayList. Upon reaching off screen to the left, they are placed off screen to the right, giving the illusion of the player flying through space. To exhance this illusion further, all stars travel from right to left to give the illusion of great speed.

<h2>Things of Note</h2>
The main things to note in this project is how the gameObjects ArrayList is used. Each object in the game inherits from the abstract class GameObject. This allows me to put every game object into the same ArrayList and allows the differnt classes in the list to have their own methods such as draw and update while only having to call these similarly named methods only once.

The other main thing of note is the stars which appear in the background of the game. While these were fairly simple to do,
they look quite impressive in my opnion. All thats needed is the Stars class, a for loop to populate an ArrayList with Stars objects, and then calling the method to display them. When a star is created, it is randomly assigned one of two possible shapes, a colour (shade/tint), a size, speed and a speed of rotation. I really like how the effect of these stars make it feel like the player is travelling though space in their ship.
