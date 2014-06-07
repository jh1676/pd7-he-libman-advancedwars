abstract class Building {
  Player owner;
  
  boolean isNeutral() {
   return owner == null; 
  }
}
