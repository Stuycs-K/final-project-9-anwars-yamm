import java.util.ArrayList;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
public class Board {
  private Letter[][] board;
  private Inventory[] users;
  private int[][] wordMulti;
  private int[][] LetterMulti;
  private Letter[][] active;




  public Board(Letter[][] b, Inventory[] u, int[][] w, int[][] l, Letter[][] a) {

    board = b;
    users = u;
    wordMulti = w;
    LetterMulti = l;
    active = a;
  }
  //test constructor
  public Board() {
    board = new Letter[15][15];
    active = new Letter[15][15];
    wordMulti = setUpWordMulti();
  }

  public Letter[][] getActive() {
    return active;
  }
  //draw the board, may create a new one for confirming
  void Grid() {
    int x = 60;
    int y = 0;
    stroke(255);
    for (; y<300; y+=20) {
      for (; x<360; x+=20) {
        int wM = wordMulti[(y)/20][(x-60)/20];
        if (wM==1) fill(216, 213, 194);
        if (wM==2) fill(210, 175, 181);
        if (wM==3) fill(240, 175, 171);
        /*
        int lM = letterMulti[(y)/20][(x-60)/20];
         if(lM==2) fill(182,203,204);
         if(lM==3) fill(5,164,203);
         */
        square(x, y, 20);
        Letter boardSet = (board[(y)/20][(x-60)/20]);
        if (boardSet!=null) {
          boardSet.display(x, y);
        }
        Letter activeSet = (active[(y)/20][(x-60)/20]);
        if (activeSet!=null) {
          activeSet.display(x, y);
        }
      }
      x=60;
    }
  }
  //setup method for the wordMulti array
  private int[][] setUpWordMulti() {
    int[][] multi = new int[15][15];
    for (int row = 0; row<multi.length; row++) {
      for (int col = 0; col<multi[1].length; col++) {
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

    multi[7][7]=2;
    return multi;
  }

  public void add(int row, int col, char makeTile) {
    Letter tile = new Letter(makeTile);
    active[row][col]=tile;
  }
  public void commit() {
    for (int i = 0; i<15; i++) {
      for (int j = 0; j<15; j++) {
        board[i][j]=active[i][j];
      }
    }
    active = new Letter[15][15];
  }
  public void commit(int row1, int col1, int row2, int col2) {
    int rowBig = Math.max(row1, row2);
    int rowSmall = Math.min(row1, row2);
    int colBig = Math.max(col1, col2);
    int colSmall = Math.min(col1, col2);

    if (col1==col2) {
      for (; rowSmall<=rowBig; rowSmall++) {
        board[rowSmall][colSmall]=active[rowSmall][colSmall];
      }
    } else {
      for (; colSmall<=colBig; colSmall++) {
        board[rowSmall][colSmall]=active[rowSmall][colSmall];
      }
    }
    active = new Letter[15][15];
  }
  public void undo(Player returnTo) {
    for (Letter[] row : active) {
      for (Letter col : row) {
        returnTo.add(col);
      }
    }
    active=new Letter[15][15];
  }

  //wrapper method for calculating score based on active
  public String getWord(int row1, int col1, int row2, int col2) {
    String word = "";
    int usedtiles = 0;
    int rowBig = Math.max(row1, row2);
    int rowSmall = Math.min(row1, row2);
    int colBig = Math.max(col1, col2);
    int colSmall = Math.min(col1, col2);

    if (col1==col2) {
      for (; rowSmall<=rowBig; rowSmall++) {
        Letter tile = active[rowSmall][colSmall];
        if (tile == null) {
          tile = board[rowSmall][colSmall];
          usedtiles--;
        }
        if (tile == null) return null;
        word+=String.valueOf(tile.getLetter());
        usedtiles++;
      }
    } else {
      for (; colSmall<=colBig; colSmall++) {
        Letter tile = active[rowSmall][colSmall];
        if (tile == null) {
          tile = board[rowSmall][colSmall];
          usedtiles--;
        }
        if (tile == null) return null;
        word+=String.valueOf(tile.getLetter());
        usedtiles++;
      }
    }
    if(usedtiles==0) return null;
    return word;
  }
  private int calcWordMulti(int row1, int col1, int row2, int col2) {
    int multi=1;
    int rowBig;
    int rowSmall;
    int colBig;
    int colSmall;

    if (col1>col2) {
      colBig = col1;
      colSmall = col2;
    } else {
      colBig = col2;
      colSmall = col1;
    }
    if (row1>row2) {
      rowBig = row1;
      rowSmall = row2;
    } else {
      rowBig = row2;
      rowSmall = row1;
    }
    if (col1==col2) {
      for (; colSmall<=colBig; colSmall++) {
        for (; rowSmall<=rowBig; rowSmall++) {
          multi*=wordMulti[rowSmall][colSmall];
        }
      }
    }
    if (row1==row2) {
      for (; rowSmall<=rowBig; rowSmall++) {
        for (; colSmall<=colBig; colSmall++) {
          multi*=wordMulti[rowSmall][colSmall];
        }
      }
    }
    return multi;
  }
  public int wordCheckReturn(String word) {
    String line;
    BufferedReader dict = createReader("dictionary.txt");
    try {
      line = dict.readLine();
    }
    catch(IOException e) {
      line = null;
    }
    while (line!=null) {
      if (qualifies(word, line)) {
        return(wordRawScore(word));
      }
      try {
        line = dict.readLine();
      }
      catch(IOException e) {
        line = null;
      }
    }
    return -1;
  }
  public boolean qualifies(String input, String ref) {
    if ((input.length())!=(ref.length())) return false;
    for (int i = 0; i < input.length(); i++) {
      char iChar = input.charAt(i);
      char rChar = ref.charAt(i);
      if (iChar=='*') {
      } else {
        if (iChar!=rChar) return false;
      }
    }
    return true;
  }
  public int wordRawScore(String word) {
    int totalScore = 0;
    for (int i = 0; i < word.length(); i++)
    {
      String c = word.substring(i, i+1);
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


  ///
}
