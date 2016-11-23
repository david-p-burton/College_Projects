class Pilot
{
  float time;
  float heartRate;
  float bPressure;
  float respiration;
  
  Pilot(TableRow row)
  {
    time = row.getFloat("Time");
    heartRate = row.getFloat("HeartRate");
    bPressure = row.getFloat("BloodPressure");
    respiration = row.getFloat("Respiration");
  }
  
  String toString()
  {
    return time 
    + "\t" + heartRate
    + "\t" + bPressure
    + "\t" + respiration 
    ;
  }
  
}