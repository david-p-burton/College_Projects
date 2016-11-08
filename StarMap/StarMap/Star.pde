class Star
{
  int hab;
  String name;
  float distance;
  float x;
  float y;
  float z;
  float mass;
  
 Star(TableRow row)
 {
   
   hab = row.getInt(2);
   name = row.getString(3);
   distance = row.getFloat(12);
   x = row.getFloat(13);
   y = row.getFloat(14);
   z = row.getFloat(15);
   mass = row.getFloat(16);
 }
  
  
  String toString()
  {
    return hab + "\t" + name + "\t" + distance + "\t" + x
     + "\t" + y + "\t" + z + "\t" + mass;
  }
  
  
}