abstract class Unit {
  int health;
  color c;
  int[] animations;
  
  public Unit(int health, color c) {
    this.health = health;
    this.c = c;
    //this.animations = animations;
  }
  void setAnimations(int[] animations){
    this.animations = animations;
  }
  void draw(int x, int y) {
    image(loadImage("sprites/sprite" + animations[0] + ".png"),x * 16,y * 16);
  }
} 
