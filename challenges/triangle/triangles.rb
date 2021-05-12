class Triangle
  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    raise ArgumentError unless valid_triangle?(side1, side2, side3)

    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    if side1 == side2 && side2 == side3
      'equilateral'
    elsif side1 == side2 || side2 == side3 || side3 == side1
      'isosceles'
    else
      'scalene'
    end
  end

  def valid_triangle?(side1, side2, side3)
    all_sides_greater_than_zero?(side1, side2, side3) && sum_of_two_greater_than_one?(side1, side2, side3)
  end

  def all_sides_greater_than_zero?(side1, side2, side3)
    [side1, side2, side3].all?(&:positive)
  end

  def sum_of_two_greater_than_one?(side1, side2, side3)
    side1 + side2 > side3 && side1 + side3 > side2 && side2 + side3 > side1
  end
end
