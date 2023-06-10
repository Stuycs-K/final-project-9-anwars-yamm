import java.util.ArrayList;
import java.util.Arrays;
import java.util.*;
public static Player x;
public static Player y;
public static Inventory bag;
public boolean rotation = false;
public int turn = 1;
public int stage = 1;
public Letter saved;
public int[] wordLocation = new int[4];
public Board test = new Board();

void setup() {

  size(1050, 750);
  fill(209, 192, 168);
  rect(0, -1, 150, 750);
  rect(900, -1, 150, 750);

  test.Grid();
  /* OLD TESTING CODE, DETERMINED WORKS
   
   Mason's testing code
   test.add(0, 0, 'C');
   test.add(0, 1, 'A');
   test.add(0, 2, 'T');
   test.Grid();
   String cat = test.getWord(0, 0, 0, 2);
   println(cat);
   int activeValue = test.wordCheckReturn(cat)*test.calcWordMulti(0, 0, 0, 2);
   println(activeValue);
   test.commit();
   test.add(0, 3, 'S');
   test.Grid();
   String cats = test.getWord(0, 0, 0, 3);
   println(cats);
   activeValue = test.wordCheckReturn(cats)*test.calcWordMulti(0, 0, 0, 3);
   println(activeValue);
   
   System.out.println(test.wordCheckReturn("HELLO"));
   System.out.println(test.wordCheckReturn("QUERY"));
   System.out.println(test.wordCheckReturn("***"));
   System.out.println(test.wordCheckReturn("B*XRT"));
   for (int[] i : test.wordMulti) {
   System.out.println(Arrays.toString(i));
   }
   //testing horizontal
   System.out.println(test.calcWordMulti(0, 0, 0, 14));
   System.out.println(test.calcWordMulti(0, 14, 0, 0));
   //testing vertical
   System.out.println(test.calcWordMulti(4, 4, 10, 4));
   
   Shaon's testing code
   Letter a = new Letter(c1, false, 'B');
   */

  //initializes player hands/inventories with random letters
  int[] c1 = {0, 0};

  ArrayList<Letter> preset1 = new ArrayList<Letter>();
  preset1.add(new Letter('A'));
  preset1.add(new Letter('D'));
  preset1.add(new Letter('I'));
  preset1.add(new Letter('E'));
  preset1.add(new Letter('U'));
  preset1.add(new Letter('O'));
  preset1.add(new Letter('S'));

  ArrayList<Letter> preset2 = new ArrayList<Letter>();
  preset2.add(new Letter('S'));
  preset2.add(new Letter('C'));
  preset2.add(new Letter('R'));
  preset2.add(new Letter('A'));
  preset2.add(new Letter('B'));
  preset2.add(new Letter('B'));
  preset2.add(new Letter('L'));

  ArrayList<Letter> preset3 = new ArrayList<Letter>();
  preset3.add(new Letter('C'));
  preset3.add(new Letter('A'));
  preset3.add(new Letter('Z'));
  preset3.add(new Letter('I'));
  preset3.add(new Letter('Q'));
  preset3.add(new Letter('U'));
  preset3.add(new Letter('E'));

  ArrayList<Letter> bagAL = new ArrayList<Letter>();
  bag = new Inventory(bagAL);
  bag.addNewRep(bagAL, 2, '*');
  bag.addNewRep(bagAL, 12, 'E');
  bag.addNewRep(bagAL, 9, 'A');
  bag.addNewRep(bagAL, 9, 'I');
  bag.addNewRep(bagAL, 8, 'O');
  bag.addNewRep(bagAL, 6, 'N');
  bag.addNewRep(bagAL, 6, 'R');
  bag.addNewRep(bagAL, 6, 'T');
  bag.addNewRep(bagAL, 4, 'L');
  bag.addNewRep(bagAL, 4, 'S');
  bag.addNewRep(bagAL, 4, 'U');
  bag.addNewRep(bagAL, 4, 'D');
  bag.addNewRep(bagAL, 3, 'G');
  bag.addNewRep(bagAL, 2, 'B');
  bag.addNewRep(bagAL, 2, 'C');
  bag.addNewRep(bagAL, 2, 'M');
  bag.addNewRep(bagAL, 2, 'P');
  bag.addNewRep(bagAL, 2, 'F');
  bag.addNewRep(bagAL, 2, 'H');
  bag.addNewRep(bagAL, 2, 'V');
  bag.addNewRep(bagAL, 2, 'W');
  bag.addNewRep(bagAL, 2, 'Y');
  bag.addNewRep(bagAL, 1, 'K');
  bag.addNewRep(bagAL, 1, 'J');
  bag.addNewRep(bagAL, 1, 'X');
  bag.addNewRep(bagAL, 1, 'Q');
  bag.addNewRep(bagAL, 1, 'Z');
  Collections.shuffle(bagAL);

  bag = new Inventory(bagAL);

  ArrayList<Letter> hand1 = new ArrayList<Letter>();
  for (int counter = 0; counter < 7; counter ++) {
    Letter add = bag.remove(0);
    hand1.add(add);
  }
  ArrayList<Letter> hand2 = new ArrayList<Letter>();
  for (int counter = 0; counter < 7; counter ++) {
    Letter add = bag.remove(0);
    hand2.add(add);
  }

  x = new Player(hand1, 1);
  x.displayinv();

  y = new Player(hand2, 2);
  y.displayinv();

  println("Player 1's turn is ongoing. Use left inventory to place tiles. Press enter to enter confirmation stage.");
}

