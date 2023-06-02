# APCS Final Project
THIS DOCUMENT IS REQUIRED
## Group Info
Group name: The Scrabblers
Members: Shaon Anwar and Mason Yam (period 9)
Topic: Scrabble in Processing
## Overview
We aim to create a Scrabble simulator using processing. The simulator will have all the features of a typical Scrabble game. Users will pick letter tiles from their randomized hand, and then put down words on a board by selecting and placing letters to create words, assuming the desired squares are empty. The simulator will show a preview of the created word, and then, if valid (based on a parsed dictionary of words), put it down and calculate the word value using letter values and modifiers. After letters are placed, the player's hand will automatically refill. These turns, consisting of choosing/placing letters and checking for words, will alternate between two players, each with their own hand/inventory to either side of the board.
## Instructions
Players begin by clicking on tiles displayed that correspond to their inventory. Once a player clicks on a letter tile from their side, they should deposit it on the board by clicking on the desired empty space. They may repeat this for all of their letter tiles. After the player is done placing tiles, they will press enter and proceed to the next stage. The player will select the word they with to create by clicking on the furthermost tiles of their word. After the player selects their tiles, they will press enter once more. If the word is valid, only the letters of the word they selected will stay on the board, and they will receive a message detailing the word they submitted and the point value for the action. The game will then move on to the next player. If the word is invalid, the player's turn will restart and the tiles will be returned to the player's inventory. The game can be played until no more words can be created, after which the player will be unable to end their turn.
