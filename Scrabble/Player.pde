import java.util.ArrayList;
public class Player extends Inventory {
  private int playernum;


  public Player(ArrayList<Letter> hand, int pn) {
    super(hand);
    playernum = pn;
    //constructer, private variable playernum/pn distinguishes which player is which
  }

  public void displayinv() {
    //prints all tiles in the player's hand on the left or right side of the screen, based on their player number
    if (playernum == 1) {
      for (int counter = 0; counter < hand.size(); counter ++) {
        hand.get(counter).display(50, counter * 100 + 25);
      }
    }
    if (playernum == 2) {
      for (int counter = 0; counter < hand.size(); counter ++) {
        hand.get(counter).display(950, counter * 100 + 25);
      }
    }
  }

  public int getSize() {
    return hand.size();
  }
}
