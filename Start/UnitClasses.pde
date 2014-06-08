
class RedSoldier extends Unit{  


 /* public RedSoldier(Tile parent, int health){
    super(parent, health,255, 3);
  int[] sprites = {1,2,3,2};
    setAnimations(sprites);
<<<<<<< HEAD
   */ 
    
  public RedSoldier(int x, int y) {
    super(x, y, 3);
    int[] sprites = {
      1, 2, 3, 2
    };
    setAnimations(sprites);
  }
}
public class MechSoldier extends Unit {


  public MechSoldier(int x, int y) {
    super(x, y, 2);
    int[] sprites = {
      7, 8
    };
    setAnimations(sprites);
  }
}

public class ReconUnit extends Unit {
  public ReconUnit(int x, int y) {
    super(x, y, 8);
    int[] sprites = {
      11, 12, 13
    };
    setAnimations(sprites);
  }
}

public class TankUnit extends Unit {

  public TankUnit(int x, int y) {
    super(x, y, 6);
    int[] sprites = {
      14, 15, 16
    };
    setAnimations(sprites);
  }
}
public class BigTank extends Unit {
  public BigTank(int x, int y) {
    super(x, y, 5);
    int[] sprites = {
      17, 18, 19
    };
    setAnimations(sprites);
  }
}

public class APCUnit extends Unit {
  public APCUnit(int x, int y) {
    super(x, y, 6);
    int[] sprites = {
      23, 24, 25
    };
    setAnimations(sprites);
  }
}


public class ArtilleryUnit extends Unit {
  public ArtilleryUnit(int x, int y) {
    super(x, y, 2);
    int[] sprites = {
      26, 27, 28
    };
    setAnimations(sprites);
  }
}

