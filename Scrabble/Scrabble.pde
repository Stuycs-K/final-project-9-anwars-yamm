import java.util.ArrayList;
void setup(){
   size(800,800);
   int[] c1 = {0, 0};
   Letter a = new Letter(c1, false, 'B');
   a.display();
}

void draw(){
  
}

void mouseClicked(){
  int[] coord = {mouseX, mouseY};
  Letter a = new Letter(coord, false, 'B');
  a.display();
}
