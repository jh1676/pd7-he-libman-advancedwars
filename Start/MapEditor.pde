class MapEditor implements State {
  Game game;
  ArrayList<Tile> tileList = new ArrayList<Tile>();
  Tile selected = new GrassTile(0, 0);
  public MapEditor() {
    //standard map 416 by 416 w/ 16 x 16 tiles
    background(255, 255, 255);
    game = new Game();
    Start.grass = loadImage("sprites/grass.png");
    tileList.add(new GrassTile(0, 448));
    tileList.add(new Road1Tile(0, 448));
    for (int i = 0; i < tileList.size (); i++) {
      tileList.get(i).setX((400/(tileList.size() + 1) * (i +1)));
    }
  }

  void draw() {
    game.draw();
    strokeWeight(4);
    line(0, 416, 416, 416); 
    for (int i = 0; i < tileList.size (); i++) {
      tileList.get(i).draw();
    }
    mouseOver();
  }

  void mouseOver() {
    for (Tile t : tileList) {
      if (t.isMouseOver()) {
        int x = t.x;
        int y = t.y;
        fill(0, 0, 0);
        strokeWeight(2);
        triangle(x, y, x+2, y, x, y+2);
        triangle(x+16, y+16, x+14, y+16, x+16, y+14);
        triangle(x+16, y, x+14, y, x+16, y+2);
        triangle(x, y+16, x, y+14, x+2, y+16);
      }
    }
  }
  
  void mouseClicked () {
    for (Tile t : tileList) {
      if (t.isMouseOver()) {
       selected = t; 
      }
    }  
  }
  
  void keyPressed() {
  }
}

