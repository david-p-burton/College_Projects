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
      //float offSet = TWO_PI/ (num * i);
      //float arcEnd = map(sin(theta+offSet),-1,1, PI, TWO_PI);
      arc(x, y, row, row, -HALF_PI, percent - HALF_PI);
    }
    //colorMode(RGB);
    resetMatrix();
    //theta += .0523;
    test = totalMemory() / 1000000;
    test1 = usedMemory() / 1000000;  
    //tests amount of MB set for this program
    //println(test + " MB total.");
    //println(test1 + " MB used.");
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