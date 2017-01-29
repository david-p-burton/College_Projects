class Player extends GameObject
{
  PShape shape;
  float radius;
  char up, down, fire;
  
  Player(float x, float y, char up, char down, char fire)
  {
    pos = new PVector(x, y);
    this.radius = 20;
    this.up = up;
    this.down = down;
    this.fire = fire;
    
    create();
  }
  
  void create()
  {
    shape = createShape();
    shape.beginShape();
    shape.stroke(255);
    shape.fill(255);
    shape.vertex(radius, 0);
    shape.vertex(-radius, -radius);
    shape.vertex(-radius, radius);
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
      
    }
  }
}