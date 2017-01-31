abstract class GameObject
{
  PVector pos;
  float size;
  
  GameObject()
  {
    //println("GameObj default constructor");
  }
  
  abstract void create();
  abstract void render();
  abstract void update();
  
}