import java.util.ArrayList;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
public static class Board{
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
  
 public static int wordCheckReturn(String word){
   System.out.println("mark0");
    try{
       System.out.println("mark1");
       File dict = new File("dictionary.txt");
       System.out.println("mark2");
       Scanner input = new Scanner(dict);
       System.out.println("mark3");
       while(input.hasNextLine()){
          String line = input.nextLine();
          if(qualifies(word,line)){
            return(wordRawScore(word));
          }
          if(word.equals(line)){
            System.out.println("shortcut");
            return(wordRawScore(word));
          }
       }
    }
    catch(FileNotFoundException ex){
      System.out.println(ex);
    }
    return -1;
  }
  public static boolean qualifies(String input, String ref){
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
public static int wordRawScore(String word){
  int totalScore = 0;
  for(int i = 0; i < word.length(); i++)
  {
     String c = word.substring(i,i+1);
     if ("AEIOULNRST".contains(c)) totalScore+=1;
     if ("DG".contains(c)) totalScore+=2;
     if ("BCMP".contains(c)) totalScore+=3;
     if ("FHVWY".contains(c)) totalScore+=4;
     if ("K".contains(c)) totalScore+=5;
     if ("JK".contains(c)) totalScore+=8;
     if ("QZ".contains(c)) totalScore+=10;
  }
  return totalScore;
}
}
