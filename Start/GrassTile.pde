class GrassTile extends Tile {
  public GrassTile(int x, int y) {
    super(x, y, 1,1, Start.grass, "grass");
  }
}

class MountainTile extends Tile {
  public MountainTile(int x, int y) {
    super(x, y, 0,1, Start.mountain, "mountain");
  }
}


class Road1Tile extends Tile {
  public Road1Tile(int x, int y) {
    super(x, y, 0,1, Start.road1, "road1");
  }
}


class Road2Tile extends Tile {
  public Road2Tile(int x, int y) {
    super(x, y, 0,1, Start.road2, "road2");
  }
}

class Road3Tile extends Tile {
  public Road3Tile(int x, int y) {
    super(x, y, 0,1, Start.road3, "road3");
  }
}

class Road4Tile extends Tile {
  public Road4Tile(int x, int y) {
    super(x, y, 0,1, Start.road4, "road4");
  }
}

class Road5Tile extends Tile {
  public Road5Tile(int x, int y) {
    super(x, y, 0,1, Start.road5, "road5");
  }
}

class Road6Tile extends Tile {
  public Road6Tile(int x, int y) {
    super(x, y, 0,1, Start.road6, "road6");
  }
}

class WaterTile extends Tile {
 public WaterTile(int x, int y) {
  super(x,y,1,999,Start.water, "water");
 } 
}

class TreeTile extends Tile {
 public TreeTile(int x,int y) {
  super(x,y,1,2,Start.tree, "tree");
 } 
}
