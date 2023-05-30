import java.util.ArrayList;
void setup(){
   size(800,800);
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

void draw(){
  
}

void mouseClicked(){
  int[] coord = {mouseX, mouseY};
  Letter a = new Letter(coord, false, 'B');
  a.display();
}
