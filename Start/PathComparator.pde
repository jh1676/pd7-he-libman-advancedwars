import java.util.*;
public class PathComparator implements Comparator<Path> {
  public Comparator<Path> pathCompare = new Comparator<Path>(){
    public int compare(Path a, Path b){
      return (int)(a.distance - b.distance); //http://www.journaldev.com/780/java-comparable-and-comparator-example-to-sort-objects
    }
  };
  public int compare(Path a, Path b){
    return (int)(a.distance - b.distance);
  }
}

    
