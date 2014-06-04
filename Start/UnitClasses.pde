class RedSoldier extends Unit{  
  public RedSoldier(int health){
    super(health,255);
    int[] sprites = {1,2,3,2};
    setAnimations(sprites);
  }
}
