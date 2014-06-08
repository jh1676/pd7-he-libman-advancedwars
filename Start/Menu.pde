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
      buyer.addUnit(new RedSoldier(x, y));
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
      buyer.addUnit(new MechSoldier(x, y));
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
      buyer.addUnit(new ReconUnit(x, y));
    }
    Game g = (Game)Start.s;
    g.menu = null;
  }
  int getPrice () {
    return 4000;
  }
}
