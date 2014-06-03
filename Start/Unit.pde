abstract class Unit {
  int x, y;
  int health;
  color c;
  int[] animations;
  
  public Unit(int x, int y, int health, color c) {
    this.x = x;
    this.y = y;
    this.health = health;
    this.c = c;
    //this.animations = animations;
  }
  void setAnimations(int[] animations){
    this.animations = animations;
  }
  void draw() {
    image(loadImage("sprites/sprite" + animations[0] + ".png"),x * 16,y * 16);
  }
} 
