abstract class Building {
  Player owner;
  HashMap<Integer, PImage> sprites;
  int x, y;  //tile index
  int defense;
  int health, maxHealth = 20;
  int imgNum;
  public Building(int x, int y, int imgNum, int def) {
    this.x = x;
    this.y = y;
    this.imgNum = imgNum;
    this.sprites = Start.defaultBuildingImages;
    this.defense = def;
    health = maxHealth;
  }
  boolean isNeutral() {
    return owner == null;
  }

  void draw() {
    image(sprites.get(imgNum), x*16, y*16);
  }

  void drawMapEditor() {
    image(sprites.get(imgNum), x, y);
  }
  boolean isMouseOver() {//should only activate for units in the unitList bar in map editor, but potentially buggy
    return (mouseX >= this.x && mouseX <= this.x + 16 && mouseY >= this.y && mouseY <= this.y + 16);
  }
}

class HQ extends Building {
  public HQ(int x, int y) {
    super(x, y, 1, 4);
  }
}

class City extends Building {
  public City(int x, int y) {
    super(x, y, 2, 3);
  }
}

class Factory extends Building {
  public Factory(int x, int y) {
    super(x, y, 3, 3);
  }
}

