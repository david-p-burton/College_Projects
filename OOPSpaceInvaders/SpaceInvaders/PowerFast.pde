class PowerFast extends GameObject implements PowerUp
{
  PShape shape;
  
  PowerFast(float x, float y)
  {
    pos = new PVector(x, y);
    this.size = 15;
    
    create();
  }
  
  void applyTo(Player p)
  {
    p.shotSpeed = 1;
  }
  
  void create()
  {
    shape = createShape();
    shape.beginShape();
    shape.stroke(255);
    shape.fill(0, 255, 255);
    shape.vertex(size, 0);
    shape.vertex(-size, -size);
    shape.vertex(-size, size);
    shape.endShape(CLOSE);
  }
  
  void render()
  {
    pos.x--;
  }
  
  void update()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    shape(shape, 0, 0);
    popMatrix();
  }
}