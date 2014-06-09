class MapEditor implements State {
  Game game;
  ArrayList<Tile> tileList = new ArrayList<Tile>();
  ArrayList<Unit> unitList = new ArrayList<Unit>();
  ArrayList<Building> buildingList = new ArrayList<Building>();

  Tile selected = new GrassTile(0, 0);
  Unit selectedUnit;
  Building selectedBuilding;
  String type = "tile";
  /*PImage selectedImg = Start.grass;
   int selectedDef = 1;
   int selectedMoveCost = 1; */
  public MapEditor() {
    //standard map 416 by 416 w/ 16 x 16 tiles
    background(255, 255, 255);
    game = new Game();
    Start.grass = loadImage("sprites/grass.png");
    tileList.add(new GrassTile(0, 442));
    tileList.add(new Road1Tile(0, 442));
    tileList.add(new Road2Tile(0, 442));
    tileList.add(new Road3Tile(0, 442));
    tileList.add(new Road4Tile(0, 442));
    tileList.add(new Road5Tile(0, 442));
    tileList.add(new Road6Tile(0, 442));
    tileList.add(new WaterTile(0, 442));
    tileList.add(new MountainTile(0, 442));
    tileList.add(new TreeTile(0,442));
    
    unitList.add(new RedSoldier(0, 462));
    unitList.add(new MechSoldier(0, 462));
    unitList.add(new ReconUnit(0, 462));
    unitList.add(new TankUnit(0, 462));
    unitList.add(new BigTank(0, 462));
    unitList.add(new APCUnit(0, 462));
    unitList.add(new ArtilleryUnit(0, 462));

    buildingList.add(new HQ(0, 482));
    buildingList.add(new Factory(0, 482));
    buildingList.add(new City(0, 482));

    for (int i = 0; i < tileList.size (); i++) {
      tileList.get(i).setX((400/(tileList.size() + 1) * (i +1)));
    }
    for (int i = 0; i < unitList.size (); i++) {
      unitList.get(i).x = ((400/(unitList.size() + 1) * (i +1)));
    }

    for (int i = 0; i < buildingList.size (); i++) {
      buildingList.get(i).x = ((400/(buildingList.size() + 1) * (i +1)));
    }
  }

  void draw() {
    game.draw();
    strokeWeight(4);
    line(0, 416, 416, 416); 
    for (int i = 0; i < tileList.size (); i++) {
      tileList.get(i).draw();
    }
    for (int i = 0; i < unitList.size (); i++) {
      unitList.get(i).drawList();
    }


    for (int i = 0; i < buildingList.size (); i++) {
      buildingList.get(i).drawMapEditor();
    }

    mouseOver();
    strokeWeight(2);
    fill(0, 0, 0);
    textAlign(LEFT);
    text("Press s to save. Press m to go back to the menu", 0, 432);
  }

  void save() {
 //   String[] map = new String[game.numRows];
    ArrayList<String> map = new ArrayList<String>();
    for (int rows = 0; rows < game.numRows; rows++) {
      String line = "";
      for (int cols = 0; cols < game.numCols; cols++) {
        line += game.tiles[rows][cols].name + ",";
      }
      line = line.substring(0, line.length() - 1);
      map.add(line);
    }
    
    map.add("");
    map.add("Buildings");
    for (Player p: game.players){
      for (Building b: p.buildings) {
        String line = "";
        line += b.getClass().getSimpleName() + ":" + b.x + ":" + b.y;
        map.add(line);
      }
    }
    for (Building b: game.neutralBuildings) {
        String line = "";
        line += b.getClass().getSimpleName() + ":" + b.x + ":" + b.y;
        map.add(line);
    }
    map.add("");
    map.add("Units");
    for (Player p: game.players) {
      for (Unit u: p.units){
        String line = "";
        line += u.getClass().getSimpleName() + ":" + u.x + ":" + u.y + ":" + u.owner.getPlayerNum();
        map.add(line);
      }
    }
    
    saveStrings("map.txt", map.toArray(new String[map.size()]));
  }
  void mouseOver() {
    for (Tile t : tileList) {
      if (t.isMouseOver()) {
        int x = t.x;
        int y = t.y;
        fill(0, 0, 0);
        strokeWeight(2);
        triangle(x, y, x+2, y, x, y+2);
        triangle(x+16, y+16, x+14, y+16, x+16, y+14);
        triangle(x+16, y, x+14, y, x+16, y+2);
        triangle(x, y+16, x, y+14, x+2, y+16);
      }
    }
    for (Unit u : unitList) {
      if (u.isMouseOver()) {
        int x = u.x;
        int y = u.y;
        fill(0, 0, 0);
        strokeWeight(2);
        triangle(x, y, x+2, y, x, y+2);
        triangle(x+16, y+16, x+14, y+16, x+16, y+14);
        triangle(x+16, y, x+14, y, x+16, y+2);
        triangle(x, y+16, x, y+14, x+2, y+16);
      }
    }

    for (Building u : buildingList) {
      if (u.isMouseOver()) {
        int x = u.x;
        int y = u.y;
        fill(0, 0, 0);
        strokeWeight(2);
        triangle(x, y, x+2, y, x, y+2);
        triangle(x+16, y+16, x+14, y+16, x+16, y+14);
        triangle(x+16, y, x+14, y, x+16, y+2);
        triangle(x, y+16, x, y+14, x+2, y+16);
      }
    }
  }

  void mouseClicked() {
    for (Tile t : tileList) {
      if (t.isMouseOver()) {
        /*selectedImg = t.img;
         selectedDef = t.defense;
         selectedMoveCost = t.moveCost;*/
        selected = t;
        type = "tile";
        return;
      }
    }
    for (Unit u : unitList) {
      if (u.isMouseOver()) {
        /*selectedImg = t.img;
         selectedDef = t.defense;
         selectedMoveCost = t.moveCost;*/
        selectedUnit = u;
        type = "unit";
        return;
      }
    }

    for (Building b : buildingList) {
      if (b.isMouseOver()) {
        selectedBuilding = b;
        type = "building";
        return;
      }
    }
    if (mouseY <= 416) {
      int x = mouseX/16*16;
      int y = mouseY/16*16;
      if (type.equals("tile")) {
        Tile nt = new GrassTile(x, y);
        if (selected instanceof GrassTile) {
          nt = new GrassTile(x, y);
        } else if (selected instanceof Road1Tile) {
          nt = new Road1Tile(x, y);
        } else if (selected instanceof Road2Tile) {
          nt = new Road2Tile(x, y);
        } else if (selected instanceof Road3Tile) {
          nt = new Road3Tile(x, y);
        } else if (selected instanceof Road4Tile) {
          nt = new Road4Tile(x, y);
        } else if (selected instanceof Road5Tile) {
          nt = new Road5Tile(x, y);
        } else if (selected instanceof Road6Tile) {
          nt = new Road6Tile(x, y);
        } else if (selected instanceof MountainTile) {
          nt = new MountainTile(x, y);
        } else if (selected instanceof WaterTile) {
          nt = new WaterTile(x, y);
        } else if (selected instanceof TreeTile) {
          nt = new TreeTile(x, y);
        }
        game.tiles[y/16][x/16] = nt;
      } else if (type.equals("unit")) {
        if (selectedUnit instanceof RedSoldier) {
          game.players.get(0).addUnit(new RedSoldier(x/16, y/16));
        } else if (selectedUnit instanceof MechSoldier) {
          game.players.get(0).addUnit(new MechSoldier(x/16, y/16));
        } else if (selectedUnit instanceof ReconUnit) {
          game.players.get(0).addUnit(new ReconUnit(x/16, y/16));
        } else if (selectedUnit instanceof TankUnit) {
          game.players.get(0).addUnit(new TankUnit(x/16, y/16));
        } else if (selectedUnit instanceof BigTank) {
          game.players.get(0).addUnit(new BigTank(x/16, y/16));
        } else if (selectedUnit instanceof APCUnit) {
          game.players.get(0).addUnit(new APCUnit(x/16, y/16));
        } else if (selectedUnit instanceof ArtilleryUnit) {
          game.players.get(0).addUnit(new ArtilleryUnit(x/16, y/16));
        }
      } else if (type.equals("building")) {
        if (selectedBuilding instanceof HQ) { 
          game.neutralBuildings.add(new HQ(x/16, y/16));
        } else if (selectedBuilding instanceof City) { 
          game.neutralBuildings.add(new City(x/16, y/16));
        } else if (selectedBuilding instanceof Factory) { 
          game.neutralBuildings.add(new Factory(x/16, y/16));
        }
      }
    }
    /*
    for (int i = 0; i < game.tiles.length; i++){  
     for (int j = 0; j < game.tiles[0].length; j++){  
     if (game.tiles[i][j].isMouseOver()){
     game.tiles[i][j] = new Tile(j * 16, i * 16, selectedDef, selectedMoveCost, selectedImg);
     }   
     }
     } */
  }

  void keyPressed() {
    if (key == 's') {
      save();
    } else if (key == 'm') {
      s = new StartMenu();
    } else if (key == 'z') {
      Player h = null;
      Unit m = null;
      int X = mouseX/16;
      int Y = mouseY/16;
      for (Player p: game.players){
        for (Unit u: p.units){
          if (u.x == X && u.y == Y){
            h = p;
            m = u;
          }
        }
      }
      if (h != null && m != null){
        game.players.get((h.getPlayerNum() + 1) % game.players.size()).addUnit(m);
        h.units.remove(m);
      }
    } 
  }
}

