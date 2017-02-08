class Score
{
  int hiScore;
  
  Score(TableRow row)
  {
    hiScore = row.getInt("hiScore");
  }
  
  String toString()
  {
    return hiScore + "\t";
  }
}