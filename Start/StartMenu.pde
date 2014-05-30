class StartMenu implements State{
 public StartMenu() {
  size(416,416);
  
 } 
 
 void draw() {
   textFont(Start.arial, 16);
   textAlign(CENTER);
   text("Press start to begin game. Press m to enter map editor", 213, 213);
 }
 
 void keyPressed() {
  if (key == 'm') {
    Start.s = new MapEditor();
  }
 }
}
