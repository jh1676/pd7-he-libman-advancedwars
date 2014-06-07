class Game implements State {
  Tile[][] tiles;
  ArrayList<Unit> units;
  Unit selected = null;
  int numRows = 26, numCols = 26;
  int selX, selY;
  public Game() {
    String[] map = loadStrings("map.txt");
    tiles = new Tile[26][26];
    units = new ArrayList<Unit>();
    if (map != null) {
      for (int i = 0; i < map.length; i++) {
        String[] p = map[i].split(",");
        for (int n = 0; n < p.length; n++) {
          if (p[n].equals("grass")) {
            tiles[i][n] = new GrassTile(n * 16, i * 16);
          } else if (p[n].equals("road1")) {
            tiles[i][n] = new Road1Tile(n * 16, i * 16);
          } else if (p[n].equals("road2")) {
            tiles[i][n] = new Road2Tile(n * 16, i * 16);
          } else if (p[n].equals("road3")) {
            tiles[i][n] = new Road3Tile(n * 16, i * 16);
          } else if (p[n].equals("road4")) {
            tiles[i][n] = new Road4Tile(n * 16, i * 16);
          } else if (p[n].equals("road5")) {
            tiles[i][n] = new Road5Tile(n * 16, i * 16);
          } else if (p[n].equals("road6")) {
            tiles[i][n] = new Road6Tile(n * 16, i * 16);
          } else if (p[n].equals("water")) {
            tiles[i][n] = new WaterTile(n*16, i*16);
          } else {
            System.out.println(p[n]);
          }
        }
      }
      units.add(new RedSoldier(2,2, color(128,128,128)));
    }

    for (int i = 0; i < tiles.length; i++) {
      for (int n =0; n < tiles[0].length; n++) {
        if (tiles[i][n] == null) {
          tiles[i][n] = new GrassTile(n * 16, i * 16);
        }
      }
    }


  }
  void drawTiles(){
    for (int a = 0; a < tiles.length; a++) {
      for (int b = 0; b < tiles[0].length; b++) {
        tiles[a][b].draw();
      }
    }
  }
  void drawTintTiles(){
    if (selected != null){
      for (Tile t: selected.getMoveLocs()){
        tint(0,220,0,125);
        t.draw();
        tint(255,255,255);
      }
    }
  }
  void draw() {
    drawTiles();
    drawTintTiles();
    /*for (int a = 0; a < tiles.length; a++) {
      for (int b = 0; b < tiles[0].length; b++) {
        tiles[a][b].drawUnit();
      }
    }*/
    for (Unit a: units){
      a.draw();
    }
    mouseOver();
  } 

  void keyPressed(){
    if (key == 's') {
      units.get(0).goDown();
    }
    if (key == 'w') {
      units.get(0).goUp();
    }
    if (key == 'a') {
      units.get(0).goLeft();
    }
    if (key == 'd') {
      units.get(0).goRight();
    }
  }



  void mouseOver() {
    if (mouseY > 416) {
      return;
    }
    int x = (mouseX/16)*16;
    int y = (mouseY/16*16);
    fill(0, 0, 0);
    strokeWeight(2);
    triangle(x, y, x+2, y, x, y+2);
    triangle(x+16, y+16, x+14, y+16, x+16, y+14);
    triangle(x+16, y, x+14, y, x+16, y+2);
    triangle(x, y+16, x, y+14, x+2, y+16);
  }

  void mouseClicked() {
    if (mouseY > 416) {
      return;
    }
    int x = (mouseX/16);
    int y = (mouseY/16);
    changeUnitTile(x,y);
  }
  /*void changeUnitTile(int x, int y){
    if (tiles[y][x].unit != null && selected == null) {
      selected = tiles[y][x].unit;
      selX = x;
      selY = y;
<<<<<<< HEAD
      System.out.println(tiles[y][x].unit.getMoveLocs());
=======
    }else if (tiles[y][x].unit == null && selected != null) {
      tiles[y][x].unit = selected;
      selected = null;
      tiles[selY][selX].unit = null;
>>>>>>> ca54b99d1f9c31148f174cdcbfdeea6c31334d98
    }
  }*/
  void changeUnitTile(int x, int y){
    for (Unit u: units){
      if (u.x == x && u.y == y && selected == null) {
        selected = u;
        return;
      }else if (selected != null && u.x == x && u.y == y){
        return;
      }
    }
    if (selected != null){
      selected.moveTo(x,y);
    }
  }
      
}
