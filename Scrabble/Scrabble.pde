import java.util.ArrayList;

void setup(){
   System.out.println("hello");
   Board test = new Board();
   System.out.println(test.wordCheckReturn("HELLO"));
   System.out.println(test.wordCheckReturn("QUERY"));
   System.out.println(test.wordCheckReturn("***"));
   System.out.println(test.wordCheckReturn("**T"));
}

void draw(){
}

void mouseClicked(){
}
