/*
DATE:11/OCT/2016
..:;RULES FOR THE GAME OF LIFE;:..
If theres less than 2 cells the cell dies
if theres between 2 and 3 neightbours the cell survives
if theres more than 3 neighbour cells the cell dies.
*/

PFont f;
void setup()
{
  size(750, 750);
  f = createFont("Arial", 72,true); // Arial, 16 point, anti-aliasing on
  cellWidth = width / (float) rowCount;
  cellHeight = height / (float) colCount;
  setBoard();  
   /*THE TEST
  toggle(17, 4, true);
  toggle(17, 5, true);
  toggle(17, 6, true);
  toggle(18, 6, true);
  toggle(19, 5, true);
  */
}

  //global variables
  int rowCount = 100;
  int colCount = 100;
  boolean[][] board = new boolean[rowCount][colCount];
  //buffer for game of life
  boolean[][] copy = new boolean[rowCount][colCount];
  boolean[][] buffer = new boolean[rowCount][colCount];
  float cellWidth;
  float cellHeight;
  int time = 0;
  int x = 0;
  int generation = 0;
  int population = 0;

//set appropriate row and call them in the 2D array
void toggle(int row, int col, boolean alive)
{
  //check for out of bounds first
  //row greater than or = to 0 and less than total number of cells
  if(row >= 0 && row < rowCount && col >= 0 && col < colCount)
  {
    board[row][col] = alive;
  }
}

//set the initial state of the board
void setBoard()
{
  int state;
  for(int i = 0; i < rowCount; i++)
  {
    for(int j = 0; j < colCount; j++)
    {
      state = (int)random(0, 200);
      if(state > 80)
      {
        board[i][j] = true;
      }
      else
      {
        board[i][j] = false;
      }
    }
  }
}

//check if a cell is on the board
boolean getCell(int row, int col)
{
  if(row >= 0 && row < rowCount && col >= 0 && col < colCount)
  {
    return board[row][col];
  }
  else
  {
    return false;
  }
}

int getTime()
{
  if(frameCount % 60 == 0)
  {
    time++;
  }
  return time;
}

void calculate()
{
  for(int i = 0; i < rowCount; i++)
  {
    for(int j = 0; j < colCount; j++)
    {
      x = countLiveCells(i, j);
      
      
      //THIS LINE MAKES THE WHOLE THING WORK!!!
      //WHY WHY WHY???
      copy[i][j] = false;
      buffer[i][j] = false;
      
      
      //if dead with 3 neighbours, life
      if(board[i][j])
      {
        if(x < 2)
        {
          copy[i][j] = false;
        }
        if(x == 2 || x == 3)
        {
          copy[i][j] = true;
        }
        if(x >= 4)
        {
          copy[i][j] = false;
        }
      }
      if(board[i][j] == false)
      {
        if(x == 3)
        {
          copy[i][j] = true;
        }
      }
      x = 0;
    }  
  }
  arrayCopy(board, buffer);
  arrayCopy(copy, board);
  arrayCopy(buffer, copy);
}

int countLiveCells(int r, int c)
{
  int count = 0;
  for(int row = r - 1 ;row < r + 2 ; row ++)
  {
    for(int col = c - 1 ; col < c + 2 ; col ++)
    {
      if ((! (row == r && col == c)) && getCell(row, col))
      {
        count++;
      }
    }
  }    
  return count;
}

void draw()
{
  //stroke(120);
  if(frameCount % 2 == 0)
  {
    generation++;
    calculate();
    for(int i = 0; i < rowCount; i++)
    {
       for(int j = 0; j < colCount; j++)
       {
         if(board[i][j]) //buffer is a BOOLEAN i.e is already true or false
         {
           fill(0, 255, 255);
           rect(i * cellWidth, j * cellHeight, cellWidth, cellHeight);
         }
         else
         {
           fill(0);
           rect(i * cellWidth, j * cellHeight, cellWidth, cellHeight);
         }
      }
    }
  }  
      
  textFont(f, 16);
  fill(255, 0, 0);
  text("Time: " + (time = getTime()), 10, height-40);
  text("Generation: " + generation, 10, height-20);
}