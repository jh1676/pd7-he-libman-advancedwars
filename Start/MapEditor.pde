class MapEditor implements State{
  Game game;
 public MapEditor() {
   //standard map 416 by 416 w/ 16 x 16 tiles
  frame.setResizable(true);
  frame.setSize(480,416);
  frame.setResizable(false);
  game = new Game();
 }
 
 void draw() {
   strokeWeight(4);
  line(416,0,416,416); 
 }
 
 void keyPressed() {
   
 }
}
