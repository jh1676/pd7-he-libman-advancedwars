abstract class Tile{
   PImage img;
   int x, y, defense, moveCost;
   public Tile(int x, int y, int defense, int moveCost, PImage img){
     this.defense = defense;
     this.moveCost = moveCost;
     this.img = img;
     this.x = x;
     this.y = y;
   }
  
}
