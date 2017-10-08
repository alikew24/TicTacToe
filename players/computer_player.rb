require_relative "board"
require "deep_clone"

class ComputerPlayer
  attr_reader :name
  attr_accessor :mark
  def initialize
    @name = "Computer"
  end

  def get_player_move(board)
    #check all valid moves and see if board has won
    #put the human players x in any spots and see if the game is over
    valid_moves = self.all_valid_moves(board)
    dupped_board = board.dup
    valid_moves.each do |move|
      dupped_board = DeepClone.clone(board)
      dupped_board.make_move(move, "o")
      if dupped_board.game_over?
        return move
      end
    end
    valid_moves.each do |move|
      dupped_board = DeepClone.clone(board)
      dupped_board.make_move(move, "x")
      if dupped_board.game_over?
        return move
      end
    end
    return valid_moves.sample
  end

  def all_valid_moves(board)
    ar = []
    (0..2).each do |i|
      (0..2).each do |j|
        if board[[i,j]].nil?
          ar << [i,j]
        end
      end
    end
    ar
  end
end
