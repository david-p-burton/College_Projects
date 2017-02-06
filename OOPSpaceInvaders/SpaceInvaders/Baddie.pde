class Baddie extends GameObject
{
  PShape shape;
  float radius, radius2, radius3;
  
  Baddie(float x, float y)
  {
    pos = new PVector(x, y);
    radius = 35;
    radius2 = radius/2;
    radius3 = radius/4;
    create();
  }
  
  void create()
  {
    /*
    shape = createShape();
    shape.beginShape();
    shape.stroke(255);
    shape.fill(255);
    shape.vertex(-radius, 0);
    shape.vertex(+radius, -radius);
    shape.vertex(-radius, radius);
    shape.endShape(CLOSE);
    */
    shape = createShape();
      shape.beginShape();
      shape.stroke(255, 165 ,0);
      shape.fill(255, 165 ,0);
      shape.vertex(0, radius);
      shape.vertex(radius2, 0);
      shape.vertex(radius, 0);
      shape.vertex(radius2, -radius2);
      shape.vertex(+3*radius3, -radius + (radius3/2));
      shape.vertex(0, +radius);
      shape.vertex(-3*radius3, -radius + (radius3/2));
      shape.vertex(-radius2, -radius2);
      shape.vertex(-radius, 0);
      shape.vertex(-radius2, 0);
      shape.vertex(0, radius);
      shape.endShape(CLOSE);
  }
  
  void update()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(PI/2);
    shape(shape, 0, 0);
    popMatrix();
    
    //if player loses the game
    if(pos.x < 75)
    {
      gameState = 3;
    }
  }
  
  void render()
  {
    pos.x -= 5;
    
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