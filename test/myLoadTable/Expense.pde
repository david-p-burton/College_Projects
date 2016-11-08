class Expense
{
  
  String name;
  String party;
  String constituency;
  float returned;
  float claimed;
  
  Expense (String name, String con, String party
  , float returned, float claimed)
  {
    this.name = name;
    this.constituency = con;
    this.party = party;
    this.claimed = claimed;
    this.returned = returned;
  }
  
  String toString()
  {
    return name + "\t" + party + "\t" + constituency + "\t" + returned + "\t" + claimed;
  }
  
}