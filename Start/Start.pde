import java.io.*;

static PFont arial;
static State s;
static PImage grass, road1, road2, road3, road4, road5, road6, water;
static HashMap<String, PImage> tileImages = new HashMap<String, PImage>();
static HashMap<Integer, String> unitImagePaths = new HashMap<Integer, String>();
static HashMap<Integer, PImage> defaultUnitImages = new HashMap<Integer, PImage>();
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
 
 File directory = new File(sketchPath("") + "/sprites");
 File[] fList = directory.listFiles();
 for (File f: fList) {
  if(f.isFile() && f.getName().contains("sprite") && !f.getName().contains("Game Boy")) {
    String keyS = f.getName().substring(5);
    keyS = keyS.replaceAll("\\D+","");
   unitImagePaths.put(Integer.parseInt(keyS),f.getPath());
   defaultUnitImages.put(Integer.parseInt(keyS),loadImage(f.getPath()));
  } 
 }
 
 
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

