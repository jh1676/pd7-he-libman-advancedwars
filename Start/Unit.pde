abstract class Unit {
  int health, currentFrame, i, d, x, y;//x and y coors are equal to tile index, unless unit is in the mapeditor bar
  color c;
  int[] animations;
  Tile parent;
  String move = "no";
  
  public Unit(int x, int y, int health, color c) {
    this.health = health;
    this.c = c;
    this.x = x;
    this.y = y;
    //this.animations = animations;
  }
  void setAnimations(int[] animations){
    this.animations = animations;
  }
  void nextFrame(){
    if (i == 8){
      i = 0;
      currentFrame = (currentFrame + 1) % animations.length;
    }
    else{
      i++;
    }
  }
      
  /*void draw(int x, int y) {
    image(loadImage("sprites/sprite" + animations[currentFrame] + ".png"),x,y);
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
