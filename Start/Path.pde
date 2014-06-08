class Path{
  double distance;
  int x, y;
  ArrayList<Tile> p = new ArrayList<Tile>();
  public Path(Tile o,int x, int y){
    p.add(o);
    this.x = x;
    this.y = y;
    setDistance();
  }
  public Path(ArrayList<Tile> p, int x, int y){
    this.p = p;
    this.x = x;
    this.y = y;
    setDistance();
  }
  Tile getLast(){
    return p.get(p.size() - 1);
  }
  String direction(){
    return "";
  }
  int getMoveCost(){
    int sum = 0;
    for (int i = 1; i < p.size(); i++){
      sum += p.get(i).moveCost;
    }
    return sum;
  }
  Path add(Tile m){
    ArrayList<Tile> newPath = new ArrayList<Tile>();
    for (Tile t: p){
      newPath.add(t);
    }
    newPath.add(m);
    return new Path(newPath,x,y);
  }
  void setDistance(){
    distance = p.get(p.size() - 1).distance(x,y);
  }
  boolean found(){
    return (getLast().getX() == x && getLast().getY() == y); 
  }
}
  
