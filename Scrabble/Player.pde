import java.util.ArrayList;
public class Player extends Inventory{
  //array list instead of array
  private int playernum;
  
  public Player(ArrayList<Letter> hand, int pn){
    super(hand);
    playernum = pn;
  }
  
  public void displayinv(){
    if(playernum == 1){
      for(int counter = 0; counter < hand.size(); counter ++){
         int[] coordinates = {20, counter * 40 + 10};
         hand.get(counter).setCoord(coordinates);
        hand.get(counter).display();
    }
    }
    if(playernum == 2){
        for(int counter = 0; counter < hand.size(); counter ++){
         int[] coordinates = {380, counter * 40 + 10};
         hand.get(counter).setCoord(coordinates);
        hand.get(counter).display();
    }
    }
    }
  
  

  public void selectLetter(){
    
}
}
