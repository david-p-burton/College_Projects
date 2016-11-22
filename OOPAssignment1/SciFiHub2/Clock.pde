class Clock
{
  int s, m, h;
  double ms;
  float x, y, size, seperate1;
  
  
  Clock(float x, float y, float size)
  {
    this.x = x;
    this.y = y;
    this.size = size;
    seperate1 = 40;
  }
  
  void placeClock()
  {
    noStroke();
    fill(10, 10, 200);
    //ellipse();
    ms = System.currentTimeMillis();
    s= second();
    m = minute();
    h = hour();
    //String msa = nf(ms, 3, 0);//turn ms into something printable
    println(ms);
    fill(255, 180, 0);
    textFont(f, 24);
    text(h % 24 + ":", x, y);
    text(m % 60 + ":", x + seperate1, y);
    text(s % 60 + ":", x + (2 * seperate1), y);
    //text(ms, x + (3 * seperate1), y);
    
  }
  
}