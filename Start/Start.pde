static PFont arial;
static State s;
static PImage grass, road1, road2, road3, road4, road5, road6, water;

void setup() {
 
  
 s = new StartMenu();
 arial = createFont("Arial", 16, true);
 
}

void loadImages() {
 grass = loadImage("/sprites/grass.png"); 
}
void draw() {
  s.draw();
}

void keyPressed() {
  s.keyPressed();
}

