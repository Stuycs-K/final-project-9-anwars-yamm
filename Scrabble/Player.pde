public class Player extends Inventory{
  private char letter;
  private int status;
  private int[] coord;
  private int size;
  private Letter movingLetter;
  
  public Player(int s, Letter m){
    super(letter, status, coord);
    size = s;
    movingLetter = m;
  }
}
