import java.util.ArrayList;
public class Letter {
  private char letter;
  private boolean status;
  private int[] coord;

  public Letter(int[] c, boolean s, char l) {
    letter = l;
    coord = c;
    status = s;
  }
  public Letter(char l) {
    letter = l;
    status = false;
  }

  public int[] getCoord() {
    return coord;
  }
  

  public boolean displayStatus() {
    return status;
  }

  public void setCoord(int[] c) {
    coord = c;
  }

  public char getLetter() {
    return letter;
  }

  public void display() {
    fill(210, 180, 140);
    square(coord[0], coord[1], 20);
    fill(0);
    text(letter, coord[0] + 6.3, coord[1] + 13);
  }
  public void display(int x, int y) {
    fill(210, 180, 140);
    square(x, y, 20);
    fill(0);
    text(letter, x + 6.3, y + 13);
  }
}
