/*class Recolor {
 int tol;
 color oldColor;
 color newColor;
 public Recolor(int tol, color old, color newC) {
 this.tol = tol;
 oldColor = old;
 newColor = newC;
 }
 } */

import java.util.*;

abstract class Unit {
  int health = 10, currentFrame, i, d, x, y, z;//x and y coors are equal to tile index, unless unit is in the mapeditor bar

  private color c = color(255, 255, 255);
  int[] animations;
  int maxMovePoints, movePoints, attack = 5, attackRange = 5;
  String move = "no";
  Player owner;
  HashMap<Integer, PImage> sprites;
  Path movementPath;
  boolean attacked = false;


  public Unit(int x, int y, int movePoints) {
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
    // image(loadImage("sprites/sprite" + animations[currentFrame] + ".png"), x, y);
    image(sprites.get(animations[currentFrame]), x, y);
  }//image(sprites.get(animations[currentFrame]),x*16,y*16);

  void draw() {
    if (movePoints <= 0) {
      tint(47, 39, 15, 200);
    }
    if (move.equals("no")) {
      image(sprites.get(animations[currentFrame]), x*16, y*16);
      ;
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
      image(sprites.get(animations[currentFrame]), x * 16, y * 16);
    } else {
      d++;
      if (move.equals("up")) {
        image(sprites.get(animations[currentFrame]), x * 16, y * 16 - d);
      } else if (move.equals("down")) {
        image(sprites.get(animations[currentFrame]), x * 16, y * 16 + d);
      } else if (move.equals("right")) {
        image(sprites.get(animations[currentFrame]), x * 16 + d, y * 16);
      } else {
        image(sprites.get(animations[currentFrame]), x * 16 - d, y * 16);
      }
    }
    nextFrame();
    tint(255, 255, 255);
  }


  ArrayList<Tile> getMoveLocs() {
    ArrayList<Tile> p = new ArrayList<Tile>();
    getMoveLocs(movePoints + 1, p, x, y);
    Tile[][] tiles = ((Game)Start.s).tiles;
    p.remove((tiles[y][x]));

    Set setItems = new LinkedHashSet(p);
    p.clear();
    p.addAll(setItems);
    Game game = null;

    if (Start.s instanceof MapEditor) {
      game = ((MapEditor)Start.s).game;
    } else if (Start.s instanceof Game) {
      game = (Game)Start.s;
    }

    for (Player player : game.players) {
      for (Unit u : player.units) {
        if (p.contains(tiles[u.y][u.x])) {
          p.remove(tiles[u.y][u.x]);
        }
      }
    }
    return p;
  }

  void getMoveLocs(int pointsLeft, ArrayList<Tile> current, int x, int y) {
    Tile[][] tiles = ((Game)Start.s).tiles;
    if (pointsLeft > 0 && x >= 0 && y >= 0 && x < 26 && y < 26) {  
      current.add(tiles[y][x]);
      pointsLeft = pointsLeft - tiles[y][x].moveCost;
      getMoveLocs(pointsLeft, current, x+1, y);
      getMoveLocs(pointsLeft, current, x-1, y);
      getMoveLocs(pointsLeft, current, x, y + 1);
      getMoveLocs(pointsLeft, current, x, y-1);
    }
  }
  ArrayList<Unit> getAttackableUnits(){
    Game game = (Game)Start.s;
    ArrayList<Tile> range = new ArrayList<Tile>();
    getMoveLocs(attackRange,range,x,y);
    ArrayList<Unit> attackable = new ArrayList<Unit>();
    if (attacked) return attackable;
    for (Player player: game.players){
      if (player != owner){
        for (Unit u: player.units){
          for (Tile t: range){
            if (t.getX() == u.x && t.getY() == u.y){
              tint(220, 0, 0, 125);
              t.draw();
              tint(255, 255, 255);
              attackable.add(u);
            }
          }
        }
      }
    }
    return attackable;
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
  boolean isMouseOver() {
    return (mouseX >= this.x && mouseX <= this.x + 16 && mouseY >= this.y && mouseY <= this.y + 16);
  }

  void moveTo(int x, int y) { //priority queue
    PriorityQueue<Path> q = new PriorityQueue<Path>(10, new PathComparator()); //see pathcomparator class
    //ArrayList<Tile> visited = new ArrayList<Tile>();
    Tile[][] tiles = ((Game)Start.s).tiles;
    q.add(new Path(tiles[this.y][this.x], x, y));
    Path current = q.peek();
    while (q.size () > 0 && ! q.peek().found()) {
      current = q.poll();
      //print("x: " + current.x + " y: " + current.y);
      try {
        Path up = current.add(tiles[current.getLast().getY() - 1][current.getLast().getX()]);
        //print(" up ");
        if (up.getMoveCost() <= movePoints) q.add(up);
      }
      catch(IndexOutOfBoundsException e) {
      }
      try {
        Path down = current.add(tiles[current.getLast().getY() + 1][current.getLast().getX()]);
        //print(" down ");
        if (down.getMoveCost() <= movePoints) q.add(down);
      }
      catch(IndexOutOfBoundsException e) {
      }
      try {
        Path left = current.add(tiles[current.getLast().getY()][current.getLast().getX() - 1]);
        if (left.getMoveCost() <= movePoints) q.add(left);
      }
      catch(IndexOutOfBoundsException e) {
      }
      try {
        Path right = current.add(tiles[current.getLast().getY()][current.getLast().getX() + 1]);
        if (right.getMoveCost() <= movePoints) q.add(right);
      }
      catch(IndexOutOfBoundsException e) {
      }
      //return;
    }
    current.p.add(tiles[y][x]);
    current.p.add(tiles[y][x]);
    movementPath = current;
  }
  void moveOnPath() {
    if (movementPath != null) {
      if (z < movementPath.p.size() - 1 && move == "no") {
        if (movementPath.p.get(z + 1).getX() - movementPath.p.get(z).getX() == 1) goRight();
        else if (movementPath.p.get(z + 1).getX() - movementPath.p.get(z).getX() == -1) goLeft();
        else if (movementPath.p.get(z + 1).getY() - movementPath.p.get(z).getY() == 1) goDown();
        else goUp();
        z++;
      } else if (z >= movementPath.p.size() - 1) {
        z = 0;
        movePoints -= movementPath.getMoveCost() - 1;
        movementPath = null;
        move = "no";
      }
      Game game = (Game)Start.s;
      game.menu = new Menu((x * 16) + 32, y * 16, 50);
      game.menu.add(new WaitChoice(this));
      game.menu.add(new ExitMenuChoice());
    }
  }
  void setColor(color c) {
    this.c = c;
  }
}


