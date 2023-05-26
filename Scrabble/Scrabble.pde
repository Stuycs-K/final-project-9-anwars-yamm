import java.util.ArrayList;
import java.util.Arrays;

void setup(){
   Board test = new Board();
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
   
}

void draw(){
}

void mouseClicked(){
}
