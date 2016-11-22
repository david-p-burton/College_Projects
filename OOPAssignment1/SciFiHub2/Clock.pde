class Clock
{
  int s, m, h;
  double ms;
  float x, y, seperate1;
  
  
  Clock(float x, float y)
  {
    this.x = x;
    this.y = y;
    seperate1 = 40;
  }
  
  void placeClock()
  {
    noStroke();
    fill(10, 10, 200);
    s = second();
    m = minute();
    h = hour();
    
    fill(255, 180, 0);
    textFont(f, 24);
    text(h % 24 + ":", x, y);
    text(m % 60 + ":", x + seperate1, y);
    text(s % 60, x + (2 * seperate1), y);
    text("LOCAL TIME", x + seperate1, y+(seperate1/2));
    text((h + 9) % 24 + ":", x, y + 1.5*seperate1);
    text(m % 60 + ":", x + seperate1, y + 1.5*seperate1);
    text(s % 60, x + (2 * seperate1), y + 1.5*seperate1);
    text("TOKYO-3 TIME", x + seperate1, y+(seperate1/2) + 1.5*seperate1);
    
  }
  
}