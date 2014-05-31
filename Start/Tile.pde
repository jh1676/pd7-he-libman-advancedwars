abstract class Tile{
   PImage img;
   int x, y, defense, moveCost;
   public Tile(int x, int y, int defense, int moveCost, PImage img){
     this.x = x;
     this.y = y;
     this.defense = defense;
     this.moveCost = moveCost;
     this.img = img;

   }
   void draw(){
     image(img,x,y);
   }
  
  void setX(int x) {
   this.x = x;
  }
  
  void setY(int y) {
   this.y = y; 
  }
}
