/* Cool test idea Bryan!
Name; David Burton
student_no; C15802086
*/
Table starList;
ArrayList<Star> stars = new ArrayList<Star>();

void setup()
{
  size(800, 800);
  Table starList = loadTable("stars.csv", "header, csv");
  loadData();
  
}

void draw()
{ 
}

void printStars()
{
  /*
  for ()
  {
    Star part = stars.get(i);
    println(part);
  }
  */
}

void loadData()
{
  
  for(int i = 0; i < stars.size(); i++)
  {
    TableRow t = starList.getRow(i);
    Star temp = new Star(t);
    stars.add(temp);
  }
}