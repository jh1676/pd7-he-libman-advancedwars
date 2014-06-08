import java.io.*;

static PFont arial;
static State s;
static PImage grass, road1, road2, road3, road4, road5, road6, water, mountain, tree;
static HashMap<String, PImage> tileImages = new HashMap<String, PImage>();
static HashMap<Integer, String> unitImagePaths = new HashMap<Integer, String>();
static HashMap<Integer, PImage> defaultUnitImages = new HashMap<Integer, PImage>();

static HashMap<Integer, String> buildingImagePaths = new HashMap<Integer, String>();
static HashMap<Integer, PImage> defaultBuildingImages = new HashMap<Integer, PImage>();
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
  mountain = loadImage("sprites/mountain.png");
  tree = loadImage("sprites/tree.png");
  File directory = new File(sketchPath("") + "/sprites");
  File[] fList = directory.listFiles();
  for (File f : fList) {
    if (f.isFile() && f.getName().contains("sprite") && !f.getName().contains("Game Boy")) {
      String keyS = f.getName().substring(5);
      keyS = keyS.replaceAll("\\D+", "");
      unitImagePaths.put(Integer.parseInt(keyS), f.getPath());
      defaultUnitImages.put(Integer.parseInt(keyS), loadImage(f.getPath()));
    } else {
      if (f.isFile() && f.getName().contains("building")) {
        String keyS = f.getName().substring(5);
        keyS = keyS.replaceAll("\\D+", "");
        buildingImagePaths.put(Integer.parseInt(keyS), f.getPath());
        PImage v = loadImage(f.getPath());
        recolor(v, color(248,160,88), color(240,232,208),18);
        recolor(v, color(208,64,56), color(192,184,192),18);
        recolor(v, color(222,113,77), color(155,151,142), 18);
        recolor(v, color(221,132,77), color(155,151,142), 18);
        recolor(v, color(215,87,68), color(151,132,132), 18);
        defaultBuildingImages.put(Integer.parseInt(keyS), v);
      }
    }
  }
}

void recolor(PImage p, color old, color newI, int tol) {
    
    for (int x = 0; x < p.width; x++) {
      for (int y = 0; y < p.height; y++ ) {
        int loc = x + y*p.width;
        float dist = sqrt(pow((red(old) - red(p.pixels[loc])), 2) + pow((green(old) - green(p.pixels[loc])), 2) + pow((blue(old) - blue(p.pixels[loc])), 2));
        if (dist < tol) {
          p.pixels[loc] = newI;
        }
      }
    }
  }
void draw() {
  clear();
  background(255, 255, 255);
  s.draw();
}

void keyPressed() {
  s.keyPressed();
}

void mouseClicked() {
  s.mouseClicked();
}

