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

void draw()
{ 
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