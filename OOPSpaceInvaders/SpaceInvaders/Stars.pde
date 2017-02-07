class Stars
{
  float shine, size, size2, size3, theta, shineAdd, travel;
  int chance;
  PShape shape;
  PVector pos;
  
  Stars()
  {
    pos = new PVector(random(-20, 900 + 20), random(0, 900));
    this.size = random(2, 12);
    this.size2 = size/2;
    this.size3 = size/4;
    this.shine = random(70, 180);
    this.shineAdd = 5;
    this.travel=random(0.1, 10);
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
      //shape of star original credit to Daniel Shiffman
      //https://processing.org/tutorials/pshape/
      shape = createShape();
      shape.beginShape();
      shape.stroke(shine);
      shape.fill(shine);
      shape.vertex(0, -50);
      shape.vertex(14, -20);
      shape.vertex(47, -15);
      shape.vertex(23, 7);
      shape.vertex(29, 40);
      shape.vertex(0, 25);
      shape.vertex(-29, 40);
      shape.vertex(-23, 7);
      shape.vertex(-47, -15);
      shape.vertex(-14, -20);
      shape.scale(random(0.05, 0.2));
      shape.endShape(CLOSE);
      
      
    }
  }
  
  void update()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    shape(shape, 0, 0);
    popMatrix();
  }
  
  void display()
  {
    pos.x -= travel;
    if(pos.x < -10)
    {
      pos.x = width + 20;
    }
    if(shine < 0 || shine > 255)
    {
      this.shineAdd *= -1;
    }
    this.shine += this.shineAdd;
  }
}