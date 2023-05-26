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
    LetterMulti = setUpWordMulti();
    activeHand = a;
  }
  public Board(){
    LetterMulti = setUpWordMulti();
  }
 private int[][] setUpWordMulti(){
   int[][] multi = new int[15][15];
   for(int row = 0; row<multi.length; row++){
     for(int col = 0; col<multi[1].length; col++){
       multi[row][col]=1;
     }
   }
   multi[0][0]=3;
   multi[0][7]=3;
   multi[0][14]=3;
   multi[7][0]=3;
   multi[7][14]=3;
   multi[14][0]=3;
   multi[14][7]=3;
   multi[14][14]=3;
   
   multi[1][1]=2;
   multi[2][2]=2;
   multi[3][3]=2;
   multi[4][4]=2;
   
   multi[1][13]=2;
   multi[2][12]=2;
   multi[3][11]=2;
   multi[4][10]=2;
   
   multi[10][4]=2;
   multi[11][3]=2;
   multi[12][2]=2;
   multi[13][1]=2;
   
   multi[10][10]=2;
   multi[11][11]=2;
   multi[12][12]=2;
   multi[13][13]=2;
   return multi;
 }
 private int calcWordMulti(int x1, int y1, int x2, int y2){
   int multi=1;
   int deltaX = Math.abs(x2-x1);
   int deltaY = Math.abs(y2-x1);
   int xbig;
   int xsmall;
   int ybig;
   int ysmall;
   
   if(x1>x2){
     xbig = x1;
     xsmall = x2;
   }
   else{
     xbig = x2;
     xsmall = x1;
   }
   if(y1>y2){
     ybig = y1;
     ysmall = y2;
   }
   else{
     ybig = y2;
     ysmall = y1;
   }
   
   for(;ysmall<ybig+1;ysmall++){
     for(;xsmall<xbig+1;xsmall++){
       multi*=wordMulti[ysmall][xsmall];
     }
   }
   return multi;
 }
 public int wordCheckReturn(String word){
   String line;
   BufferedReader dict = createReader("dictionary.txt");
   try{
     line = dict.readLine();
   }
   catch(IOException e){
     line = null;
   }
   while(line!=null){
     if(qualifies(word,line)){
       return(wordRawScore(word));
     }
     try{
       line = dict.readLine();
     }
     catch(IOException e){
       line = null;
     }
   }
    return -1;
  }
  public boolean qualifies(String input, String ref){
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
public int wordRawScore(String word){
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
