class Game implements State {
  Tile[][] tiles;
  Unit selected = null;
  int numRows = 26, numCols = 26;
  int selX, selY;
  int numPlayers;
  Menu menu;
  ArrayList<Building> neutralBuildings = new ArrayList<Building>();
  ArrayList<Player> players = new ArrayList<Player>();
  Queue<Player> turns;
  public Game() {
    String[] map = loadStrings("map.txt");
    tiles = new Tile[26][26];

    this.numPlayers = 2;
    turns = new LinkedList<Player>();
    for (int i = 0; i < numPlayers; i++) {
      color c = color(random(255), random(255), random(255));
      Player p = new Player(c); 
      players.add(p);
      turns.add(p);
    }
    //all done
    if (map != null) {
      boolean buildingTime = false;
      boolean unitTime = false;
      for (int i = 0; i < map.length; i++) {
        String[] p = map[i].split(",");
        for (int n = 0; n < p.length; n++) {
          if (p[n].equals("grass")) {
            tiles[i][n] = new GrassTile(n * 16, i * 16);
          } else if (p[n].equals("road1")) {
            tiles[i][n] = new Road1Tile(n * 16, i * 16);
          } else if (p[n].equals("road2")) {
            tiles[i][n] = new Road2Tile(n * 16, i * 16);
          } else if (p[n].equals("road3")) {
            tiles[i][n] = new Road3Tile(n * 16, i * 16);
          } else if (p[n].equals("road4")) {
            tiles[i][n] = new Road4Tile(n * 16, i * 16);
          } else if (p[n].equals("road5")) {
            tiles[i][n] = new Road5Tile(n * 16, i * 16);
          } else if (p[n].equals("road6")) {
            tiles[i][n] = new Road6Tile(n * 16, i * 16);
          } else if (p[n].equals("mountain")) {
            tiles[i][n] = new MountainTile(n*16, i*16);
          } else if (p[n].equals("water")) {
            tiles[i][n] = new WaterTile(n*16, i*16);
          } else if (p[n].equals("tree")) {
            tiles[i][n] = new TreeTile(n*16, i*16);
          } else {
            if (p[n].equals("Buildings")) {
              buildingTime = true;
              
              continue;
            }
          }

          if (buildingTime) {
            String[] parts = p[n].split(":");
            if (parts.length == 3) {
              int xx = Integer.parseInt(parts[1]);
              int yy = Integer.parseInt(parts[2]);
              if (parts[0].equals("Factory")) {
                neutralBuildings.add(new Factory(xx, yy));
              } else if (parts[0].equals("City")) {
                neutralBuildings.add(new City(xx, yy));
              } else if (parts[0].equals("HQ")) {
                for (Player player : players) {
                  if (!player.hasHQ()) {
                    player.addBuilding(new HQ(xx, yy)); 
                    break;
                  }
                }
              }
            }
          }
          if (p[n].equals("Units")) {
                  unitTime = true;
                  buildingTime = false;
                  //continue;
          }
          if (unitTime) {
            String[] parts2 = p[n].split(":");
            if (parts2.length == 4) {
              int xx = Integer.parseInt(parts2[1]);
              int yy = Integer.parseInt(parts2[2]);
              int zz = Integer.parseInt(parts2[3]);
              if (parts2[0].equals("RedSoldier")) {
                players.get(zz).addUnit(new RedSoldier(xx, yy));
              } else if (parts2[0].equals("MechSoldier")) {
                players.get(zz).addUnit(new MechSoldier(xx, yy));
              } else if (parts2[0].equals("MechSoldier")) {
                players.get(zz).addUnit(new MechSoldier(xx, yy));
              } else if (parts2[0].equals("ReconUnit")) {
                players.get(zz).addUnit(new ReconUnit(xx, yy));
              } else if (parts2[0].equals("TankUnit")) {
                players.get(zz).addUnit(new TankUnit(xx, yy));
              } else if (parts2[0].equals("BigTank")) {
                players.get(zz).addUnit(new BigTank(xx, yy));
              } else if (parts2[0].equals("APCUnit")) {
                players.get(zz).addUnit(new APCUnit(xx, yy));
              } else if (parts2[0].equals("ArtilleryUnit")) {
                players.get(zz).addUnit(new ArtilleryUnit(xx, yy));
              }
            }
          }
        }
      }
    
          //players.get(0).addUnit(new RedSoldier(2, 2));
          //players.get(0).addUnit(new APCUnit(7, 5));
          //players.get(1).addUnit(new APCUnit(20, 22));
          //players.get(1).addUnit(new RedSoldier(20, 20));
          //players.get(0).addBuilding(new Factory(10,10));
        }

        for (int i = 0; i < tiles.length; i++) {
          for (int n =0; n < tiles[0].length; n++) {
            if (tiles[i][n] == null) {
              tiles[i][n] = new GrassTile(n * 16, i * 16);
            }
          }
        }
      }
      void nextTurn() {
        for (Unit u : turns.peek().units) {
          u.capture();
          u.movePoints = u.maxMovePoints;
          u.attacked = false;
        }
        for (Building b: turns.peek().buildings){
          if (b instanceof City){
            turns.peek().money += 300;
          }
        }
        turns.add(turns.poll());
      }
      void drawTiles() {
        for (int a = 0; a < tiles.length; a++) {
          for (int b = 0; b < tiles[0].length; b++) {
            tiles[a][b].draw();
          }
        }
      }
      void drawTintTiles() {
        if (selected != null) {
          for (Tile t : selected.getMoveLocs ()) {
            tint(0, 220, 0, 125);
            t.draw();
            tint(255, 255, 255);
          }
        }
      }
      void checkPlayers() { //removes player if they lose their HQ
        for (int i = 0; i < players.size (); i++) {
          boolean alive = false;
          for (Building b : players.get (i).buildings) {
            if (b instanceof HQ) {
              alive = true;
            }
          }
          if (!alive) {
            for (Building o : players.get (i).buildings) {
              o.owner = null;
              o.sprites = Start.defaultBuildingImages;
              neutralBuildings.add(o);
            }
            players.remove(i);
            i--;
          }
        }
      }
      void draw() {
        drawTiles();
        drawTintTiles();
        if (selected != null) {
          selected.getAttackableUnits();
        }
        /*for (int a = 0; a < tiles.length; a++) {
         for (int b = 0; b < tiles[0].length; b++) {
         tiles[a][b].drawUnit();
         }
         }*/
        checkPlayers();
        for (Player p : players) {
          ArrayList<Building> buildings = p.getBuildings();
          for (Building a : buildings) {
            a.draw();
          }
        }

        for (Building b : neutralBuildings) {
          b.draw();
        }
        for (Player p : players) {
          ArrayList<Unit> units = p.getUnits();
          for (Unit a : units) {
            a.draw();
            a.moveOnPath();
          }
        }
        mouseOver();

        if (menu != null) {
          menu.draw();
        }
        textFont(Start.arial, 16);
        textAlign(LEFT);
        if (!(Start.s instanceof MapEditor)) {
          text("Player " + (turns.peek().getPlayerNum() + 1), 0, 432);
          text("Money: " + turns.peek().money, 0, 448);
          if (selected != null) {
            text("Health: " + selected.health, 0, 468);
          }
          if (players.size() == 1) { //if only one player remains, he/she is the winner
            textFont(Start.arial, 26);
            text("Player " + (players.get(0).getPlayerNum() + 1) + " has won!", 175, 442);
          }
        }
      } 


