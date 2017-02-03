class Bullet extends GameObject
{
    PShape shape;
    float timeAlive, death;
    
    Bullet(float x, float y)
    {
      pos = new PVector(x, y);
      this.size = 10;
      this.timeAlive = 0;
      this.death = 3.0f;
      
      create();
    }
  
    void render()
    { 
      pos.x += 3.5;
      timeAlive += 1.0f/60.0f;
      if (timeAlive > death)
      {
        gameObjects.remove(this);
      }
    }
    
    void update()
    { 
      pushMatrix();
      translate(pos.x, pos.y);
      shape(shape, 0, 0);
      popMatrix();
    }
    
    void create()
    {
      shape = createShape();
      shape.beginShape();
      shape.stroke(255);
      shape.fill(255, 0, 0);
      shape.vertex(size, 0);
      shape.vertex(0, size);
      shape.vertex(-size, 0);
      shape.vertex(0, -size);
      shape.endShape(CLOSE);
    }
}