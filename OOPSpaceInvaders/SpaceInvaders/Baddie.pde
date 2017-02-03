class Baddie extends GameObject
{
  PShape shape;
  float radius;
  
  Baddie(float x, float y)
  {
    pos = new PVector(x, y);
    radius = 20;
    create();
  }
  
  void create()
  {
    shape = createShape();
    shape.beginShape();
    shape.stroke(255);
    shape.fill(255);
    shape.vertex(-radius, 0);
    shape.vertex(+radius, -radius);
    shape.vertex(-radius, radius);
    shape.endShape(CLOSE);
  }
  
  void update()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    shape(shape, 0, 0);
    popMatrix();
    if(pos.x < 78)
    {
      gameState = 0;
    }
  }
  
  /*
  needs to add in a method which removes the object from the gameObject 
  Am guessing that this method will go into the class of the object being removed.
  This will apply to all objects which need removal
  maybe a removal method in the gameObject class?
  */
  
  void render()
  {
    pos.x -= 3;
    
    for(int i = 0; i < gameObjects.size(); i++)
    {
      GameObject t = gameObjects.get(i);
      if(t instanceof Bullet)
      {
        if(dist(t.pos.x, t.pos.y, this.pos.x, this.pos.y) < radius + 5)
        {
          gameObjects.remove(t);
          gameObjects.remove(this);
        }
      }
      
    }
        
  }
}