void draw() {
  if (saved!=null) {
    x.displayinv();
    y.displayinv();
    test.Grid();
    saved.display(mouseX-25, mouseY-25);
  }
}
void keyReleased() {
  if (key == ENTER) {
    Player current = x;
    if (turn%2==0)current = y;
    stage++;
    if (stage==1) {
      if (current == x)println("Player 1's turn is ongoing. Use left inventory to place tiles. Press enter to enter confirmation stage.");
      if (current == y)println("Player 2's turn is ongoing. Use right inventory to place tiles. Press enter to enter confirmation stage.");
    }
    if (stage==2) {
      if (current == x)println("Player 1's turn is ongoing. Click the start and end tiles of the word you wish to submit. Press enter once finished.");
      if (current == y)println("Player 2's turn is ongoing. Click the start and end tiles of the word you wish to submit. Press enter once finished.");
    }
    if (stage==4) {
      int[] formatted = new int[4];
      formatted[0] = Math.min(wordLocation[0], wordLocation[2]);//rowSmall
      formatted[1] = Math.min(wordLocation[1], wordLocation[3]);//colSmall
      formatted[2] = Math.max(wordLocation[0], wordLocation[2]);//rowBig
      formatted[3] = Math.max(wordLocation[1], wordLocation[3]);//colBig
      //translates stored coordinates into a word
      String userSubmit = test.getWord(formatted);
      //gets score value of the word(<0 if invalid)
      int activeValue = test.wordValueWithPremiums(formatted);
      //if the word is valid, the board stores it, removes stray letters, and moves on to the next player
      if (activeValue>0) {
        if (current == x)println("Player 1's turn is over. Player submitted word: "+userSubmit+", which increased their points by "+activeValue);
        if (current == y)println("Player 2's turn is over. Player submitted word: "+userSubmit+", which increased their points by "+activeValue);
        test.commit(formatted);
        test.undo(current);
        test.Grid();
        turn++;
      } else {
        //if the word is invalid, the board removes new letters, and stays on the same player
        println("Word invalid, please try again.");
        test.undo(current);
        test.Grid();
      }
      stage=1;
      //refills inventory after stage 3, after a player has submitted their word.
      int[] c1 = {0, 0};
      while (x.getSize() < 7) {
        if (bag.getSize()!=0) {
          Letter add = bag.remove(0);
          x.add(add);
        }
      }
      while (y.getSize() < 7) {
        if (bag.getSize()!=0) {
          Letter add = bag.remove(0);
          y.add(add);
        }
      }
      x.displayinv();
      y.displayinv();
    }
  }
}

