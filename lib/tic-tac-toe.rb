#!/usr/bin/ruby

class Board
  attr_accessor :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def draw
    puts "-------------"
    puts "| #{@board[0]} | #{@board[1]} | #{@board[2]} |"
    puts "-------------"
    puts "| #{@board[3]} | #{@board[4]} | #{@board[5]} |"
    puts "-------------"
    puts "| #{@board[6]} | #{@board[7]} | #{@board[8]} |"
    puts "-------------"
  end

  def update(pos, char)
    @board[pos-1] = char
  end

  def reset
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
end

class Player
  attr_accessor :name
  attr_reader :is_computer

  def initialize
    @name = 'Computer'
    @is_computer = true
  end

  def get_name
    puts "Name? Leave empty if the player is the computer."
    player = gets.chomp
    if player != ""
      @name = player.to_s
      @is_computer = false
    end
  end
end

class Game
  attr_accessor :board, :player1, :player2, :winner, :win # for testing with rspec

  def initialize
    @win = false
    @full_board = false
    @winner = ""
    @player1 = ""
    @player2 = ""
    @is_turn_player1 = true
    @board = []
    @win_combinations = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  end

  def start
    @player1 = Player.new
    @player2 = Player.new
    puts "Player 1:"
    @player1.get_name
    puts "Player 2:"
    @player2.get_name
    puts "The name of the first player is #{@player1.name}."
    puts "The token of the first player is X."
    puts "The name of the second player is #{@player2.name}."
    puts "The token of the second player is O."
    @board = Board.new
    @board.draw
    play
  end

  def play
    if (@win == false && @full_board == false)
      if @is_turn_player1
        make_move(@player1, "X")
        @is_turn_player1 = false
      else
        make_move(@player2, "O")
        @is_turn_player1 = true
      end
      @board.draw
      check_winner
      check_full_board
      play
    elsif @win == true
      puts "Game over! The winner is #{@winner}!"
      abort
    else
      puts "Game over! No winner!"
      abort
    end
  end

  def make_move(player,char)
    if player.is_computer == true
      pos = rand(9) + 1
      puts "It is the turn of the computer. The computer has chosen field #{pos}."
      while @board.board[pos-1] == "X" || @board.board[pos-1] == "O" do
        pos = rand(9) + 1
        puts "This field is already occupied. Now the computer has chosen field #{pos}."
      end
    else
      puts "#{player.name}, it is your turn. Choose an empty field."
      pos = gets.chomp
      x = Integer(pos) rescue x = false
      while (!x && !pos.to_i.between?(1, 9))
        puts "Invalid entry. Choose an empty field."
        pos = gets.chomp
        x = Integer(pos) rescue x = false
      end
      pos = x
      while @board.board[pos-1] == "X" || @board.board[pos-1] == "O" do
        puts "This field is already occupied. Choose an empty field."
        pos = gets.chomp.to_i
      end
    end

    @board.update(pos,char)
  end

  def check_winner
    arrX = []
    arrO = []
    @board.board.each_with_index do |item, index|
      if item == "X"
        arrX << index + 1
      end
      if item == "O"
        arrO << index + 1
      end
    end

    @win_combinations.each do |combi|
      winX = combi.all? {|i| arrX.include?(i)}
      if winX == true
        @win = true
        @winner = @player1.name
      end
      winO = combi.all? {|i| arrO.include?(i)}
      if winO == true
        @win = true
        @winner = @player2.name
      end
    end
  end

  def check_full_board
    @full_board = @board.board.all? {|item| item == "X" || item == "O"}
  end

end



my_game = Game.new
my_game.start
