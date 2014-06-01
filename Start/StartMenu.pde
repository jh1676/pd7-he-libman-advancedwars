class StartMenu implements State {
  public StartMenu() {
    size(416, 480);
  } 

  void draw() {
    fill(0, 0, 0);
    textFont(Start.arial, 16);
    textAlign(CENTER);
    text("Press s to begin game. Press m to enter map editor", 213, 213);
  }

  void keyPressed() {
    if (key == 'm') {
      Start.s = new MapEditor();
    } else {
      if (key == 's') {
        Start.s = new Game();
      }
    }
  }
  
  void mouseClicked(){

  }
}

