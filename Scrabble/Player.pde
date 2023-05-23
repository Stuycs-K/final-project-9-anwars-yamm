import java.util.ArrayList;
public class Player extends Inventory{
  //array list instead of array
  private int size;
  private Letter movingLetter;
  
  public Player(int s, Letter m, ArrayList<Letter> h){
    super(h);
    size = s;
    movingLetter = m;
  }
}
