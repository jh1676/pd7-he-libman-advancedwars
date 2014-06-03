class RedSoldier extends Unit{  
  public RedSoldier(int x, int y, int health){
    super(x,y,health,255);
    int[] sprites = {1,2,3};
    setAnimations(sprites);
  }
}
