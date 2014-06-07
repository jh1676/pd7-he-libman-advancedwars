class Path{
  double distance;
  int x, y;
  ArrayList<Tile> p = new ArrayList<Tile>();
  public Path(Tile o,int x, int y){
    this.x = x;
    this.y = y;
    p.add(o);
    setDistance(x,y);
  }
  public Path(ArrayList<Tile> p, int x, int y){
    this.x = x;
    this.y = y;
    this.p = p;
    setDistance(x,y);
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
    return new Path(newPath,m.x,m.y);
  }
  void setDistance(int x, int y){
    distance = p.get(p.size() - 1).distance(x,y);
  }
  boolean found(int a, int b){
    return (x == a && y == b); 
  }
}
  
