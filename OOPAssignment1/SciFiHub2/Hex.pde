class Hex
{
  float x, y, number, radius, size;
  PVector pos;
  PShape shape;
  
  Hex(float x, float y, float number, float size)
   {
     pos = new PVector(x, y);
     this.size = size;
     this.number = number;     
   }
  
  void render()
  {
    pushMatrix();
    translate(x, y);
    rotate(PI);
    shape = createShape();
    shape.beginShape();
    shape.stroke(255, 160, 0);
    noFill();
    shape.strokeWeight(1);
    for (int i = 0; i < 6; i++) 
    {
      pushMatrix();
      float angle = PI * i / 3;
      shape.vertex(cos(angle) * size, sin(angle) * size);
      popMatrix();
    }
    endShape(CLOSE);
    popMatrix();
  }
}