import java.util.ArrayList;
import java.util.Arrays;

void setup() {

  size(420, 300);
  Board test = new Board();
  test.add(0,0,'C');
  test.Grid();
  test.add(0,1,'A');
  test.add(0,2,'T');
  test.Grid();
  String cat = test.getWord(0,0,0,2);
  println(cat);
  int activeValue = test.wordCheckReturn(cat)*test.calcWordMulti(0,0,0,2);
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
  hand1.add(new Letter(c1, false, 'A'));
  hand1.add(new Letter(c1, false, 'B'));
  hand1.add(new Letter(c1, false, 'C'));
  Player x = new Player(hand1, 1);
  x.displayinv();
  ArrayList<Letter> hand2 = new ArrayList<Letter>();
  hand2.add(new Letter(c1, false, 'A'));
  hand2.add(new Letter(c1, false, 'B'));
  hand2.add(new Letter(c1, false, 'C'));
  Player y = new Player(hand2, 2);
  y.displayinv();
}



void draw() {
}

void mouseClicked() {
  int[] coord = {mouseX, mouseY};
  Letter a = new Letter(coord, false, 'B');
  a.display();
}
