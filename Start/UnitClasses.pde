class RedSoldier extends Unit{  

 /* public RedSoldier(Tile parent, int health){
    super(parent, health,255, 3);
  int[] sprites = {1,2,3,2};
    setAnimations(sprites);
   */ 
    
  public RedSoldier(int x, int y){
    super(x,y,20,3);
    int[] sprites = {1,2,3,2};
    setAnimations(sprites);
  }
}
