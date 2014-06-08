class Player {
  color c;
  private ArrayList<Unit> units = new ArrayList<Unit>();
  private ArrayList<Building> buildings = new ArrayList<Building>();

  HashMap<Integer, PImage> buildingImages = new HashMap<Integer, PImage>();
  HashMap<Integer, PImage> unitImages = new HashMap<Integer, PImage>();
  public Player(color c) {
    this.c = c;
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
      recolor(v, color(248, 160, 88), c, 5);
      recolor(v, color(208, 64, 56), c, 5);
      buildingImages.put(n, v);
    }
  }

  void addUnit(Unit p) {
    p.setColor(c);
    p.owner = this;
    p.sprites = unitImages;
    units.add(p);
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

