import java.util.ArrayList;
public class Inventory{
  //array list instead
  public ArrayList<Letter> hand;
  
  public Inventory(ArrayList<Letter> hand){
    this.hand = hand;
  }
  
  public void add(Letter h){
    hand.add(h);
  }
  
  public Letter remove(int index){
    return hand.remove(index);
  }
  
  public void hand(ArrayList<Letter> newHand){
    hand = newHand;
  }
  
  
}
