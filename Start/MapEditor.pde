class MapEditor implements State {
  Game game;
  ArrayList<Tile> tileList = new ArrayList<Tile>();
  Tile selected = new GrassTile(0, 0);
  /*PImage selectedImg = Start.grass;
  int selectedDef = 1;
  int selectedMoveCost = 1; */
  public MapEditor() {
    //standard map 416 by 416 w/ 16 x 16 tiles
    background(255, 255, 255);
    game = new Game();
    Start.grass = loadImage("sprites/grass.png");
    tileList.add(new GrassTile(0, 448));
    tileList.add(new Road1Tile(0, 448));
    tileList.add(new Road2Tile(0, 448));
    tileList.add(new Road3Tile(0, 448));
    tileList.add(new Road4Tile(0, 448));
    tileList.add(new Road5Tile(0, 448));
    tileList.add(new Road6Tile(0, 448));
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
       /*selectedImg = t.img;
       selectedDef = t.defense;
       selectedMoveCost = t.moveCost;*/
       selected = t;
       return;
      }
    }
    
    if(mouseY <= 416) {
      int x = mouseX/16*16;
      int y = mouseY/16*16;
      Tile nt = new GrassTile(x,y);
      if(selected instanceof  GrassTile) {
        nt = new GrassTile(x,y);
      } else if(selected instanceof Road1Tile) {
       nt = new Road1Tile(x,y); 
      } else if(selected instanceof Road2Tile) {
       nt = new Road2Tile(x,y); 
      } else if(selected instanceof Road3Tile) {
       nt = new Road3Tile(x,y); 
      } else if(selected instanceof Road4Tile) {
       nt = new Road4Tile(x,y); 
      } else if(selected instanceof Road5Tile) {
       nt = new Road5Tile(x,y); 
      } else if(selected instanceof Road6Tile) {
       nt = new Road6Tile(x,y); 
      }
      game.tiles[y/16][x/16] = nt;
    }
    /*
    for (int i = 0; i < game.tiles.length; i++){  
      for (int j = 0; j < game.tiles[0].length; j++){  
        if (game.tiles[i][j].isMouseOver()){
           game.tiles[i][j] = new Tile(j * 16, i * 16, selectedDef, selectedMoveCost, selectedImg);
        }   
      }
    } */
  }
  
  void keyPressed() {
  }
}

