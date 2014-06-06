class RedSoldier extends Unit{  

  public RedSoldier(Tile parent, int health){
    super(parent, health,255, 3);
  int[] sprites = {1,2,3,2};
    setAnimations(sprites);
    
    /*
  public RedSoldier(int x, int y){
    super(x,y,20,255);
>>>>>>> ca54b99d1f9c31148f174cdcbfdeea6c31334d98
    int[] sprites = {1,2,3,2};
    setAnimations(sprites);
    */
  }
}
