import java.util.ArrayList;
import java.util.Arrays;
public static Player x;
public static Player y;
public boolean rotation = false;
public int turn = 1;
public int stage = 1;
public Letter saved;
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

  //.display();
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
    if (stage==3) {
      stage=1;
      turn++;
    }
  }
}

void mouseClicked() {
  // int[] coord = {mouseX, mouseY};
  // Letter a = new Letter(coord, false, 'B');
  // a.display();
  /*int[] c = {0, 0};
   Letter testing = new Letter(c, false, 'D');
   y.remove();
   rect(0, -1, 60, 300);
   rect(360, -1, 60, 300);
   y.displayinv();
   x.displayinv();
   */
  if (stage==1) {
    if (rotation == false) {
      if (mouseX >= 20 && mouseX <= 40 && turn % 2 == 1) {
        for (int counter = 0; counter < x.getSize(); counter ++) {
          if (mouseY >= counter * 40 + 10 && mouseY <= counter * 40 + 30) {
            saved = x.remove(counter);
            fill(0);
            rect(0, -1, 60, 300);
            x.displayinv();
            rotation = true;
          }
        }
      } else if (mouseX >= 380 && mouseX <= 400 && turn  % 2 == 0) {
        for (int counter = 0; counter < y.getSize(); counter ++) {
          if (mouseY >= counter * 40 + 10 && mouseY <= counter * 40 + 30) {
            // rotation = true;
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
              int[] newcoords = {counter, inner};
              saved.setCoord(newcoords);
              saved.display();
              test.add(inner / 20, (counter - 60) / 20, saved.getLetter());
              rotation = false;
              //turn ++;
              // System.out.println("caught");
              counter = 1000;
              inner = 1000;
            }
          }
        }
      }
    }
  }
  if (stage==2) {
  }
}