      void keyPressed() {
        if (menu == null && key == TAB) {
          menu = new Menu(40, 20, 60);
          menu.add(new EndTurnChoice());
        } else if (menu != null && key == TAB) {
          menu = null;
        } else if (menu != null) {
          menu.keyPressed();
        }
      }



      void mouseOver() {
        if (mouseY > 416) {
          return;
        }
        int x = (mouseX/16)*16;
        int y = (mouseY/16*16);
        fill(0, 0, 0);
        strokeWeight(2);
        triangle(x, y, x+2, y, x, y+2);
        triangle(x+16, y+16, x+14, y+16, x+16, y+14);
        triangle(x+16, y, x+14, y, x+16, y+2);
        triangle(x, y+16, x, y+14, x+2, y+16);
      }

      void mouseClicked() {
        if (mouseY > 416) {
          return;
        }
        int x = (mouseX/16);
        int y = (mouseY/16);
        changeUnitTile(x, y);
        attackUnit(x, y);
        buildingMenus(x, y);
      }

      void buildingMenus(int x, int y) {
        //boolean good = true;
        for (Player p : players) {
          for (Unit u : p.getUnits ()) {
            if (u.x == x && u.y == y) {
              //good = false;
              return;
            }
          }
        }

        Player now = turns.peek();
        for (Building b : now.getBuildings ()) {
          if (b.x == x && b.y == y) {
            if (b instanceof Factory) {
              menu = new Menu(x*16, y*16, 164);
              menu.add(new SoldierChoice(now, x, y));
              menu.add(new MechSoldierChoice(now, x, y));
              menu.add(new ReconUnitChoice(now, x, y));
              menu.add(new ArtilleryUnitChoice(now, x, y));
              menu.add(new TankUnitChoice(now, x, y));
              menu.add(new BigTankChoice(now, x, y));
              menu.add(new APCUnitChoice(now, x, y));
              menu.add(new ExitMenuChoice());
            }
          }
        }
      }
      void changeUnitTile(int x, int y) {
        ArrayList<Unit> units = turns.peek().getUnits();
        for (Unit u : units) {
          if (u.x == x && u.y == y && selected == null) {
            selected = u;
            return;
          } else if (selected != null && selected.x == x && selected.y == y) {
            selected = null;
            return;
          } else if (selected != null && u.x == x && u.y == y) {
            return;
          }
        }
        if (selected != null) {
          for (Tile g : selected.getMoveLocs ()) {
            if (g.x / 16 == x && g.y / 16 == y) {
              selected.moveTo(x, y);
              selected = null;
              return;
            }
          }
        }
      }
      void attackUnit(int x, int y) {
        if (selected != null) {
          ArrayList<Unit> units = selected.getAttackableUnits();
          for (Unit u : units) {
            if (u.x == x && u.y == y && ! selected.attacked) {
              int b = 0;
              for (Player i : players) {
                if (i.units.contains(u)) {
                  for (Building e : i.buildings) {
                    if (e.x == x && e.y == y) {
                      b = e.defense;
                    }
                  }
                }
              }
              u.takeDmg(selected.attack, b);
              if (u.health <= 0) {
                for (Player p : players) {
                  p.units.remove(u);
                }
              }
              selected.attacked = true;
            }
          }
        }
      }
    }

