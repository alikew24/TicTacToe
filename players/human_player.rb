require "byebug"
class HumanPlayer
  attr_reader :name
  attr_accessor :mark
  def initialize(name)
    @name = name
  end

  def get_player_move(board)
    puts "#{name} What position would you like to mark? Please put it in 'row,col' format"
    pos = gets.chomp.split(",").map(&:to_i)
    return pos
  end


end
