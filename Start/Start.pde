static PFont arial;
static State s;

void setup() {
 s = new StartMenu();
 arial = createFont("Arial", 16, true);
 
}

void draw() {
  s.draw();
}

void keyPressed() {
  s.keyPressed();
}

