abstract class Unit {
  int health, currentFrame, i;
  color c;
  int[] animations;
  Tile parent;
  
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
  void draw(int x, int y) {
    image(loadImage("sprites/sprite" + animations[currentFrame] + ".png"),x,y);
    nextFrame();
  }
  
  /*Tile[] getMoveLocs() {
    
  }*/
} 
