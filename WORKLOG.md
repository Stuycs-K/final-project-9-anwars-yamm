# Work Log

## GROUP MEMBER 1(Shaon)

### date 5/22

Wrote constructors for each class

### date 5/23

Finished writing the Letter class

### date 5/24
Finished inventory, writing code for displaying tiles

### date 5/25
Finished designing letter tiles, display method works, tiles can be placed on board but a more practical method than mouseclick is needed.

### date 5/26
Working on player class, fixing issue with accessing field in superclass inventory. Writing method for displaying player's hands on either side of the screen based on playernum, looping through hand and displaying letters.

### date 5/29
Completed displaying inventory and finished player class. Made some tweaks to constructors and fields to adjust changes in prototype. Done with all of my classes' method functionality. Next steps: prompt to move letters, adjusting inventory placement based on board dimensions.

### date 5/30
Finished adjusting inventory based on new board dimensions, merged our files, tested if adding to the inventory changes the visible display (works fine!). Displaying words on tiles now works perfectly, appropriately snaps to selected tiles.

### date 5/31
Made clicking actually add to inner array instead of just being a visual thing, made it so that you can't add tiles to preoccupied squares.

### date 6/1
Made inventory refill after a player is done placing their tiles. Checked everything for the demo, added comments for clarity.

### date 6/7
Fixed bug with placing over existing tiles, added visual display for points for each player (going to change when new dimensions are given).

### date 6/9
Implementing game end condition, need to fix issue with game freezing when hands go under 7 without sufficient tiles.

### date 6/10
Fixed game end condition, now properly terminates when a hand is 0 and there are no tiles in the bag. Check out weird bug that happened where hand got > 7 tiles.

### date 6/11
Finalized updated prototype and looked over final code.

## GROUP MEMBER 2(Mason)

### date 5/22

added dictionary

### date 5/23

started on methods for determining the score of a word

### date 5/24

worked on the importation method of the dictionary and how it works with the scoring method

### date 5/25

added some tests for scoring words, scoring method complies
added a method to create a reference for wordMulti
added a method to compound the multipliers

### date 5/26

wrote down algo
changes to active

### date 5/29

beginning on graphical interface, layout decided upon for two players
created a grid that will eventually display the letter tiles, currently displays word bonuses(color)

### date 5/30

finished board graphical interface, grid displays both active and board and bonuses. new features added: adding to active, moving active to board, constructors and functionality for letter edited. Next step, gamifying the turns and board

### date 5/31

created turn system, allows each player to take a turn and submit pieces, then asks them to submit and calculates the score

### date 6/1

finished turn system. recreated commit, which moves selected letters of active array to board array, created a method to return letters if the word submitted is invalid, and overall made the game more foolproof. Game now has comments, a readme, and instructions.

### date 6/4

tiles are now chosen from a bag, with predetermined amounts of letters. Once the bag runs out, the players will no longer receive tiles.

### date 6/6

Graphical overhaul. Entire board scaled up +150%, small identifiers appear to assist the player in selecting the start and end letters for the submitted word, letters feature values, which match up to the added letter multipliers(graphically indicated by color)
Some more rules applied to scrabble, user must incorporate a previously used tile, except for the first turn, where the user must place a tile over the center piece. additionally, the letter and word multipliers can only be used in the turn which they are played, meaning that letters already played on premium squares will count at face value.

### date 6/7

all letter premium tiles are now implemented, code trimmed and reorganized.

### date 6/8

game now displays letter that player is moving to board
added checking for adjacent conflicts feature to when the player is confirming their word
added shuffle feature, clicking on the board without a selected piece shuffles the player's remaining tiles and ends their turn

### date 6/9

made changes on what clicking on stuff while already holding a tile does:
if a player is holding a tile and clicks on another one of thier tiles, it will swap the selected tiles,
if a player is holding a tile and clicks on a tile they placed during thier turn that is already on the board, it will swap out the board tile and the selected one
if a player is holding a tile and clicks on an empty part of thier inventory, it will place the tile back into the inventory
if a player isnt holding a tile and clicks on a previously placed tile from thier turn, they will pick up that tile
if a player isnt holding a tile and clicks on a blank part of the board, the player's hand is shuffled

### date 6/10

made some aesthetic changes
allowed the user to deselect the submission indicators and reposition
merged Shaon's end game code
adding endgame event

### date 6/11
added cheat cases

# Dev Log

## Working features
Dictionary of working words  
Checking complete words against the dictionary(including blanks)  
Checking if words create conflict with existing words, including adjacent connections  
Mouse based functionality:  
Clicking tiles, placing onto nearest board tiles  
Able to deselect anything and mobility in moving pieces around(can pick up and put down anywhere)  
Able to distinguish between letters placed in the active turn vs the turns before it  
Scoring points based on both word multipliers and letter multipliers, also stacking multipliers  
Automatic inventory refill  
Shuffle and random inventory tiles  
Ending game states(both forfeited turns and empty hand)  
displays word created and the action value  
Tracks selected tiles with an indicator  
Cheats for quick testing  

## Bugs and broken features
Clicking enter while a tile is being dragged ends up filling up the inventory while keeping the dragged tile at the cursor. This means that a player can have more than 7 tiles in their hand at a time. Not necessarily a broken feature, as the enter key should only be pressed at the end of certain actions according to the instructions, but it can cause some unintentional situations.

## Resources
https://www.scrabblepages.com/scrabble/rules/
A site with an expansive collection of scrabble rules and intricacies; was helpful when we were planning our prototype.

https://www.thekatespanos.com/scrabble-score-calculator/
A scrabble calculator that we used for testing multipliers, point counting, and game win conditions.

https://raw.githubusercontent.com/redbo/scrabble/master/dictionary.txt
A text file with a complete scrabble dictionary that we parsed for our word-checking.
