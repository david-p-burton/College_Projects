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
      
      shape = createShape();
      shape.beginShape();
      shape.stroke(shine);
      shape.fill(shine);
      shape.vertex(0, size);
      shape.vertex(size2, 0);
      shape.vertex(size, 0);
      shape.vertex(size2, -size2);
      shape.vertex(+3*size3, -size + (size3/2));
      shape.vertex(0, -size);
      shape.vertex(-3*size3, -size + (size3/2));
      shape.vertex(-size2, -size2);
      shape.vertex(-size, 0);
      shape.vertex(-size2, 0);
      shape.vertex(0, size);
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