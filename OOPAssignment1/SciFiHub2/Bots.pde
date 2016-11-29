class Bots extends Icon
{
  float moveX, moveY, addX, addY;
  
  Bots(float x, float y, String picName, float size)
  {
    super(x, y, picName, size);
  }
  
  void render()
  {
    pic.resize((int)size, (int)size);
   
    if(frameCount % 25 == 0)
    {
      addX = random(-0.5,0.5);
      if((moveX > 10 && addX > 0) || (moveX < -10 && addX < 0))
      {
        addX *= -1;
      }
      moveX += addX;
    }
    if(frameCount % 10 == 0)
    {
      addY = random(-1,1);
      if((moveY > 10 && addY > 0) || (moveY < -10 && addY < 0))
      {
        addY *= -1;
      }
      moveY += addY;
    }
    
    image(pic, x+moveX, y+moveY);
  }
  
}