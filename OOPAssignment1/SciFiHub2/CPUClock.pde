class CPUClock
{
  int num;
  float step, sz, offSet, theta, angle, test, test1, x, y;
  
  CPUClock(float x, float y)
  {
    this.x = x;
    this.y = y;
    step = 22;
    num = 10;
  }
  
  void render() 
  {
    strokeWeight(5);
    float percent = (float)(100*(double)usedMemory()/totalMemory());
    percent = map(percent, 0, 100, 0, (2*PI));
    angle=0;
    for (int i=0; i<num; i++) 
    {
      stroke(255);
      noFill();
      sz = i*step;
      float offSet = TWO_PI/ num * i;
      float arcEnd = map(sin(theta+offSet),-1,1, PI, TWO_PI);
      arc(x, y, sz, sz, QUARTER_PI + PI, percent +  QUARTER_PI + PI);
    }
    colorMode(RGB);
    resetMatrix();
    theta += .0523;
    test = totalMemory() / 10000000;
    test1 = usedMemory() / 10000000;  
    println(test + " MB total.");
    println(test1 + " MB used.");
    strokeWeight(1);
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