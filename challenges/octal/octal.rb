class Octal
  attr_reader :str_number

  def initialize(str_number)
    @str_number = str_number
  end

  def to_decimal
    return 0 if invalid?

    arr = str_number.chars
    power = arr.size - 1
    sum = 0
    arr.each do |num_string|
      num = num_string.to_i * (8**power)
      sum += num
      power -= 1
    end
    sum
  end

  def invalid?
    /[a-z]/i.match(str_number) || str_number.chars.map(&:to_i).any? { |num| num >= 8 }
  end
end
