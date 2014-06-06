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
  /*void draw(int x, int y) {
    image(loadImage("sprites/sprite" + animations[currentFrame] + ".png"),x,y);
>>>>>>> ca54b99d1f9c31148f174cdcbfdeea6c31334d98
    nextFrame();
  }*/
  void draw(){
    if (move.equals("no")){
      image(loadImage("sprites/sprite" + animations[currentFrame] + ".png"),x * 16,y * 16);
    }
    else if (d == 16){
      d = 0;
      if (move.equals("up")){
        y--;
      }else if (move.equals("down")){
        y++;
      }else if (move.equals("right")){
        x++;
      }else{
        x--;
      }
      move = "no";
      image(loadImage("sprites/sprite" + animations[currentFrame] + ".png"),x * 16,y * 16);
    }else{
      d++;
      if (move.equals("up")){
        image(loadImage("sprites/sprite" + animations[currentFrame] + ".png"),x * 16,y * 16 - d); 
      }else if (move.equals("down")){
        image(loadImage("sprites/sprite" + animations[currentFrame] + ".png"),x * 16,y * 16 + d); 
      }else if (move.equals("right")){
        image(loadImage("sprites/sprite" + animations[currentFrame] + ".png"),x * 16 + d,y * 16); 
      }else{
        image(loadImage("sprites/sprite" + animations[currentFrame] + ".png"),x * 16 - d,y * 16);
      }
    }
    nextFrame();
  }


  ArrayList<Tile> getMoveLocs() {
    ArrayList<Tile> p = new ArrayList<Tile>();
    getMoveLocs(maxMovePoints, p, x, y);
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



  void drawList(){//mapEditor unitList draw function
    image(loadImage("sprites/sprite" + animations[0] + ".png"),x,y);
  }
  void goUp(){
    move = "up";
  }
  void goDown(){
    move = "down";
  }
  void goRight(){
    move = "right";
  }
  void goLeft(){
    move = "left";
  }  
  /*Tile[] getMoveLocs() {
    
  }*/
  boolean isMouseOver() {//should only activate for units in the unitList bar in map editor, but potentially buggy
    return (mouseX >= this.x && mouseX <= this.x + 16 && mouseY >= this.y && mouseY <= this.y + 16);
  }
}

