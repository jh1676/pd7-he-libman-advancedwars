abstract class Tile {
  PImage img;
  int x, y, defense, moveCost;
  String name;
  Unit unit;

  public Tile(int x, int y, int defense, int moveCost, PImage img, String name) {
    this.x = x;
    this.y = y;
    this.defense = defense;
    this.moveCost = moveCost;
    this.img = img;
    this.name = name;
  }
  void draw() {
    image(img, x, y);
    if (unit != null){
       unit.draw();
     }
  }

  void setX(int x) {
    this.x = x;
  }

  void setY(int y) {
    this.y = y;
  }

  boolean isMouseOver() {
    return (mouseX >= this.x && mouseX <= this.x + 16 && mouseY >= this.y && mouseY <= this.y+16);
  }
}

