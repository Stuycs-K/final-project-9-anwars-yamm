import java.util.ArrayList;
public class Inventory {
  public ArrayList<Letter> hand;

  public Inventory(ArrayList<Letter> hand) {
    this.hand = hand;
    //constructor
  }

  public void add(Letter h) {
    hand.add(h);
    //mutator method to add tiles to hand
  }
  
  public void addNewRep(ArrayList<Letter> bag, int repeat, char letter) {
    for (; repeat>0; repeat--) {
      bag.add(new Letter(letter));
      //repeats mutator method to add tiles to hand
    }
  }
  public Letter remove(int index) {
    if (index>=hand.size()) return null;
    return hand.remove(index);
    //mutator method to remove tiles from hand
  }

  public int getSize() {
    return hand.size();
    //accessor method to return size of hand
  }
  public void shuffle(){
    Collections.shuffle(hand);
  }

  public void hand(ArrayList<Letter> newHand) {
    //I don't think this method currently serves any purpose
    hand = newHand;
  }
}
