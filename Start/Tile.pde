abstract class Tile{
   PImage img;
   int defense, moveCost;
   public Tile(int defense, int moveCost, PImage img){
     this.defense = defense;
     this.moveCost = moveCost;
     this.img = img;

   }
  
}
