require "byebug"
require_relative "human_player"
require_relative "board"
require_relative "computer_player"
class Game

  attr_accessor :current_player
  attr_reader :player1, :player2, :board
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @board = Board.new
    @player1.mark = "x"
    @player2.mark = "o"
  end

  def play_turn
    pos = current_player.get_player_move(@board)
    board.make_move(pos, current_player.mark)
    self.switch_players
    @board.display
    puts "____________________________"
  end

  def switch_players
    if self.current_player == player1
      self.current_player = player2
    else
      self.current_player = player1
    end
  end

  def run
    @board.display
     until board.game_over?
       begin
         self.play_turn
       rescue StandardError => e
         puts e.message
         retry
       end

     end
     if @board.winner
       puts "#{@board.winner} wins!"
     else
       puts "no winner! try again"
     end
  end


end

print "Enter player 1 name: "
name = gets.chomp.strip
player1 = HumanPlayer.new(name)
print "Enter player 2 name: "
name2 = gets.chomp.strip
player2 = ComputerPlayer.new
#player2 = HumanPlayer.new(name2)
new_game = Game.new(player1, player2)
new_game.run
