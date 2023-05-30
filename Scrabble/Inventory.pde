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
  
  public Letter remove(){
    return hand.remove(hand.size() - 1);
  }
  
  public void hand(ArrayList<Letter> newHand){
    hand = newHand;
  }
  
  
}
