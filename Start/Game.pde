class Game implements State {
  Tile[][] tiles;

  public Game() {
    tiles = new Tile[26][26];
    for (int i = 0; i < tiles.length; i++) {
      for (int n =0; n < tiles[0].length; n++) {
        tiles[i][n] = new GrassTile();
      }
    }
  }
  void draw() {
    for (int a = 0; a < tiles.length; a++) {
      for (int b = 0; b < tiles[0].length; b++) {
        tiles[a][b].draw(a*16, b*16);
      }
    }
  } 

  void keyPressed() {
  }
}

