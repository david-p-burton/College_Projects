class PowerSpread extends GameObject implements PowerUp
{
  PShape shape;
  
  PowerSpread(float x, float y)
  {
    pos = new PVector(x, y);
    this.size = 15;
    
    create();
  }
  
  void applyTo(Player p)
  {
    float temp = -100;
    for(int i = 0; i < 25; i++)
    {
      Bullet t = new Bullet(p.pos.x, p.pos.y + (temp + (15*i)));  
      gameObjects.add(t);
      p.counter = 1;
    }
  }
  
  void create()
  {
    shape = createShape();
    shape.beginShape();
    shape.stroke(255);
    shape.fill(255, 0, 255);
    shape.vertex(-10,-10);
    shape.vertex(-10,10);
    shape.vertex(10,10);
    shape.vertex(10,-10);
    shape.endShape(CLOSE);
  }
  
  void render()
  {
    pos.x -= 3 ;
  }
  
  void update()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    shape(shape, 0, 0);
    popMatrix();
  }
}