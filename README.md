Tic-tac-toe

By I. Mahle

A project of The Odin Project https://www.theodinproject.com/courses/ruby-programming/lessons/oop

Instructions

1. Change in the folder src and type ./tic-tac-toe.rb in the console
2. Follow the instructions to play the game

To run the tests with Rspec: Comment out the last two lines in src/tic-tac-toe.rb (my_game = Game.new & my_game.start). Change back into the root directory of the program and type rspec in the console.

Discussion
I used the following technologies: Ruby with classes and methods.
This is a tic-tac-toe game on the command line where two players (human or computer) can play against each other and the board is displayed in between turns. Error handling for wrong inputs is included.
Tests with Rspec include tests for victory or loss conditions and all critical methods including edge cases.
Mocks/doubles are used isolate methods and to make sure that they’re sending back the right outputs.

Requirements
Ruby, Rspec
