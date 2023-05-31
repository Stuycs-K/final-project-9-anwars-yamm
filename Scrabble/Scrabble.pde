import java.util.ArrayList;
import java.util.Arrays;
public static Player x;
public static Player y;
public boolean rotation = false;
public int turn = 1;
public Letter saved;

void setup(){
  
  size(420, 300);
  fill(0);
  rect(0, -1, 60, 300);
  rect(360, -1, 60, 300);
   Board test = new Board();
  test.Grid();
   System.out.println(test.wordCheckReturn("HELLO"));
   System.out.println(test.wordCheckReturn("QUERY"));
   System.out.println(test.wordCheckReturn("***"));
   System.out.println(test.wordCheckReturn("B*XRT"));
   for(int[] i : test.wordMulti){
     System.out.println(Arrays.toString(i));
   }
   //testing vertical, back and forth
   System.out.println(test.calcWordMulti(0,0,0,14));
   System.out.println(test.calcWordMulti(0,14,0,0));
   //testing across, forwards
   System.out.println(test.calcWordMulti(4,4,10,4));
   
   
   int[] c1 = {0, 0};
   Letter a = new Letter(c1, false, 'B');
  //.display();
   ArrayList<Letter> hand1 = new ArrayList<Letter>();
   hand1.add(new Letter(c1, false, 'A'));
   hand1.add(new Letter(c1, false, 'B'));
   hand1.add(new Letter(c1, false, 'C'));
   x = new Player(hand1, 1);
   x.displayinv();
     ArrayList<Letter> hand2 = new ArrayList<Letter>();
   hand2.add(new Letter(c1, false, 'A'));
   hand2.add(new Letter(c1, false, 'B'));
   hand2.add(new Letter(c1, false, 'C'));
   y = new Player(hand2, 2);
   y.displayinv();
}



void draw(){
}

void mouseClicked(){
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
 if (rotation == false){
 if(mouseX >= 20 && mouseX <= 40 && turn % 2 == 1){
    for(int counter = 0; counter < x.getSize(); counter ++){
      if(mouseY >= counter * 40 + 10 && mouseY <= counter * 40 + 30){
        turn ++;
        saved = x.remove(counter);
        fill(0);
        rect(0, -1, 60, 300);
        x.displayinv();
        rotation = true;
      }
    }
 }
 else if (mouseX >= 380 && mouseX <= 400 && turn  % 2 == 0){
      for(int counter = 0; counter < y.getSize(); counter ++){
      if(mouseY >= counter * 40 + 10 && mouseY <= counter * 40 + 30){
       // rotation = true;
        turn ++;
        saved = y.remove(counter);
        fill(0);
        rect(360, -1, 60, 300);
        y.displayinv();
        rotation = true;
      }
    }
 }
 }
 else{
   int[] newcoords = {mouseX, mouseY};
   saved.setCoord(newcoords);
   saved.display();
   rotation = false;
   System.out.println("caught");
 }
}
