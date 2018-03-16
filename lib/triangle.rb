require 'pry'

class Triangle
  attr_accessor :kind, :side1, :side2, :side3

  def initialize(*args)
    args.each_with_index {|side, i| self.send(("side#{i + 1}="), side)}
  end

  def kind
    sides = [@side1, @side2, @side3]
    neg_sides = [-@side1, -@side2, -@side3]
    if sides.include?(0) || sides.any?{|x| x<0} || self.is_triangle?(sides.sort)
      raise TriangleError
    elsif @side1 == @side2 && @side2 == @side3
      :equilateral
    elsif @side2 == @side3 || @side1 == @side2 || @side1 == @side3
      :isosceles
    else
      :scalene
    end
  end

  def is_triangle?(sides)
    sorted = sides
    greatest_side = sorted.pop
    if greatest_side >= (sorted[0] + sorted[1])
      return true
    end
  end

  # private
  # def error
    # begin
    #   raise TriangleError
    # rescue TriangleError => error
    #   puts error.message
    # end
  # end

end

class TriangleError < StandardError
  def message
    "Nope"
  end
end

#equal = Triangle.new(12, 12, 12)
