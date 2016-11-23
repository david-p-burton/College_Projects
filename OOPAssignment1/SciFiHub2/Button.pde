class Button
{
   PVector pos;
   String message;
   int stateChange;
   float x, y, size, cornerX, cornerY, textSize;
   PShape butShape;
   
   Button (float x, float y, float size, int stateChange, String message)
   {
     pos = new PVector(x, y);
     this.size = size;
     this.stateChange = stateChange;
     this.message = message;
     cornerX = x - (size / 2);
     cornerY = y - (size / 2);
     
     create();
   }
   
  void create()
  {
    pushMatrix();
    butShape = createShape();
    butShape.beginShape();
    butShape.stroke(255, 160, 0);
    butShape.fill(255, 130, 5);
    butShape.strokeWeight(3);
    for (int i = 0; i < 7; i++) 
    {
      float angle = PI * i / 3;
      butShape.vertex(cos(angle) * size, sin(angle) * size);
    }
    popMatrix();
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    shape(butShape, 0, 0);
    textWrite();
    popMatrix(); 
  }
  
  void textWrite()
  {
    textAlign(CENTER, CENTER);
    if(message.length() > 4)
    { 
      textSize = map(size, 10, 80, 8, 30);
      textFont(b, textSize);
    }
    else
    {
      textSize = map(size, 10, 80, 10, 40);
       textFont(b, textSize);
    }
    fill(255);
    text(message, x, y);
  }
  
  void update()
  {
    if(mouseX >= cornerX && (mouseX < cornerX + size) && mouseY > cornerY && mouseY < cornerY + size && mousePressed && (mouseButton == LEFT)) 
    {
      gameState = stateChange; 
    }
  }
}