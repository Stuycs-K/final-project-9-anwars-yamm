import java.util.ArrayList;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
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
boolean qualifies(String input, String ref){
  if((input.length())!=(ref.length())) return false;
  for(int i = 0; i < input.length(); i++){
    char iChar = input.charAt(i);
    char rChar = ref.charAt(i);
    if(iChar=='*'){
    }
    else{
      if(iChar!=rChar) return false;
    }
  }
  return true;
}
int wordRawScore(String word){
  int totalScore = 0;
  for(int i = 0; i < word.length(); i++)
  {
     String c = word.substring(i,i+1);
     if ("aeioulnrst".contains(c)) totalScore+=1;
     if ("dg".contains(c)) totalScore+=2;
     if ("bcmp".contains(c)) totalScore+=3;
     if ("fhvwy".contains(c)) totalScore+=4;
     if ("k".contains(c)) totalScore+=5;
     if ("jx".contains(c)) totalScore+=8;
     if ("qz".contains(c)) totalScore+=10;
  }
  return totalScore;
}
}
