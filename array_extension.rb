class Array
  def all_same?
    self.all? { |el| el == self.last && !el.nil? }
  end

  def any_empty?
    self.any? { |el| el == nil }
  end

  def none_empty?
    !self.any_empty?
  end
end
