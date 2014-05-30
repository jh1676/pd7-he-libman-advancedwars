class MapEditor implements State{
  Game game;
  ArrayList<Tile> tileList = new ArrayList<Tile>();

 public MapEditor() {
   //standard map 416 by 416 w/ 16 x 16 tiles
   background(255,255,255);
  frame.setResizable(true);
  frame.setSize(480,416);
  frame.setResizable(false);
  
  game = new Game();
  tileList.add(new GrassTile());
  tileList.add(new Road1Tile());
 }
 
 void draw() {
   strokeWeight(4);
  line(416,0,416,416); 
  
  for (int i = 0; i < tileList.size(0); i++) {
   GrassTile.draw() 
  }
  for (int y = 16; i <= 400; i++) {
    
  }
 }
 
 void keyPressed() {
   
 }
}
