import java.util.ArrayList;
public class Letter {
  private char letter;
  private boolean status;
  private int[] coord;

  public Letter(int[] c, boolean s, char l) {
    letter = l;
    coord = c;
    status = s;
    //constructor
  }
  public Letter(char l) {
    letter = l;
    status = false;
    //shortcut constructor
  }

  public int[] getCoord() {
    return coord;
    //accessor method for coordinates
  }
  

  public boolean displayStatus() {
    return status;
    //I don't think the status variable currently serves any purpose
  }

  public void setCoord(int[] c) {
    coord = c;
    //mutator method for the coordinates
  }

  public char getLetter() {
    return letter;
    //accessor method for the character
  }

  public void display() {
    //creates a tile at the "coord[]" private variable
    fill(210, 180, 140);
    square(coord[0], coord[1], 20);
    fill(0);
    text(letter, coord[0] + 6.3, coord[1] + 13);
  }
  public void display(int x, int y) {
    //creates a tile at the parameters x, y
    fill(210, 180, 140);
    square(x, y, 20);
    fill(0);
    text(letter, x + 6.3, y + 13);
  }
}
