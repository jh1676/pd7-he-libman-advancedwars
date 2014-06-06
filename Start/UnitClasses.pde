class RedSoldier extends Unit{  
  public RedSoldier(Tile parent, int health){
    super(parent, health,255, 3);
    int[] sprites = {1,2,3,2};
    setAnimations(sprites);
  }
}
