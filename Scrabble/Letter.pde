public class Letter{
  private char letter;
  private int status;
  private int[] coord;
  
  
  public Letter(int[] c, int s, char l){
    letter = l;
    coord = c;
    status = s;
  }
}
