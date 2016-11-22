class CPUClock
{
  int num;
  float step, row, offSet, theta, angle, test, test1, x, y, diameter;
  String message = "MEMORY USAGE";

  CPUClock(float x, float y)
  {
    this.x = x;
    this.y = y;
    diameter = 220;
    step = 22;
    num = 10;
  }

  void render() 
  {
    strokeWeight(5);
    float percent = (float)(100 * (double)usedMemory()/totalMemory());
    percent = map(percent, 0, 100, 0, (TWO_PI));
    angle=0;
    for (int i=0; i<num; i++) 
    {
      stroke(255);
      noFill();
      row = i * step;
      arc(x, y, row, row, -HALF_PI, percent - HALF_PI);
    }
    resetMatrix();
    test = totalMemory() / 1000000;
    test1 = usedMemory() / 1000000;  
    strokeWeight(1);
    ellipse(x, y, diameter, diameter);
    textWrite();
  }

  void textWrite()
  {
    textAlign(CENTER);
    textFont(p, 30);
    fill(255);
    text(message, x, y  + (diameter + 45)/2);
    text(test + " MB TOTAL", x, y - (diameter + 10)/2);
  }

  long totalMemory() 
  {
    return Runtime.getRuntime().totalMemory();
  }

  long usedMemory() 
  {
    return Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
  }
}