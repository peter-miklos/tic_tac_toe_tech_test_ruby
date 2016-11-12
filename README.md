Tic Tac Toe Tech Test - in Ruby
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
As a User
So that I can spend my spare time
I want to play with tic tac toe game

As a User
So that I can beat another human
I want to play with another user instead of the computer

As a User
So that I can see my name as winner
I want to add my game before playing

As a User
So that I can know which field to claim
I want to see the grid
```

Tests
-------
### Feature tests
The program's main features are tested in IRB:
```
2.3.1 :001 > require './lib/game.rb'
 => true
2.3.1 :002 > require './lib/player.rb'
 => true
2.3.1 :003 > player1 = Player.new("Bob")
 => #<Player:0x007fb0e401ed10 @name="Bob">
2.3.1 :004 > player2 = Player.new("Jim")
 => #<Player:0x007fb0e4026ab0 @name="Jim">
2.3.1 :005 > game = Game.new(player1, player2)
 => #<Game:0x007fb0e402e508 @players=[#<Player:0x007fb0e401ed10 @name="Bob">, #<Player:0x007fb0e4026ab0 @name="Jim">], @grid=#<Grid:0x007fb0e402e4e0 @grid_size=3, @grid_content=[[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]>, @winner=nil, @players_in_turns=[]>
2.3.1 :006 > game.play(player1, 0, 1)
 => "Field confirmed. Next turn."
2.3.1 :007 > game.play(player2, 1, 1)
 => "Field confirmed. Next turn."
2.3.1 :008 > game.show_grid
 => [[nil, nil, nil], [#<Player:0x007fb0e401ed10 @name="Bob">, #<Player:0x007fb0e4026ab0 @name="Jim">, nil], [nil, nil, nil]]
2.3.1 :009 > game.play(player2, 1, 2)
RuntimeError: Invalid player...
2.3.1 :010 > game.play(player1, 0, 1)
RuntimeError: Invalid choice...
2.3.1 :011 > game.play(player1, 0, 5)
RuntimeError: Invalid choice...
2.3.1 :012 > game.play(player1, 0, 0)
 => "Field confirmed. Next turn."
2.3.1 :013 > game.play(player2, 1, 0)
 => "Field confirmed. Next turn."
2.3.1 :014 > game.show_grid
 => [[#<Player:0x007fb0e401ed10 @name="Bob">, #<Player:0x007fb0e4026ab0 @name="Jim">, nil], [#<Player:0x007fb0e401ed10 @name="Bob">, #<Player:0x007fb0e4026ab0 @name="Jim">, nil], [nil, nil, nil]]
2.3.1 :015 > game.play(player1, 0, 2)
 => "Bob won!"
2.3.1 :016 > game.play(player2, 1, 2)
RuntimeError: Game Over...
2.3.1 :017 > game.show_grid
 => [[#<Player:0x007fb0e401ed10 @name="Bob">, #<Player:0x007fb0e4026ab0 @name="Jim">, nil], [#<Player:0x007fb0e401ed10 @name="Bob">, #<Player:0x007fb0e4026ab0 @name="Jim">, nil], [#<Player:0x007fb0e401ed10 @name="Bob">, nil, nil]]
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
    calls the grid_full? method on the grid
    calls the player_wins? method on grid
    raises error if coordinates are not valid
    raises error if the same player wants to play the next turn too
    confirms player that he/she won the game
  #show_grid
    calls the show_grid method on grid
  #show_winner
    returns the winner, if there is any, otherwise nil

Grid
  #claim_field
    add player to the claimed field
  #valid_choice?
    returns true if the field is not taken
    returns false if the field is taken
  #show_grid
    returns the current grid
  #grid_full?
    returns true if there is no more empty field in the grid
    returns false if there is still at least one empty field in the grid
  #player_wins?
    returns true for player_1 if all fields are claimed in a row
    returns true for player_1 if all fields are claimed in a column
    returns true for player_1 if all fields are claimed in diagonal

Player
  #name
    returns the player's name
```
