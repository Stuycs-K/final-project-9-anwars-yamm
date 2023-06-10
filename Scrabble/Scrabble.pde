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

  size(420, 300);
  fill(0);
  rect(0, -1, 60, 300);
  rect(360, -1, 60, 300);

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
  preset1.add(new Letter(c1, false, 'A'));
  preset1.add(new Letter(c1, false, 'D'));
  preset1.add(new Letter(c1, false, 'I'));
  preset1.add(new Letter(c1, false, 'E'));
  preset1.add(new Letter(c1, false, 'U'));
  preset1.add(new Letter(c1, false, 'O'));
  preset1.add(new Letter(c1, false, 'S'));
  
  ArrayList<Letter> preset2 = new ArrayList<Letter>();
  preset2.add(new Letter(c1, false, 'S'));
  preset2.add(new Letter(c1, false, 'C'));
  preset2.add(new Letter(c1, false, 'R'));
  preset2.add(new Letter(c1, false, 'A'));
  preset2.add(new Letter(c1, false, 'B'));
  preset2.add(new Letter(c1, false, 'B'));
  preset2.add(new Letter(c1, false, 'L'));
  
  ArrayList<Letter> preset3 = new ArrayList<Letter>();
  preset3.add(new Letter(c1, false, 'C'));
  preset3.add(new Letter(c1, false, 'A'));
  preset3.add(new Letter(c1, false, 'Z'));
  preset3.add(new Letter(c1, false, 'I'));
  preset3.add(new Letter(c1, false, 'Q'));
  preset3.add(new Letter(c1, false, 'U'));
  preset3.add(new Letter(c1, false, 'E'));

  ArrayList<Letter> bagAL = new ArrayList<Letter>();
  bag = new Inventory(bagAL);
  bag.addNewRep(bagAL,2,'*');
  bag.addNewRep(bagAL,12,'E');
  bag.addNewRep(bagAL,9,'A');
  bag.addNewRep(bagAL,9,'I');
  bag.addNewRep(bagAL,8,'O');
  bag.addNewRep(bagAL,6,'N');
  bag.addNewRep(bagAL,6,'R');
  bag.addNewRep(bagAL,6,'T');
  bag.addNewRep(bagAL,4,'L');
  bag.addNewRep(bagAL,4,'S');
  bag.addNewRep(bagAL,4,'U');
  bag.addNewRep(bagAL,4,'D');
  bag.addNewRep(bagAL,3,'G');
  bag.addNewRep(bagAL,2,'B');
  bag.addNewRep(bagAL,2,'C');
  bag.addNewRep(bagAL,2,'M');
  bag.addNewRep(bagAL,2,'P');
  bag.addNewRep(bagAL,2,'F');
  bag.addNewRep(bagAL,2,'H');
  bag.addNewRep(bagAL,2,'V');
  bag.addNewRep(bagAL,2,'W');
  bag.addNewRep(bagAL,2,'Y');
  bag.addNewRep(bagAL,1,'K');
  bag.addNewRep(bagAL,1,'J');
  bag.addNewRep(bagAL,1,'X');
  bag.addNewRep(bagAL,1,'Q');
  bag.addNewRep(bagAL,1,'Z');
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
      //translates stored coordinates into a word
      String userSubmit = test.getWord(wordLocation[0], wordLocation[1], wordLocation[2], wordLocation[3]);
      //gets score value of the word(<0 if invalid)
      int activeValue = test.wordCheckReturn(userSubmit)*test.calcWordMulti(wordLocation[0], wordLocation[1], wordLocation[2], wordLocation[3]);
      //if the word is valid, the board stores it, removes stray letters, and moves on to the next player
      if (activeValue>0) {
        if (current == x)println("Player 1's turn is over. Player submitted word: "+userSubmit+", which increased their points by "+activeValue);
        if (current == y)println("Player 2's turn is over. Player submitted word: "+userSubmit+", which increased their points by "+activeValue);
        current.addPoints(activeValue);
        test.commit(wordLocation[0], wordLocation[1], wordLocation[2], wordLocation[3]);
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
      if(bag.getSize() == 0 && (x.getSize() == 0 || y.getSize() == 0)){
        if(x.getPoints() > y.getPoints()){
         println("There are no tiles left. Player 1 wins!");
        }
        else if (y.getPoints() > x.getPoints()){
         println("There are no tiles left. Player 2 wins!"); 
        }
        else{
         println("There are no tiles left. The game ends in a draw!"); 
        }
      }
      else{
      while (x.getSize() < 7) {
        if(bag.getSize()!=0){
        Letter add = bag.remove(0);
        x.add(add);
        }
      }
      while (y.getSize() < 7) {
        if(bag.getSize()!=0){
        Letter add = bag.remove(0);
        y.add(add);
        }
      }
      fill(0);
      rect(0, -1, 60, 300);
      x.displayinv();
      y.displayinv();
    fill(255);
    text("" + x.getPoints(), 20, 290);
    text("" + y.getPoints(), 380, 290);
    println("There are " + bag.getSize() + " tiles left in the bag.");
    }
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
    if (rotation == false) {
      if (mouseX >= 20 && mouseX <= 40 && turn % 2 == 1) {
        //condition for player x / 1 (leftmost inventory)
        for (int counter = 0; counter < x.getSize(); counter ++) {
          if (mouseY >= counter * 40 + 10 && mouseY <= counter * 40 + 30) {
            //checks if mouseY and mouseX are hovering over a tile, saves the tile, and redisplays the inventory without the tile.
            saved = x.remove(counter);
            fill(0);
            rect(0, -1, 60, 300);
            x.displayinv();
            rotation = true;
          }
        }
      } else if (mouseX >= 380 && mouseX <= 400 && turn  % 2 == 0) {
        //condition for player y / 2 (rightmost inventory)
        for (int counter = 0; counter < y.getSize(); counter ++) {
          if (mouseY >= counter * 40 + 10 && mouseY <= counter * 40 + 30) {
            //checks if mouseY and mouseX are hovering over a tile, saves the tile, and redisplays the inventory without the tile.
            saved = y.remove(counter);
            fill(0);
            rect(360, -1, 60, 300);
            y.displayinv();
            rotation = true;
          }
        }
      }
    } else {
      if (mouseX >= 60 && mouseX <= 360) {
        for (int counter = 60; counter <= 340; counter = counter + 20) {
          for (int inner = 0; inner <= 280; inner = inner + 20) {
            if (mouseX >= counter && mouseX <= counter + 20 && mouseY >= inner && mouseY <= inner + 20 && (test.getBoard())[inner / 20][(counter - 60) / 20] == null && (test.getActive())[inner / 20][(counter - 60) / 20] == null) {
              //checks if mouseX and mouseY are on a valid board square (that is empty), adds the saved tile to the board (both visually and to the array)
              int[] newcoords = {counter, inner};
              saved.setCoord(newcoords);
              saved.display();
              test.add(inner / 20, (counter - 60) / 20, saved.getLetter());
              rotation = false;
              counter = 1000;
              inner = 1000;
            }
          }
        }
      }
    }
  }
  if (stage==2||stage==3) {
    if (mouseX >= 60 && mouseX <= 360) {
      for (int counter = 60; counter <= 340; counter = counter + 20) {
        for (int inner = 0; inner <= 280; inner = inner + 20) {
          if (mouseX >= counter && mouseX <= counter + 20 && mouseY >= inner && mouseY <= inner + 20) {
            if (stage==2) {
              wordLocation[0]=(inner/20);
              wordLocation[1]=((counter-60)/20);
              stage++;
            } else {
              wordLocation[2]=(inner/20);
              wordLocation[3]=((counter-60)/20);
            }
            counter = 1000;
            inner = 1000;
          }
        }
      }
    }
  }
}
