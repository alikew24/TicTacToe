require "byebug"
require_relative "array_extension"
class Board

  def self.blank_grid
    Array.new(3) { Array.new(3) }
  end

  attr_reader :grid, :marks

  def initialize(grid = Board.blank_grid)
    @grid = grid
    @marks = [:X, :O]
  end

  def []= (pos, mark)
    row, col = pos
    grid[row][col] = mark
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end


  def display
    grid.each do |rows|
      rows.each do |col|
        if !col.nil?
          print "[#{col}]".chomp
        else
          print "[ ]".chomp
        end
        print " "
      end
      print "\n"
    end
  end

  def winner
    (get_rows + get_cols + get_diagonals).each do |arr|
      return arr[0] if arr.all_same?
    end
    nil
  end

  def game_over?
    return true if winner
    self.grid.each do |row|
      return false unless row.none_empty?
    end
    return true
  end

  def get_rows
    grid
  end

  def get_cols
    columns = grid
    columns.transpose
  end

  def get_diagonals
    diagonal_one = [grid[0][2], grid[1][1], grid[2][0]]
    diagonal_two = [grid[0][0], grid[1][1], grid[2][2]]
    [diagonal_one, diagonal_two]
  end

  def make_move(pos, mark)
    raise 'invalid position!' unless self.valid_pos?(pos)
    raise 'that spot is taken!' unless self[pos].nil?
    self[pos] = mark
  end

  def valid_pos?(pos)
    return false unless pos.length == 2
    return false unless pos.all? { |el| el >= 0 && el <= 2}
    return true
  end








end
