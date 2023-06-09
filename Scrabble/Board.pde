import java.util.ArrayList;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
public class Board {
  private Letter[][] board;
  private int[][] wordMulti;
  private int[][] letterMulti;
  private Letter[][] active;

  //Final constructor
  public Board() {
    board = new Letter[15][15];
    active = new Letter[15][15];
    wordMulti = setUpWordMulti();
    letterMulti = setUpLetterMulti();
  }
  //Accessors
  public Letter[][] getActive() {
    return active;
  }
  //draw the board
  void Grid() {
    int x = 150;
    int y = 0;
    stroke(255);
    for (; y<750; y+=50) {
      for (; x<900; x+=50) {
        int wM = wordMulti[(y)/50][(x-150)/50];
        if (wM==1) fill(216, 213, 194);
        if (wM==2) fill(210, 175, 181);
        if (wM==3) fill(240, 175, 171);

        //letterMulti coloration
        int lM = letterMulti[(y)/50][(x-150)/50];
        if (lM==2) fill(182, 203, 204);
        if (lM==3) fill(5, 164, 203);

        square(x, y, 50);
        Letter boardSet = (board[(y)/50][(x-150)/50]);
        if (boardSet!=null) {
          boardSet.display(x, y, letterMulti);
        }
        Letter activeSet = (active[(y)/50][(x-150)/50]);
        if (activeSet!=null) {
          activeSet.display(x, y, letterMulti);
        }
      }
      x=150;
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
  //setup method for the letterMulti array
  private int[][] setUpLetterMulti() {
    int[][] multi = new int[15][15];
    for (int row = 0; row<multi.length; row++) {
      for (int col = 0; col<multi[1].length; col++) {
        multi[row][col]=1;
      }
    }
    multi[1][5]=3;
    multi[1][9]=3;
    multi[5][1]=3;
    multi[5][5]=3;
    multi[5][9]=3;
    multi[5][13]=3;
    multi[9][1]=3;
    multi[9][5]=3;
    multi[9][9]=3;
    multi[9][13]=3;
    multi[13][5]=3;
    multi[13][9]=3;
    multi[0][3]=2;
    multi[0][11]=2;
    multi[2][6]=2;
    multi[2][8]=2;
    multi[3][0]=2;
    multi[3][7]=2;
    multi[3][14]=2;
    multi[6][2]=2;
    multi[6][6]=2;
    multi[6][8]=2;
    multi[6][12]=2;
    multi[7][3]=2;
    multi[7][11]=2;
    multi[8][2]=2;
    multi[8][6]=2;
    multi[8][8]=2;
    multi[8][12]=2;
    multi[11][0]=2;
    multi[11][7]=2;
    multi[11][14]=2;
    multi[12][6]=2;
    multi[12][8]=2;
    multi[14][3]=2;
    multi[14][11]=2;
    return multi;
  }
  //adds a new Letter to the active array
  public void add(int row, int col, char makeTile) {
    Letter tile = new Letter(makeTile);
    active[row][col]=tile;
  }
  //moves the approved letters to board array
  public void commit(int[] coords) {
    int rowSmall = coords[0];
    int colSmall = coords[1];
    int rowBig = coords[2];
    int colBig = coords[3];

    if (colSmall==colBig) {
      for (; rowSmall<=rowBig; rowSmall++) {
        if (active[rowSmall][colSmall]!=null) board[rowSmall][colSmall]=active[rowSmall][colSmall];
        wordMulti[rowSmall][colSmall]=1;
        letterMulti[rowSmall][colSmall]=1;
      }
    } else {
      for (; colSmall<=colBig; colSmall++) {
        if (active[rowSmall][colSmall]!=null) board[rowSmall][colSmall]=active[rowSmall][colSmall];
        wordMulti[rowSmall][colSmall]=1;
        letterMulti[rowSmall][colSmall]=1;
      }
    }
    active = new Letter[15][15];
  }
  //moves all noncommitted/active Letters to a players inventory
  public void undo(Player returnTo) {
    for (Letter[] row : active) {
      for (Letter col : row) {
        if (col!=null) {
          returnTo.add(new Letter(col.getLetter()));
        }
      }
    }
    active=new Letter[15][15];
  }

  //translates stored coordinates into a word
  public String getWord(int[] coords) {
    String word = "";
    int usedtiles = 0;
    int rowSmall = coords[0];
    int colSmall = coords[1];
    int rowBig = coords[2];
    int colBig = coords[3];
    boolean passthrough=false;
    if (colSmall==colBig) {
      if ((colSmall==7)&&((rowBig>=7)&&(rowSmall<=7)))passthrough=true;
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
      if ((rowSmall==7)&&((colBig>=7)&&(colSmall<=7)))passthrough=true;
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
    if (usedtiles==0) return null;
    if ( (usedtiles==word.length())&&(!passthrough) ) return null;
    return word;
  }
  //calculates the overall word score
  public int wordValueWithPremiums(int[] coords) {
    String word = getWord(coords);
    boolean adj = checkAdjacents(coords);
    if (wordCheck(word)&&adj) {
      int value=0;
      int rowSmall = coords[0];
      int colSmall = coords[1];
      int rowBig = coords[2];
      int colBig = coords[3];
      if (colSmall==colBig) {
        for (; rowSmall<=rowBig; rowSmall++) {
          Letter tile = active[rowSmall][colSmall];
          if (tile == null) {
            tile = board[rowSmall][colSmall];
          }
          value+=tile.getValue()*letterMulti[rowSmall][colSmall];
        }
      } else {
        for (; colSmall<=colBig; colSmall++) {
          Letter tile = active[rowSmall][colSmall];
          if (tile == null) {
            tile = board[rowSmall][colSmall];
          }
          value+=tile.getValue()*letterMulti[rowSmall][colSmall];
        }
      }
      return value*calcWordMulti(coords);
    }
    return 0;
  }

  //calculates the compounded word multiplier
  private int calcWordMulti(int[] coords) {
    int multi=1;
    int rowSmall = coords[0];
    int colSmall = coords[1];
    int rowBig = coords[2];
    int colBig = coords[3];
    if (colSmall==colBig) {
      for (; colSmall<=colBig; colSmall++) {
        for (; rowSmall<=rowBig; rowSmall++) {
          multi*=wordMulti[rowSmall][colSmall];
        }
      }
    } else {
      for (; rowSmall<=rowBig; rowSmall++) {
        for (; colSmall<=colBig; colSmall++) {
          multi*=wordMulti[rowSmall][colSmall];
        }
      }
    }
    return multi;
  }

  public boolean checkAdjacents(int coords[]) {
    int rowSmall = coords[0];
    int colSmall = coords[1];
    int rowBig = coords[2];
    int colBig = coords[3];
    if (colSmall == colBig) {
      for (; rowSmall<=rowBig; rowSmall++) {
        if (!tileCheckHoriz(rowSmall, colSmall))return false;
      }
    } else {
      for (; colSmall<=colBig; colSmall++) {
        if (!tileCheckVert(rowSmall, colSmall))return false;
      }
    }
    return(true);
  }

  private boolean tileCheckVert(int row, int col) {
    int startIndex = row;
    while (startIndex>0) {
      Letter tileBack = board[startIndex-1][col];
      if (tileBack != null) {
        startIndex--;
      } else {
        break;
      }
    }
    String word = "";
    while (startIndex < 15) {
      Letter tileAdd = board[startIndex][col];
      if (tileAdd!=null) {
        word+=String.valueOf(tileAdd.getLetter());
        startIndex++;
      } else {
        tileAdd = active[startIndex][col];
        if (tileAdd != null) {
          word+=String.valueOf(tileAdd.getLetter());
          startIndex++;
        }
        else break;
      }
    }
    if (word.length()==1)return true;
    return wordCheck(word);
  }

  private boolean tileCheckHoriz(int row, int col) {
    int startIndex = col;
    while (startIndex>0) {
      Letter tileBack = board[row][startIndex-1];
      if (tileBack != null) {
        startIndex--;
      } else {
        break;
      }
    }
    String word = "";
    while (startIndex < 15) {
      Letter tileAdd = board[row][startIndex];
      if (tileAdd!=null) {
        word+=String.valueOf(tileAdd.getLetter());
        startIndex++;
      } else {
        tileAdd = active[row][startIndex];
        if (tileAdd != null) {
          word+=String.valueOf(tileAdd.getLetter());
          startIndex++;
        }
        else break;
      }
    }
    if (word.length()==1)return true;
    return wordCheck(word);
  }

  //indexes the dictionary and checks each word
  public boolean wordCheck(String word) {
    if (word==null) return false;
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
        return(true);
      }
      try {
        line = dict.readLine();
      }
      catch(IOException e) {
        line = null;
      }
    }
    return false;
  }
  //checks if the input word is the same as the refrence word given blank tiles
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
}
