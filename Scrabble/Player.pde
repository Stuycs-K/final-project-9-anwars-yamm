import java.util.ArrayList;
public class Player extends Inventory {
  private int playernum;
  private int points;


  public Player(ArrayList<Letter> hand, int pn) {
    super(hand);
    playernum = pn;
    points = 0;
    //constructer, private variable playernum/pn distinguishes which player is which
  }

  public void addPoints(int point) {
    points = points + point;
  }

  public int getPoints() {
    return points;
  }
  public int getPointsFinalScore() {
    int penalty = 0;
    for (Letter deduct : hand) {
      penalty+=deduct.getValue();
    }
    return points-penalty;
  }

  public void displayinv() {
    //prints all tiles in the player's hand on the left or right side of the screen, based on their player number
    if (playernum == 1) {
      fill(209, 192, 168);
      rect(0, -1, 150, 750);
      for (int counter = 0; counter < hand.size(); counter ++) {
        hand.get(counter).display(50, counter * 100 + 25);
      }
      fill(133, 94, 66);
      text(points+" Total Points", 37.5, 725);
    }
    if (playernum == 2) {
      fill(209, 192, 168);
      rect(900, -1, 150, 750);
      for (int counter = 0; counter < hand.size(); counter ++) {
        hand.get(counter).display(950, counter * 100 + 25);
      }
      fill(133, 94, 66);
      text(points+" Total Points", 937.5, 725);
    }
  }

  public Letter swap(int index, Letter replaceWith) {
    if (index>=hand.size()) {
      hand.add(replaceWith);
      return null;
    } else {
      hand.add(index, replaceWith);
    }
    return hand.remove(index+1);
    //mutator method to swap tiles from hand
  }

  public int getSize() {
    return hand.size();
  }
}
