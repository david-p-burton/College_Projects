class Radar
{
  float x;
  float y;
  float size;
  //big hand
  float end;
  //small hand
  float end2;
  //med hand
  float end3;
  
  Radar(float x, float y, float size)
  {
    this.x = x;
    this.y = y;
    this.size = size;
    end = 0;
    end2 = QUARTER_PI;
    end3 = PI;
  }
  
  void render()
  {
    noFill();
    for(int i = 0; i < 4 ; i++)
    {
      ellipse(x, y, (size/3) * i, size);
      ellipse(x, y, size, (size/3) * i);
    }
    
    /*
    ellipse(x, y, 1.35*size, 1.35*size); 
    ellipse(x, y, 4*size/5, 4*size/5);
    ellipse(x, y, size/3, size/3);
    */
    end += 0.01f;
    end2 += 0.3f;
    end3 += 0.05f;
    fill(100);
    line(x + 2 * size/3, y, x - 2 * size/3, y);
    line(x, y + 2 * size/3, x, y - 2*size/3);
    if(end < 2*PI)
    {
      noStroke();
      fill(47, 255, 33);
      arc(x, y, size/3 , size/3, end2 - 0.2, end2, PIE);
      fill(255, 192, 33);
      arc(x, y, 2*size/3, 2*size/3, end3 - 0.2, end3, PIE);
      fill(255, 33, 33);
      arc(x, y, size, size, end - 0.2, end, PIE);
      
    }
    else
    {
      end = 0;
      end2 = 0;
    }
    arc(x, y, size, size, end - 0.2, end, PIE);
  }
}