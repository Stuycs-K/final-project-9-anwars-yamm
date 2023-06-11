# APCS Final Project
THIS DOCUMENT IS REQUIRED
## Group Info
Group name: The Scrabblers
Members: Shaon Anwar and Mason Yam (period 9)
Topic: Scrabble in Processing
## Overview
We aim to create a Scrabble simulator using processing. The simulator will have all the features of a typical Scrabble game. Users will pick letter tiles from their randomized hand, and then put down words on a board by clicking and dropping letters to create words. The simulator will now have both the previously placed words and the added tiles. After finishing the placement stage, the player will click on starting and ending letters of the submitted word, and then, if valid (based on a parsed dictionary of words and words next to it), put it down and calculate the word value using letter values and modifiers. After letters are placed, the player's hand will automatically refill. Alternatively, the player may shuffle unplaced tiles in their inventory during the placement stage. These turns, consisting of choosing/placing letters, shuffling, and checking for words, will alternate between two players, each with their own hand/inventory to either side of the board. The game ends when either both players forfeit the match by shuffling 4 consecutive times or by using all tiles in the bag and clearing a players hand. At that point, the final score will be printed in terminal and will consist of the total point values of each of their turns minus the point values of their remaining hand.
## Instructions
Players begin by clicking on tiles displayed that correspond to their inventory. Once a player clicks on a letter tile from their side they may place it on the board, swap it with another tile from their hand or board, or put it back in its blank position. if the player is not holding a tile, clicking on a tile previously placed in their turn will allow them to pick the tile back up and move it around. if they click on a blank tile, the remaining tiles in the player's hand will be shuffled with the tiles in the bag. They may repeat this for all of their letter tiles. The player must connect their word to a previously placed word, if there are no words, they must place a tile on the center piece. After the player is done placing tiles, they will press enter and proceed to the next stage. The player will select the word they wish to create by clicking on the furthermost tiles of their word. After the player selects their tiles, they will press enter once more. if the player is unsatisfied with the tiles they selected as the furthermost tiles, they may deselect that tile by clicking again and reposition. If the word is valid, only the letters of the word they selected will stay on the board, and they will receive a message detailing the word they submitted and the point value for the action. The game will then move on to the next player. If the word is invalid, the player's turn will restart and the tiles will be returned to the player's inventory. The game can be played until both players forfeit the match by shuffling 4 consecutive times or by using all tiles in the bag and clearing a players hand. At that point, the final score will be printed in terminal and will consist of the total point values of each of their turns minus the point values of their remaining hand.
Other rules that were implemented from scrabble include:
premium tiles:
light blue tiles represent double letter multipliers
dark blue tiles represent triple letter multipliers
dark red tiles represent double word multipliers
pink tiles represent triple word multipliers
each premium tile is valid only on the turn which it is played on, meaning they can only be used once, but can stack effects on each turn
adjacent tiles:
tiles are checked to be valid in respect to the tiles they touch, and the move will be considered to be invalid if the selection creates conflict with already existing words on the table
cheats:
(these require an action first, so just select a tile and put it back into the inventory)
backspace: toggles "cheat mode", shuffling wont put the player's tile into the bag, so the user can get to the empty bag ending earlier
tab: places a sample turn onto the map, may be useful to try different words or placements without having to come up with too many words
