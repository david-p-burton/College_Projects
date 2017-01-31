abstract class GameObject
{
  PVector pos;
  float size;
  
  GameObject()
  {
  }
  
  abstract void create();
  abstract void render();
  abstract void update();
  
}