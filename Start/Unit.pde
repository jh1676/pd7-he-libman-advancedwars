abstract class Unit {
  int health, currentFrame, i;
  color c;
  int[] animations;
  int maxMovePoints, movePoints;
  Tile parent;

  public Unit(Tile holder, int health, color c, int movePoints) {
    this.health = health;
    this.c = c;
    this.maxMovePoints = movePoints;
    this.movePoints = movePoints;
    this.parent = holder;
    //this.animations = animations;
  }
  void setAnimations(int[] animations) {
    this.animations = animations;
  }
  void nextFrame() {
    if (i == 8) {
      i = 0;
      currentFrame = (currentFrame + 1) % animations.length;
    } else {
      i++;
    }
  }
  void draw(int x, int y) {
    image(loadImage("sprites/sprite" + animations[currentFrame] + ".png"), x, y);
    nextFrame();
  }

  ArrayList<Tile> getMoveLocs() {
    ArrayList<Tile> p = new ArrayList<Tile>();
    getMoveLocs(maxMovePoints, p, parent.x/16, parent.y/16);
    return p;
  }

  void getMoveLocs(int pointsLeft, ArrayList<Tile> current, int x, int y) {
    Tile[][] tiles = ((Game)Start.s).tiles;
    System.out.println(pointsLeft);
    if (pointsLeft > 0 && x >= 0 && y >= 0 && x < 26 && y < 26) {
      current.add(tiles[y][x]);
      pointsLeft = pointsLeft - tiles[y][x].moveCost;
      getMoveLocs(pointsLeft, current, x+1, y);
      getMoveLocs(pointsLeft, current, x-1, y);
      getMoveLocs(pointsLeft, current, x+1, y + 1);
      getMoveLocs(pointsLeft, current, x-1, y+1);
    }
  }
} 

