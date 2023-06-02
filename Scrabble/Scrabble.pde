import java.util.ArrayList;
import java.util.Arrays;
public static Player x;
public static Player y;
public boolean rotation = false;
public int turn = 1;
public int stage = 1;
public Letter saved;
public int[] wordLocation = new int[4];
public Board test = new Board();

void setup() {

  size(420, 300);
  fill(0);
  rect(0, -1, 60, 300);
  rect(360, -1, 60, 300);
  test.add(0, 0, 'C');
  test.Grid();
  test.add(0, 1, 'A');
  test.add(0, 2, 'T');
  test.Grid();
  String cat = test.getWord(0, 0, 0, 2);
  println(cat);
  int activeValue = test.wordCheckReturn(cat)*test.calcWordMulti(0, 0, 0, 2);
  println(activeValue);
  test.commit();
  test.add(0, 3, 'S');
  test.Grid();
  String cats = test.getWord(0, 0, 0, 3);
  println(cats);
  activeValue = test.wordCheckReturn(cats)*test.calcWordMulti(0, 0, 0, 3);
  println(activeValue);
  /* OLD TESTING CODE, DETERMINED WORKS
   System.out.println(test.wordCheckReturn("HELLO"));
   System.out.println(test.wordCheckReturn("QUERY"));
   System.out.println(test.wordCheckReturn("***"));
   System.out.println(test.wordCheckReturn("B*XRT"));
   for (int[] i : test.wordMulti) {
   System.out.println(Arrays.toString(i));
   }
   //testing horizontal
   System.out.println(test.calcWordMulti(0, 0, 0, 14));
   System.out.println(test.calcWordMulti(0, 14, 0, 0));
   //testing vertical
   System.out.println(test.calcWordMulti(4, 4, 10, 4));
   */


  int[] c1 = {0, 0};
  Letter a = new Letter(c1, false, 'B');

  //initializes player hands/inventories with random letters
  ArrayList<Letter> hand1 = new ArrayList<Letter>();
  for (int counter = 0; counter < 7; counter ++) {
    hand1.add(new Letter(c1, false, (char) (Math.random()*26 + 65)));
  }
  x = new Player(hand1, 1);
  x.displayinv();
  ArrayList<Letter> hand2 = new ArrayList<Letter>();
  for (int counter = 0; counter < 7; counter ++) {
    hand2.add(new Letter(c1, false, (char) (Math.random()*26 + 65)));
  }
  y = new Player(hand2, 2);
  y.displayinv();
}



void draw() {
}
void keyReleased() {
  if (key == ENTER) {
    stage++;
    if (stage==4) {
      println(Arrays.toString(wordLocation));
      String userSubmit = test.getWord(wordLocation[0],wordLocation[1],wordLocation[2],wordLocation[3]);
      if(userSubmit==null){
        Player current = x;
        if (turn%2==0)current = y;
        //test.exit(current);
        println("feature doesnt exist yet! make an actual word");
      }
      else{
      int activeValue = test.wordCheckReturn(userSubmit)*test.calcWordMulti(wordLocation[0],wordLocation[1],wordLocation[2],wordLocation[3]);
      println(activeValue);
      test.commit(wordLocation[0],wordLocation[1],wordLocation[2],wordLocation[3]);
      turn++;
      }
      stage=1;
      
      //refills inventory during stage 2 or stage 3, after a player is done placing their tiles.
      int[] c1 = {0, 0};
      while (x.getSize() < 7){
        x.add(new Letter(c1, false, (char) (Math.random()*26 + 65)));
      }
      while(y.getSize() < 7){
        y.add(new Letter(c1, false, (char) (Math.random()*26 + 65)));
      }
      fill(0);
      rect(0, -1, 60, 300);
      x.displayinv();
      y.displayinv();
    }
  }
}

//mouseClicked: Has two main uses:
//1. Checks if the clicked x and y coordinates in the inventory area contains a tile. If it does, it removes the tile from the player's hand, assigns the tile to the variable "saved", and re-displays the inventory without the tile
//2. Given that the variable "saved" has a value, mouseClicked places the saved tile onto the board with the condition that the desired square does not already have a tile on it.
void mouseClicked() {
  if (stage==1) {
    if (rotation == false) {
      if (mouseX >= 20 && mouseX <= 40 && turn % 2 == 1) {
        //condition for player x / 1 (leftmost inventory)
        for (int counter = 0; counter < x.getSize(); counter ++) {
          if (mouseY >= counter * 40 + 10 && mouseY <= counter * 40 + 30) {
            //checks if mouseY and mouseX are hovering over a tile, saves the tile, and redisplays the inventory without the tile.
            saved = x.remove(counter);
            fill(0);
            rect(0, -1, 60, 300);
            x.displayinv();
            rotation = true;
          }
        }
      } else if (mouseX >= 380 && mouseX <= 400 && turn  % 2 == 0) {
        //condition for player y / 2 (rightmost inventory)
        for (int counter = 0; counter < y.getSize(); counter ++) {
          if (mouseY >= counter * 40 + 10 && mouseY <= counter * 40 + 30) {
            //checks if mouseY and mouseX are hovering over a tile, saves the tile, and redisplays the inventory without the tile.
            saved = y.remove(counter);
            fill(0);
            rect(360, -1, 60, 300);
            y.displayinv();
            rotation = true;
          }
        }
      }
    } else {
      if (mouseX >= 60 && mouseX <= 360) {
        for (int counter = 60; counter <= 340; counter = counter + 20) {
          for (int inner = 0; inner <= 280; inner = inner + 20) {
            if (mouseX >= counter && mouseX <= counter + 20 && mouseY >= inner && mouseY <= inner + 20 && (test.getActive())[inner / 20][(counter - 60) / 20] == null) {
             //checks if mouseX and mouseY are on a valid board square (that is empty), adds the saved tile to the board (both visually and to the array)
            int[] newcoords = {counter, inner};
              saved.setCoord(newcoords);
              saved.display();
              test.add(inner / 20, (counter - 60) / 20, saved.getLetter());
              rotation = false;
              counter = 1000;
              inner = 1000;
            }
          }
        }
      }
    }
  }
  if (stage==2||stage==3) {
    if (mouseX >= 60 && mouseX <= 360) {
        for (int counter = 60; counter <= 340; counter = counter + 20) {
          for (int inner = 0; inner <= 280; inner = inner + 20) {
            if (mouseX >= counter && mouseX <= counter + 20 && mouseY >= inner && mouseY <= inner + 20) {
              if(stage==2){
                wordLocation[0]=(inner/20);
                wordLocation[1]=((counter-60)/20);
                stage++;
              }
              else{
                wordLocation[2]=(inner/20);
                wordLocation[3]=((counter-60)/20);
              }
              counter = 1000;
              inner = 1000;
            }
          }
        }
      }
      
  }
}
