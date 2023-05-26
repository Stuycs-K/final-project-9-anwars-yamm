import java.util.ArrayList;
public class Player extends Inventory{
  //array list instead of array
  private int size;
  private Letter movingLetter;
  private int playernum;
  
  public Player(ArrayList<Letter> hand, int s, Letter m, int pn){
    super(hand);
    size = s;
    movingLetter = m;
    playernum = pn;
  }
  
  public void displayinv(){
    if(playernum == 1){
      for(int counter = 0; counter < hand.size(); counter ++){
        for(int inner = 0; inner < hand.size() * 50; counter ++)
        hand.get(counter).display(0, 0);
      }
    }
    }
  }

  public void selectLetter(){
    
}
