import java.util.ArrayList;
public class Letter{
  private char letter;
  private boolean status;
  private int[] coord;
  
  public Letter(int[] c, boolean s, char l){
    letter = l;
    coord = c;
    status = s;
  }
  
  public int[] getCoord(){
    return coord;
  }
  
  public boolean displayStatus(){
    return status;
  }
  
  public void setCoord(int[] c){
    coord = c;
  }
  
  public char getLetter(){
    return letter;
  }
  
  void display(int x, int y){
    c = color(210, 180, 140);
    fill(c);
    square(x, y, 10);
    d = color(0);
    fill(d);
    text(letter, x, y);
  }
}
