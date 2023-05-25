import java.util.ArrayList;
void setup(){
   size(800,800);
}

void draw(){
  
}

void mouseClicked(){
  int[] coord = {mouseX, mouseY};
  Letter a = new Letter(coord, false, 'A');
  a.display();
}
