Tic Tac Toe Tech Test - in ruby
=================

Description:
-------
The program contains the business logic for the game of tic tac toe. The code can be combined easily any user interface, whether web or command line to provide an enjoyable gaming experience. The game can be played in a 3x3 grid.

### Instructions for how to run the program

```
$ git clone https://github.com/peter-miklos/tic_tac_toe_tech_test_ruby
$ bundle
$ rspec
```
Use IRB to interact with the code.
User stories
-------
```
Put user stories here
```

Tests
-------
### Feature tests
The program's main features are tested in IRB:
```
Put IRB results here
```
### Unit tests
The following unit tests are used:
```
Game
  #player_1
    returns the first player
  #player_2
    returns the second player
  #play
    raises error if game is over
    raises error if coordinates are not valid
    raises error if the same player wants to play the next turn too
    player_1 wins the game if all fields are claimed in a row
    player_1 wins the game if all fields are claimed in a column
    player_1 wins the game if all fields are claimed in diagonal
  #show_grid
    returns the current grid
  #show_winner
    returns the winner, if there is any, otherwise nil

Player
  #name
    returns the player's name

```
