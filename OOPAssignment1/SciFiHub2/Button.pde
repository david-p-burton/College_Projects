class Button
{
   PVector pos;
   int stateChange;
   float x, y, size;
   PShape butShape;
   
   Button (float x, float y, float size, int stateChange)
   {
     pos = new PVector(x, y);
     this.size = size;
     this.stateChange = stateChange;
     
     create();
   }
   
  void create()
  {
    pushMatrix();
    translate(x, y);
    butShape = createShape();
    butShape.beginShape();
    butShape.stroke(255, 160, 0);
    butShape.fill(255, 130, 5);
    butShape.strokeWeight(3);
    for (int i = 0; i < 6; i++) 
    {
      pushMatrix();
      float angle = PI * i / 3;
      butShape.vertex(cos(angle) * size, sin(angle) * size);
      popMatrix();
    }
    endShape(CLOSE);
    popMatrix();
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    shape(butShape, 0, 0);
    popMatrix(); 
  }

}