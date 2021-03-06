class Player {
  color c;
  int money;
  private ArrayList<Unit> units = new ArrayList<Unit>();
  private ArrayList<Building> buildings = new ArrayList<Building>();

  HashMap<Integer, PImage> buildingImages = new HashMap<Integer, PImage>();
  HashMap<Integer, PImage> unitImages = new HashMap<Integer, PImage>();
  public Player(color c) {
    this.c = c;
    this.money = 10000;
    for (Integer n : Start.unitImagePaths.keySet ()) {
      PImage pI = loadImage(Start.unitImagePaths.get(n));
      recolor(pI, color(240, 88, 8), c, 25);
      recolor(pI, color(248, 184, 120), c, 25);
      recolor(pI, color(240, 0, 8), c, 25);
      recolor(pI, color(128, 0, 16), c, 15);
      recolor(pI, color(192, 0, 0), c, 25);
      unitImages.put(n, pI);
    }

    for (Integer n : Start.buildingImagePaths.keySet ()) {
      PImage v = loadImage(Start.buildingImagePaths.get(n));
      recolor(v, color(248, 160, 88), c, 15);
      recolor(v, color(208, 64, 56), c, 15);
      recolor(v, color(222, 113, 77), c, 15);
      recolor(v, color(221, 132, 77), c, 15);
      recolor(v, color(215, 87, 68), c, 15);
      buildingImages.put(n, v);
    }
  }

  void addUnit(Unit p) {
    p.setColor(c);
    p.owner = this;
    p.sprites = unitImages;
    units.add(p);
  }

  boolean hasHQ() {
    for (Building b : buildings) {
      if (b instanceof HQ) {
        return true;
      }
    }
    return false;
  }
  void addBuilding(Building p) {
    p.owner = this;
    p.sprites = buildingImages;
    buildings.add(p);
  }

  ArrayList<Unit> getUnits() {
    return units;
  }

  ArrayList<Building> getBuildings() {
    return buildings;
  }
  
  int getPlayerNum() {
    Game game = null;
   if (Start.s instanceof MapEditor) {
    game = ((MapEditor)Start.s).game; 
   } else if (Start.s instanceof Game) {
    game = (Game)Start.s; 
   } else {
    return -1; 
   }
   return game.players.indexOf(this);
   
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
}

