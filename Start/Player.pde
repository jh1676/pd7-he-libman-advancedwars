class Player {
  color c;
  private ArrayList<Unit> units = new ArrayList<Unit>();
  HashMap<Integer, PImage> unitImages = new HashMap<Integer, PImage>();
  public Player(color c) {
    this.c = c;
    for (Integer n : Start.unitImagePaths.keySet ()) {
      PImage pI = loadImage(Start.unitImagePaths.get(n));
      recolor(pI, color(240, 88, 8), c, 25);
      recolor(pI, color(248, 184, 120), c, 25);
      recolor(pI, color(240, 0, 8), c, 25);
      recolor(pI, color(128, 0, 16), c, 15);
      recolor(pI, color(192,0,0),c,25);
      unitImages.put(n,pI);
    }
  }

  void addUnit(Unit p) {
    p.setColor(c);
    p.owner = this;
    p.sprites = unitImages;
    units.add(p);
    
  }

  ArrayList<Unit> getUnits() {
    return units;
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

