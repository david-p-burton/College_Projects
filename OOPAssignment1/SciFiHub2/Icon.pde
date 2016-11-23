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
    //println(size);
    pic.resize((int)size, (int)size);
    image(pic, x, y);
  }
}