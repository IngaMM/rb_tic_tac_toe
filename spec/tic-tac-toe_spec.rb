require './lib/tic-tac-toe.rb'

RSpec.describe Board do
  describe "Check board size" do
    it "checks that the board has 9 fields" do
      my_board = Board.new
      expect(my_board.board.length).to eql(9)
    end
  end

  describe "#draw" do
    it "checks that something is drawn on the screen" do
      my_board = Board.new
      expect { my_board.draw }.to_not output("").to_stdout
    end
  end

  describe "#update" do
    it "checks that the board is updated" do
      my_board = Board.new
      my_board.update(2, "X")
      my_board.update(5, "O")
      expect(my_board.board[1]).to  eql("X")
      expect(my_board.board[4]).to  eql("O")
    end
  end

  describe "#reset" do
    it "checks that the board is set to its original state" do
      my_board1 = Board.new
      my_board2 = Board.new
      my_board1.board[0] = "X"
      my_board1.board[5] = "O"
      my_board1.reset
      expect(my_board1.board).to  eql(my_board2.board)
    end
  end
end

RSpec.describe Player do
  describe "Check default player" do
    it "determines that the default player is the computer" do
      my_player = Player.new
      expect(my_player.is_computer).to eql(true)
      expect(my_player.name).to eql("Computer")
    end
  end
end

RSpec.describe Game do
  describe "#check_winner" do
    it "determines correctly that there is a winner" do
      my_game = Game.new
      my_game.board = Board.new
      my_game.player1 = Player.new
      my_game.player2 = Player.new
      my_game.board.board[0] = "X"
      my_game.board.board[1] = "X"
      my_game.board.board[2] = "X"
      my_game.check_winner
      expect(my_game.win).to eql(true)
    end
  end

  describe "#check_full_board" do
    it "determines correctly that the board is full" do
      my_game = Game.new
      my_game.board = Board.new
      my_game.board.board.fill("X", 0, 8)
      expect(my_game.check_full_board).to eql(false)
      my_game.board.board.fill("O", 8, 1)
      expect(my_game.check_full_board).to eql(true)
    end
  end
end
