Table test;
ArrayList<Expense> expenses = new ArrayList<Expense>();

void setup()
{
  Table test = loadTable("expenses.txt", "tsv");
  expenses.clear();
  
  println(test.getRowCount() + " total rows in table.");
  
  for(int row = 0; row < test.getRowCount(); row++)
  {
    Expense e = new Expense(test.getString(row, 0)
    , test.getString(row, 1)
    , test.getString(row, 2)
    , test.getFloat(row, 3)
    ,test.getFloat(row, 4)
    );
    
    expenses.add(e);
  }
  
  printAll();
  
}

void printAll()
{
  for (int i = 0; i < expenses.size(); i++) 
  {
    Expense part = expenses.get(i);
    println(part);
  }
}



void draw()
{
}