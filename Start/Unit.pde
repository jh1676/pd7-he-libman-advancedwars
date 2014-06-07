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


abstract class Unit {
  int health = 20, currentFrame, i, d, x, y;//x and y coors are equal to tile index, unless unit is in the mapeditor bar
  private color c = color(255, 255, 255);
  int[] animations;
  int maxMovePoints, movePoints;
  String move = "no";
  Player owner;
  HashMap<Integer, PImage> sprites;

  
  public Unit(int x, int y, int movePoints) {
    this.x = x;
    this.y = y;
    this.maxMovePoints = movePoints;
    this.movePoints = movePoints;
    sprites = defaultUnitImages;
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
    image(sprites.get(animations[currentFrame]),x,y);
  }

  void draw() {
    int realX = x *16;
    int realY = y * 16;
    if (move.equals("no")) {
  //    PImage pI = loadImage("sprites/sprite" + animations[currentFrame] + ".png"); 
       image(sprites.get(animations[currentFrame]),x*16,y*16);
     // image(pI, x * 16, y * 16);
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
      image(sprites.get(animations[currentFrame]),x*16,y*16);
    } else {
      d++;
      if (move.equals("up")) {
        realY -= d;
        image(sprites.get(animations[currentFrame]),x*16,y*16);
      } else if (move.equals("down")) {
        realY += d;
        image(sprites.get(animations[currentFrame]),x*16,y*16);
      } else if (move.equals("right")) {
        realX += d;
        image(sprites.get(animations[currentFrame]),x*16,y*16);
      } else {
        realX -= d;
        image(sprites.get(animations[currentFrame]),x*16,y*16);
      }
    }

    nextFrame();
  }

  void recolor(PImage p, color old, color newI, int tol) {

    for (int x = 0; x < p.width; x++) {
      for (int y = 0; y < p.height; y++ ) {
        int loc = x + y*p.width;
        float dist = sqrt(pow((red(old) - red(p.pixels[loc])), 2) + pow((green(old) - green(p.pixels[loc])), 2) + pow((blue(old) - blue(p.pixels[loc])), 2));
        System.out.println(dist);
        if (dist < tol) {
          p.pixels[loc] = newI;
        }
      }
    }
  }
  ArrayList<Tile> getMoveLocs() {
    ArrayList<Tile> p = new ArrayList<Tile>();
    getMoveLocs(maxMovePoints, p, x, y);
    Tile[][] tiles = ((Game)Start.s).tiles;
    p.remove((tiles[y][x]));
  
    Set setItems = new LinkedHashSet(p);
    p.clear();
    p.addAll(setItems);

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
  boolean isMouseOver() {//should only activate for units in the unitList bar in map editor, but potentially buggy

    return (mouseX >= this.x && mouseX <= this.x + 16 && mouseY >= this.y && mouseY <= this.y + 16);
  }

  void moveTo(int x, int y) {
    PriorityQueue<Path> q = new PriorityQueue<Path>(10, new PathComparator());
    ArrayList<Tile> visited = new ArrayList<Tile>();
    Tile[][] tiles = ((Game)Start.s).tiles;
    q.add(new Path(tiles[this.y][this.x],x,y));
    Path current = q.peek();
    while(! q.peek().found(x,y)){
      current = q.poll();
      print("x: " + current.x + " y: " + current.y);
      try{
        Path up = current.add(tiles[current.y - 1][current.x]);
        print(" up ");
        q.add(up);
      }catch(IndexOutOfBoundsException e){}
      try{
        Path down = current.add(tiles[current.y + 1][current.x]);
        print(" down ");
        q.add(down);
      }catch(IndexOutOfBoundsException e){}
      try{
        Path left = current.add(tiles[current.y][current.x - 1]);
        q.add(left);
      }catch(IndexOutOfBoundsException e){}
      try{
        Path right = current.add(tiles[current.y][current.x + 1]);
        q.add(right);
      }catch(IndexOutOfBoundsException e){}

    } 
    for (Tile r: current.p){
      print("  CS: " + q.size());
      print("a");
    }
    //print(q.peek().moveCost);
  }

  void setColor(color c) {
    this.c = c;
  }
}

