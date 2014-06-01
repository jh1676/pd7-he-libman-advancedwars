class Game implements State {
  Tile[][] tiles;

  public Game() {
    tiles = new Tile[26][26];
    for (int i = 0; i < tiles.length; i++) {
      for (int n =0; n < tiles[0].length; n++) {
        tiles[i][n] = new GrassTile(n * 16, i * 16);
      }
    }
  }
  void draw() {

    for (int a = 0; a < tiles.length; a++) {
      for (int b = 0; b < tiles[0].length; b++) {
        tiles[a][b].draw();
      }
    }
    mouseOver();
  } 

  void keyPressed() {
  }



  void mouseOver() {
    if(mouseY > 416) {
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
    
  }
}

