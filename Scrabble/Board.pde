import java.util.ArrayList;
import java.util.Scanner;
public class Board{
  private Letter[][] board;
  private Inventory[] users;
  private int[][] wordMulti;
  private int[][] LetterMulti;
  private Letter[] activeHand;
  
  public Board(Letter[][] b, Inventory[] u, int[][] w, int[][] l, Letter[] a){
    board = b;
    users = u;
    wordMulti = w;
    LetterMulti = l;
    activeHand = a;
  }
  public void main(String[] args){
    System.out.println(wordCheckReturn("hello"));
  }
  int wordCheckReturn(String word){
  try{
     Scanner input = new Scanner(new File("dictionary.txt"));
     while(input.hasNextLine()){
        String line = input.nextLine();
        if(qualifies(word,line)){
          return(wordRawScore(word));
        }
     }
  }
  catch(FileNotFoundException ex){
  }
  return 0;
}
}
