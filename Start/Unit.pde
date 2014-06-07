import java.util.*;
abstract class Unit {
  int health, currentFrame, i, d, x, y;//x and y coors are equal to tile index, unless unit is in the mapeditor bar
  color c;
  int[] animations;
  int maxMovePoints, movePoints;
  String move = "no";


  public Unit(int x, int y, int health, color c, int movePoints) {
    this.health = health;
    this.c = c;
    this.x = x;
    this.y = y;
    this.maxMovePoints = movePoints;
    this.movePoints = movePoints;
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
  }

  void draw() {
    if (move.equals("no")) {
      image(loadImage("sprites/sprite" + animations[currentFrame] + ".png"), x * 16, y * 16);
    } else if (d == 16) {
      d = 0;
      if (move.equals("up")) {
        y--;
      } else if (move.equals("down")) {
        y++;
      } else if (move.equals("right")) {
        x++;
      } else {
        x--;
      }
      move = "no";
      image(loadImage("sprites/sprite" + animations[currentFrame] + ".png"), x * 16, y * 16);
    } else {
      d++;
      if (move.equals("up")) {
        image(loadImage("sprites/sprite" + animations[currentFrame] + ".png"), x * 16, y * 16 - d);
      } else if (move.equals("down")) {
        image(loadImage("sprites/sprite" + animations[currentFrame] + ".png"), x * 16, y * 16 + d);
      } else if (move.equals("right")) {
        image(loadImage("sprites/sprite" + animations[currentFrame] + ".png"), x * 16 + d, y * 16);
      } else {
        image(loadImage("sprites/sprite" + animations[currentFrame] + ".png"), x * 16 - d, y * 16);
      }
    }
    nextFrame();
  }


  ArrayList<Tile> getMoveLocs() {
    ArrayList<Tile> p = new ArrayList<Tile>();
    getMoveLocs(maxMovePoints, p, x, y);
    Tile[][] tiles = ((Game)Start.s).tiles;
    p.remove((tiles[y][x]));
    return p;
  }

  void getMoveLocs(int pointsLeft, ArrayList<Tile> current, int x, int y) {
    Tile[][] tiles = ((Game)Start.s).tiles;

    if (pointsLeft > 0 && x >= 0 && y >= 0 && x < 26 && y < 26) {
      if (!current.contains(tiles[y][x])) {
        current.add(tiles[y][x]);
        pointsLeft = pointsLeft - tiles[y][x].moveCost;
        getMoveLocs(pointsLeft, current, x+1, y);
        getMoveLocs(pointsLeft, current, x-1, y);
        getMoveLocs(pointsLeft, current, x, y + 1);
        getMoveLocs(pointsLeft, current, x, y-1);
      }
    }
  }



  void drawList() {//mapEditor unitList draw function
    image(loadImage("sprites/sprite" + animations[0] + ".png"), x, y);
  }
  void goUp() {
    move = "up";
  }
  void goDown() {
    move = "down";
  }
  void goRight() {
    move = "right";
  }
  void goLeft() {
    move = "left";
  }
  boolean isMouseOver(){//should only activate for units in the unitList bar in map editor, but potentially buggy

    return (mouseX >= this.x && mouseX <= this.x + 16 && mouseY >= this.y && mouseY <= this.y + 16);
  }
  
  void moveTo(int x, int y) {
    PriorityQueue<Path> q = new PriorityQueue<Path>(10, new PathComparator());
    ArrayList<Tile> visited = new ArrayList<Tile>();
    Tile[][] tiles = ((Game)Start.s).tiles;
    q.add(new Path(tiles[this.y][this.x],x,y));
    Path current = q.peek();
    while(! q.peek().found()){
      current = q.poll();
      //print("x: " + current.x + " y: " + current.y);
      //try{
        Path up = current.add(tiles[current.getLast().getY() - 1][current.getLast().getX()]);
        //print(" up ");
        q.add(up);
      //}catch(IndexOutOfBoundsException e){}
      //try{
        Path down = current.add(tiles[current.getLast().getY() + 1][current.getLast().getX()]);
        //print(" down ");
        q.add(down);
      //}catch(IndexOutOfBoundsException e){}
      //try{
        Path left = current.add(tiles[current.getLast().getY()][current.getLast().getX() - 1]);
        q.add(left);
      //}catch(IndexOutOfBoundsException e){}
      //try{
        Path right = current.add(tiles[current.getLast().getY()][current.getLast().getX() + 1]);
        q.add(right);
      //}catch(IndexOutOfBoundsException e){}
      print(q.poll().getLast().getX() + " ");
      print(q.poll().getLast().getX() + " ");
      print(q.poll().getLast().getX() + " ");
      print(q.poll().getLast().getX() + " ");
      //return;
    } 
    for (Tile r: current.p){
      print("  CS: " + q.size());
      print("a");
    }
    //print(q.peek().moveCost);
  }

}

