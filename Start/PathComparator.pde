import java.util.*;
public class PathComparator implements Comparator<Path> {
  public Comparator<Path> pathCompare = new Comparator<Path>(){
    public int compare(Path a, Path b){
      return (int)(a.distance - b.distance); //http://www.journaldev.com/780/java-comparable-and-comparator-example-to-sort-objects
    }//this comparator sorts the path objects in the priority queue by their distance, so as to get the most efficient path
  };
  public int compare(Path a, Path b){
    return (int)(a.distance - b.distance);
  }
}

    
