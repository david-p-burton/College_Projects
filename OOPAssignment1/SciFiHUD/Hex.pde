class Hex
{
  float x;
  float y;
  int side;
  int number;
  float radius;
  
  
  Hex(float x, float y, int side, int number
      , float radius)
  {
    
  }
  
  //drawing a hex/polygon
  void render(float x, float y, float radius) 
  {
    float angle = TWO_PI / 6;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) 
    {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}