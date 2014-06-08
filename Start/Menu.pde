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
    rect(x, y, x+widthh, choices.size() * 20);
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
  }

  void add(Choice c) {
    choices.add(c);
  }
}

interface Choice {
  String getText();
  void action();
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

class ExitMenuChoice implements Choice {
  String getText() {
    return "Exit Menu";
  }

  void action() {
    Game g = (Game)Start.s;
    g.menu = null;
  }
}

