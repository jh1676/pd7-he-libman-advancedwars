class Menu {
  ArrayList<Choice> choices = new ArrayList<Choice>();
  int currentItem, widthh;
  int x, y;
  color bg;
  public Menu(int x, int y, int widthh) {
    this.widthh = widthh; 
    this.x = x;
    this.y = y;
    bg = color(240, 232, 208);
  }
  void keyPressed() {
    if (key == CODED) {
      if (keyCode == DOWN) {
        currentItem++;
      } else if (keyCode == UP) {
        currentItem--;
      }
      currentItem = abs(currentItem % choices.size());
    } else if (key == ENTER || key == RETURN) {
      choices.get(currentItem).action();
    }
  }

  //pixel coordinates
  void draw() {
    fill(bg);
    rectMode(CORNERS);
    rect(x, y, x+widthh, y+ choices.size() * 20);
    fill(0, 0, 0);
    textAlign(LEFT, TOP);
    textFont(Start.arial, 12);

    for (int i = 0; i < choices.size (); i++) {
      if (i == currentItem) {
        fill(9, 102, 9);
      }
      text(choices.get(i).getText(), x + 2, y + (i * 14) + 2);
      fill(0, 0, 0);
    }
    rectMode(CORNER);
  }

  void add(Choice c) {
    choices.add(c);
  }
}

interface Choice {
  String getText();
  void action();
}

interface BuyChoice extends Choice {
  int getPrice();
}
class WaitChoice implements Choice {
  Unit actOn;

  public WaitChoice(Unit actOn) {
    this.actOn = actOn;
  }

  String getText() {
    return "Wait";
  }
  void action() {
    actOn.movePoints = 0;
    actOn.attacked = true;
    Game g = (Game)Start.s;
    g.menu = null;
  }
}
class EndTurnChoice implements Choice {
  String getText() {
    return "End Turn";
  }
  void action() {
    Game g = (Game)Start.s;
    g.nextTurn();
    g.selected = null;
    g.menu = null;
  }
}
class ExitMenuChoice implements Choice {
  String getText() {
    return "Exit Menu";
  }

  void action() {
    Game g = (Game)Start.s;
    g.menu = null;
  }
}

class SoldierChoice implements BuyChoice {
  Player buyer;
  int x, y;
  public SoldierChoice(Player buyer, int x, int y) {
    this.buyer = buyer;
    this.x = x;
    this.y = y;
  }
  String getText() {
    return "Infantry: " + getPrice();
  }
  void action() {
    if (buyer.money < getPrice()) {
      Game g = (Game)Start.s;
      g.menu = null;
      return;
    } else {
      buyer.money -= getPrice(); 
      RedSoldier un = new RedSoldier(x, y);
      un.movePoints = 0;
      un.attacked = true;
      buyer.addUnit(un);
    }
    Game g = (Game)Start.s;
    g.menu = null;
  }
  int getPrice () {
    return 1000;
  }
}

class MechSoldierChoice implements BuyChoice {
  Player buyer;
  int x, y;
  public MechSoldierChoice(Player buyer, int x, int y) {
    this.buyer = buyer;
    this.x = x;
    this.y = y;
  }
  String getText() {
    return "Mech (RPG) Soldier: " + getPrice();
  }
  void action() {
    if (buyer.money < getPrice()) {
      Game g = (Game)Start.s;
      g.menu = null;
      return;
    } else {
      buyer.money -= getPrice(); 
      MechSoldier un = new MechSoldier(x, y);
      un.movePoints = 0;
      un.attacked = true;
      buyer.addUnit(un);
    }
    Game g = (Game)Start.s;
    g.menu = null;
  }
  int getPrice () {
    return 3000;
  }
}

class ReconUnitChoice implements BuyChoice {
  Player buyer;
  int x, y;
  public ReconUnitChoice(Player buyer, int x, int y) {
    this.buyer = buyer;
    this.x = x;
    this.y = y;
  }
  String getText() {
    return "Recon: " + getPrice();
  }
  void action() {
    if (buyer.money < getPrice()) {
      Game g = (Game)Start.s;
      g.menu = null;
      return;
    } else {
      buyer.money -= getPrice();
      ReconUnit un = new ReconUnit(x, y);
      un.movePoints = 0;
      un.attacked = true;
      buyer.addUnit(un);
    }
    Game g = (Game)Start.s;
    g.menu = null;
  }
  int getPrice () {
    return 4000;
  }
}
class APCUnitChoice implements BuyChoice {
  Player buyer;
  int x, y;
  public APCUnitChoice(Player buyer, int x, int y) {
    this.buyer = buyer;
    this.x = x;
    this.y = y;
  }
  String getText() {
    return "APC: " + getPrice();
  }
  void action() {
    if (buyer.money < getPrice()) {
      Game g = (Game)Start.s;
      g.menu = null;
      return;
    } else {
      buyer.money -= getPrice();
      APCUnit un = new APCUnit(x, y);
      un.movePoints = 0;
      un.attacked = true;
      buyer.addUnit(un);
    }
    Game g = (Game)Start.s;
    g.menu = null;
  }
  int getPrice () {
    return 4000;
  }
}
class TankUnitChoice implements BuyChoice {
  Player buyer;
  int x, y;
  public TankUnitChoice(Player buyer, int x, int y) {
    this.buyer = buyer;
    this.x = x;
    this.y = y;
  }
  String getText() {
    return "Tank: " + getPrice();
  }
  void action() {
    if (buyer.money < getPrice()) {
      Game g = (Game)Start.s;
      g.menu = null;
      return;
    } else {
      buyer.money -= getPrice();
      TankUnit un = new TankUnit(x, y);
      un.movePoints = 0;
      un.attacked = true;
      buyer.addUnit(un);
    }
    Game g = (Game)Start.s;
    g.menu = null;
  }
  int getPrice () {
    return 7000;
  }
}
class BigTankChoice implements BuyChoice {
  Player buyer;
  int x, y;
  public BigTankChoice(Player buyer, int x, int y) {
    this.buyer = buyer;
    this.x = x;
    this.y = y;
  }
  String getText() {
    return "Big Tank: " + getPrice();
  }
  void action() {
    if (buyer.money < getPrice()) {
      Game g = (Game)Start.s;
      g.menu = null;
      return;
    } else {
      buyer.money -= getPrice();
      BigTank un = new BigTank(x, y);
      un.movePoints = 0;
      un.attacked = true;
      buyer.addUnit(un);
    }
    Game g = (Game)Start.s;
    g.menu = null;
  }
  int getPrice () {
    return 11500;
  }
}
class ArtilleryUnitChoice implements BuyChoice {
  Player buyer;
  int x, y;
  public ArtilleryUnitChoice(Player buyer, int x, int y) {
    this.buyer = buyer;
    this.x = x;
    this.y = y;
  }
  String getText() {
    return "Artillery: " + getPrice();
  }
  void action() {
    if (buyer.money < getPrice()) {
      Game g = (Game)Start.s;
      g.menu = null;
      return;
    } else {
      buyer.money -= getPrice();
      ArtilleryUnit un = new ArtilleryUnit(x, y);
      un.movePoints = 0;
      un.attacked = true;
      buyer.addUnit(un);
    }
    Game g = (Game)Start.s;
    g.menu = null;
  }
  int getPrice () {
    return 5000;
  }
}
