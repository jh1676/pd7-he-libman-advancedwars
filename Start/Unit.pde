abstract class Unit {
  int health, currentFrame, i, d;
  color c;
  int[] animations;
  Tile parent;
  String move = "no";
  
  public Unit(int health, color c) {
    this.health = health;
    this.c = c;
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
  void draw(int x, int y){
    if (move.equals("no")){
      image(loadImage("sprites/sprite" + animations[currentFrame] + ".png"),x,y);
    }
    else if (d == 16){
      d = 0;
      move = "no";
    }else{
      d++;
      if (move.equals("up")){
        image(loadImage("sprites/sprite" + animations[currentFrame] + ".png"),x,y - d); 
      }else if (move.equals("down")){
        image(loadImage("sprites/sprite" + animations[currentFrame] + ".png"),x,y + d); 
      }else if (move.equals("right")){
        image(loadImage("sprites/sprite" + animations[currentFrame] + ".png"),x + d,y); 
      }else{
        image(loadImage("sprites/sprite" + animations[currentFrame] + ".png"),x - d,y);
      }
    }
    nextFrame();
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
}
