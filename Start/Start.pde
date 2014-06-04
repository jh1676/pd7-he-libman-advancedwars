static PFont arial;
static State s;
static PImage grass, road1, road2, road3, road4, road5, road6, water;

void setup() {
  loadImages(); 
  s = new StartMenu();
  arial = createFont("Arial", 16, true);
  frameRate(30);
}

void loadImages() {
 grass = loadImage("sprites/grass.png"); 
 road1 = loadImage("sprites/road1.png");
 road2 = loadImage("sprites/road2.png");
 road3 = loadImage("sprites/road3.png");
 road4 = loadImage("sprites/road4.png");
 road5 = loadImage("sprites/road5.png");
 road6 = loadImage("sprites/road6.png");
 water = loadImage("sprites/water.png");
}
void draw() {
  clear();
  background(255,255,255);
  s.draw();
}

void keyPressed() {
  s.keyPressed();
}

void mouseClicked() {
  s.mouseClicked();
}

