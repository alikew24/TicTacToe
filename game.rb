require_relative "players/human_player"
require_relative "gameplay/board"
require_relative "players/computer_player"
require "io/console"

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
    @board.display
    if self.current_player == player2
      puts "The computer is thinking..."
      sleep(2)
    end
    pos = current_player.get_player_move(@board)
    board.make_move(pos, current_player.mark)
    self.switch_players
    system("clear")
  end

  def switch_players
    if self.current_player == player1
      self.current_player = player2
    else
      self.current_player = player1
    end
  end

  def run
    system("clear")
    puts "Hi #{player1.name}, welcome to Tic Tac Toe!"
    puts "Press any key to begin the game"
    STDIN.getch
    system("clear")
     until board.game_over?
       begin
         self.play_turn
       rescue StandardError => e
         system("clear")
         puts e.message
         retry
       end

     end
     @board.display
     if @board.winner
       winning_player = player1.mark == @board.winner ? player1 : player2
       puts "#{winning_player.name} wins!"
     else
       puts "No winner! The game ends in a tie."
     end
  end


end

if __FILE__ == $PROGRAM_NAME
  system("clear")
  print "What is your name?\n"
  name = gets.chomp.strip
  player1 = HumanPlayer.new(name)
  player2 = ComputerPlayer.new
  Game.new(player1, player2).run
end
