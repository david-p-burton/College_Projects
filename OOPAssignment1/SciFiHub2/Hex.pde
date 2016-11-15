class Hex
{
  float x;
  float y;
  float number;
  float radius;
  
  Hex(float x, float y, float number, float radius)
  {
    this.x = x;
    this.y = y;
    this.number = number;
    this.radius = radius;
  }
  
  void render()
  {
    ellipse(x, y, radius, radius);
  }
}