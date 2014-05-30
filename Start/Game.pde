class Game implements State{
 Tile[][] tiles;
 
 public Game() {
   
 }
  void draw() {
     for (int a = 0; a < tiles.length; a++) {
      for (int b = 0; b < tiles[0].length; b++) {
       tiles[a][b].draw(a*16,b*16);
      } 
     }
  } 
  
  void keyPressed() {
    
  }
}
