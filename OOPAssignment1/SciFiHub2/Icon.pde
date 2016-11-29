class Icon extends Portrait
{
  float size;
  
  Icon(float x, float y, String picName, float size)
  {
    super(x, y, picName);
    this.size = size;
    pic = loadImage(picName);
  }
  
  void render()
  {
    pic.resize((int)size, (int)size);
    image(pic, x, y);
  }
  
  void statics()
  {
    pic.resize((int)size, (int)size);
    image(pic, x, y);
    tint(255, 100);
    image(pic, x + 7, y + 7);
    tint(255, 80);
    image(pic, x - 17, y + 7);
    tint(255, 255);
  }
}