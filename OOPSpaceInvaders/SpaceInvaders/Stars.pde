class Stars
{
  float shine, size, theta, shineAdd, travel;
  int chance;
  PShape shape;
  PVector pos;
  
  Stars()
  {
    pos = new PVector(random(-20, 900 + 20), random(0, 900));
    this.size = random(5, 25);
    this.shine = random(1, 255);
    this.shineAdd = 5;
    this.travel=random(1, 10);
    if(random(0, 100) > 50)
    {
      this.chance = 1;
    }
    else
    {
      this. chance = 2;
    }

    create();
  }
  
  void create()
  {
    if(chance == 1)
    {
      shape = createShape();
      shape.beginShape();
      shape.stroke(shine);
      shape.fill(shine);
      shape.vertex(size, 0);
      shape.vertex(0, size);
      shape.vertex(-size, 0);
      shape.vertex(0, -size);
      shape.endShape(CLOSE);
    }
    else if(chance == 2)
    {
      
      shape = createShape();
      shape.beginShape();
      shape.stroke(shine);
      shape.fill(shine);
      shape.vertex(0, size);
      shape.vertex(size/2, size);
      shape.vertex((3*size)/4, size/4);
      shape.vertex(size, 0);
      shape.endShape(CLOSE);
      
    }
  }
  
  void update()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    shape(shape, 0, 0);
    popMatrix();
    if(shine < 0 || shine > 255)
    {
      shineAdd *= -1;
    }
    shine += shineAdd;
  }
  
  void display()
  {
    pos.x -= travel;
    if(pos.x < -10)
    {
      pos.x = width + 20;
    }
  }
}