class RedSoldier extends Unit{  
  public RedSoldier(int x, int y){
    super(x,y,20,255);
    int[] sprites = {1,2,3,2};
    setAnimations(sprites);
  }
}
