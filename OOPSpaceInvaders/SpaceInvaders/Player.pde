class Player extends GameObject
{
  PShape shape;
  int counter, lives;
  char up, down, fire;
  
  
  Player(float x, float y, char up, char down, char fire)
  {
    pos = new PVector(x, y);
    this.size = 20;
    this.up = up;
    this.down = down;
    this.fire = fire;
    this.lives = 3;
    this.counter = 0;
    
    create();
  }
  
  void create()
  {
    shape = createShape();
    shape.beginShape();
    shape.stroke(255);
    shape.fill(255);
    shape.vertex(size, 0);
    shape.vertex(-size, -size);
    shape.vertex(-size, size);
    shape.endShape(CLOSE);
  }
  
  void update()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    shape(shape, 0, 0);
    popMatrix();
  }
  
  void render()
  {
    if(checkKey(up) && pos.y > 20)
    {
      pos.y -= 5;
    }
    if(checkKey(down) && pos.y < (600 - 20))
    {
      pos.y += 5;
    }
    if(checkKey(fire))
    {
      if(counter > 0 && frameCount % 25 == 0)
      {
        counter = 0;
      }
      if(counter == 0)
      {
        Bullet t = new Bullet(pos.x, pos.y);  
        gameObjects.add(t);
        counter = 1;
      }
    }
  }
}