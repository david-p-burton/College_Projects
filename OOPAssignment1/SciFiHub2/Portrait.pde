class Portrait
{
  float x, y;
  PImage pic;
  
  Portrait(float x, float y, String picName)
  {
    this.x = x;
    this.y = y;
    pic = new PImage();
    pic = loadImage(picName);

  }
  
  void render()
  {
    
  }
  
  void update()
  {
    
  }
}