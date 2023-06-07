import java.util.ArrayList;
public class Letter {
  private char letter;
  private int value;

  public Letter(char l) {
    letter = l;
    String charAsString = String.valueOf(letter);
    value=0;
    if ("AEIOULNRST".contains(charAsString)) value=1;
    if ("DG".contains(charAsString)) value=2;
    if ("BCMP".contains(charAsString)) value=3;
    if ("FHVWY".contains(charAsString)) value=4;
    if ("K".contains(charAsString)) value=5;
    if ("JX".contains(charAsString)) value=8;
    if ("QZ".contains(charAsString)) value=10;
    //shortcut constructor
  }
  /*
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
   */

  public char getLetter() {
    return letter;
    //accessor method for the character
  }
  public int getValue() {
    return value;
    //accessor method for the character
  }

  public void display(int x, int y, int[][] letterMulti ) {
    int valueDisplayed = value;
    //creates a tile at the parameters x, y
    fill(210, 180, 140);
    square(x, y, 50);
    fill(0);
    textSize(25);
    text(letter, x + 15.75, y + 32.5);
    textSize(15);
    if(x >= 150 && x <= 900){
    int lM = letterMulti[(y)/50][(x-150)/50];
    if (lM==2) fill(99, 183, 183);
    if (lM==3) fill(5, 164, 203);
    valueDisplayed*=lM;
    }
    if (value>=10)text(valueDisplayed, x + 34, y + 44);
    else text(valueDisplayed, x + 40, y + 44);
  }
  public void display(int x, int y) {
    int valueDisplayed = value;
    //creates a tile at the parameters x, y
    fill(210, 180, 140);
    square(x, y, 50);
    fill(0);
    textSize(25);
    text(letter, x + 15.75, y + 32.5);
    textSize(15);
    if (value>=10)text(valueDisplayed, x + 34, y + 44);
    else text(valueDisplayed, x + 40, y + 44);
  }
}
