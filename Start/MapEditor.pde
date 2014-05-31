class MapEditor implements State{
  Game game;
  ArrayList<Tile> tileList = new ArrayList<Tile>();

 public MapEditor() {
   //standard map 416 by 416 w/ 16 x 16 tiles
  background(255,255,255);
  game = new Game();
   Start.grass = loadImage("sprites/grass.png");
  tileList.add(new GrassTile());
  tileList.add(new Road1Tile());
 }
 
 void draw() {
   game.draw();
   strokeWeight(4);
  line(0,416,416,416); 
  for (int i = 0; i < tileList.size(); i++) {
    tileList.get(i).draw(16 + (i * 16), 448);
  }



 }
 
 void keyPressed() {
   
 }
}
