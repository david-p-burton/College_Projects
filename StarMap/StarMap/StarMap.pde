/* Cool test idea Bryan!
Name; David Burton
student_no; C15802086
*/
Table starList;
ArrayList<Star> stars = new ArrayList<Star>();

void setup()
{
  size(800, 800);
  loadData();
  printStars();
}

//vert lines
float xgrid1 = 50;
float ygrid1 = 50;
float xgrid2 = 50;
float ygrid2 = 750;

//horz lines
float wgrid1 = 50;
float wgrid2 = 750;
float zgrid1 = 50;
float zgrid2 = 50;

//star drawing variables
float starX;
float starY;
float starMass;

//star text!
float cons = 30;
float xtext = 50;
float ytext = 50;
int free;

void draw()
{
  fill(220, 115, 215);
  stroke(220, 115, 215);
  textSize(20);
  
  for(int i = 0; i < 11; i++)
  {
    free = i - 5;
    text(free, xtext, cons);
    text(free, ytext, cons);
    xtext += (width - 100)/10;
    ytext += (width - 100)/10;
    
  }
  
  //draw a grid
  for(int i = 0; i < 12; i++)
  {
    line(xgrid1, ygrid1, xgrid2, ygrid2);
    line(wgrid1, zgrid1, wgrid2, zgrid2);
    xgrid1 += (width - 100)/10;
    xgrid2 = xgrid1;
    zgrid1 += (width - 100)/10;
    zgrid2 = zgrid1;
  }
  
  for(int i = 0; i < stars.size(); i++)
  {
    Star temp = stars.get(i);
    starX = map(temp.x, -5, +5, 50, width - 50);
    starY = map(temp.y, -5, +5, 50, height - 50);
    starMass = map(temp.mass, 0, 20, 0, 25);
    
    fill(255, 255, 0);
    ellipse(starX, starY, starMass, starMass);
  }
}

void printStars()
{
  for(int i = 0; i < stars.size(); i++)
  {
    Star part = stars.get(i);
    println(part);
  }
}

void loadData()
{
  Table starList = loadTable("stars.csv", "header");
  
  for(int i = 0; i < starList.getRowCount(); i++)
  {
    TableRow t = starList.getRow(i);
    Star temp = new Star(t);
    stars.add(temp);
  }
}