//mouseClicked: Has two main uses:
//in stage 1 mode, aka placing tiles
//1. Checks if the clicked x and y coordinates in the inventory area contains a tile. If it does, it removes the tile from the player's hand, assigns the tile to the variable "saved", and re-displays the inventory without the tile
//2. Given that the variable "saved" has a value, mouseClicked places the saved tile onto the board with the condition that the desired square does not already have a tile on it.
//in stage 2/3 mode, aka confirming word to submit
//1. Records the start or end point of the submitted word and saves it to the variable wordLocation
void mouseClicked() {
  if (stage==1) {
    if (mouseX >= 50 && mouseX <= 100 && turn % 2 == 1) {
      //condition for player x / 1 (leftmost inventory)
      for (int counter = 0; counter < 7; counter ++) {
        if (mouseY >= counter * 100 + 25 && mouseY <= counter * 100 + 75) {
          //checks if mouseY and mouseX are hovering over a tile, saves the tile, and redisplays the inventory without the tile.
          if (saved == null) {
            saved = x.remove(counter);
          } else {
            saved = x.swap(counter, saved);
          }
          x.displayinv();
        }
      }
    } else if (mouseX >= 950 && mouseX <= 1000 && turn  % 2 == 0) {
      //condition for player y / 2 (rightmost inventory)
      for (int counter = 0; counter < 7; counter ++) {
        if (mouseY >= counter * 100 + 25 && mouseY <= counter * 100 + 75) {
          //checks if mouseY and mouseX are hovering over a tile, saves the tile, and redisplays the inventory without the tile.
          if (saved == null) {
            saved = y.remove(counter);
          } else {
            saved = y.swap(counter, saved);
          }
          y.displayinv();
        }
      }
    }
    if (mouseX >= 150 && mouseX <= 900) {
      Player current = x;
      if (turn%2==0)current = y;
      for (int counter = 150; counter <= 850; counter = counter + 50) {
        for (int inner = 0; inner <= 700; inner = inner + 50) {
          if (mouseX >= counter && mouseX <= counter + 50 && mouseY >= inner && mouseY <= inner + 50) {
            if (saved==null) {
              if (test.isEmpty(inner / 50, (counter - 150) / 50)) {
                shuffle(current);
              } else {
                saved = test.remove(inner / 50, (counter - 150) / 50);
              }
            }
            //checks if mouseX and mouseY are on a valid board square (that is empty), adds the saved tile to the board (both visually and to the array)
            else {
              saved=test.add(inner / 50, (counter - 150) / 50, saved.getLetter());
              test.Grid();
            }
            counter = 2000;
            inner = 2000;
          }
        }
      }
    }
  }


  if (stage==2||stage==3) {
    if (mouseX >= 150 && mouseX <= 900) {
      for (int counter = 150; counter <= 850; counter = counter + 50) {
        for (int inner = 0; inner <= 700; inner = inner + 50) {
          if (mouseX >= counter && mouseX <= counter + 50 && mouseY >= inner && mouseY <= inner + 50) {

            if (stage==2) {
              wordLocation[0]=(inner/50);
              wordLocation[1]=((counter-150)/50);
              circle(counter+5, inner+5, 5);
              stage++;
            } else {
              if ((inner/50)==wordLocation[0]&&((counter-150)/50)==wordLocation[1]) {
                test.Grid();
                stage--;
              } else if ((inner/50)==wordLocation[2]&&((counter-150)/50)==wordLocation[3]) {
                test.Grid();
                circle(wordLocation[1]*50+155, wordLocation[0]*50+5, 5);
                wordLocation[2]=0;
                wordLocation[3]=0;
              } else {
                circle(counter+5, inner+5, 5);
                wordLocation[2]=(inner/50);
                wordLocation[3]=((counter-150)/50);
              }
            }
            counter = 2000;
            inner = 2000;
            println(wordLocation);
            println(stage);
          }
        }
      }
    }
  }
}
void shuffle(Player player) {
  println("shuffle");
  for (int counter = 0; counter < player.getSize(); counter ++) {
    bag.add(player.remove(0));
    bag.shuffle();
    player.add(bag.remove(0));
  }
  if (player == x)println("Player 1's turn is over. Player shuffled, which ended thier turn");
  if (player == y)println("Player 2's turn is over. Player shuffled, which ended thier turn");
  test.undo(player);
  test.Grid();
  player.displayinv();
  turn++;
}
