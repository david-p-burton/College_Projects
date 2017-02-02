class Player extends GameObject
{
  PShape shape;
  int counter, lives;
  float shotSpeed;
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
    this.shotSpeed = 25;
    
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
      if(counter > 0 && frameCount % shotSpeed == 0)
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
    
    for(int i = 0; i < gameObjects.size(); i++)
    {
      GameObject t = gameObjects.get(i);
      if(t instanceof PowerUp)
      {
        PowerUp p = (PowerUp)t;
        if(dist(t.pos.x, t.pos.y, this.pos.x, this.pos.y) < size + 5)
        {
          p.applyTo(this);
          gameObjects.remove(t);
        }
      }
    }
  }
}