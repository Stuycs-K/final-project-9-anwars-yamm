import java.util.ArrayList;
public class Player extends Inventory{
  private int playernum;
  
  
  public Player(ArrayList<Letter> hand, int pn){
    super(hand);
    playernum = pn;
    //constructer, private variable playernum/pn distinguishes which player is which
  }
  
  public void displayinv(){
    //prints all tiles in the player's hand on the left or right side of the screen, based on their player number
    if(playernum == 1){
      for(int counter = 0; counter < hand.size(); counter ++){
         int[] coordinates = {50, counter * 100 + 25};
         hand.get(counter).setCoord(coordinates);
        hand.get(counter).display();
    }
    }
    if(playernum == 2){
        for(int counter = 0; counter < hand.size(); counter ++){
         int[] coordinates = {950, counter * 100 + 25};
         hand.get(counter).setCoord(coordinates);
        hand.get(counter).display();
    }
    }
    }
  
  

  public void selectLetter(){
    
}

  public int getSize(){
    return hand.size();
  }
}
