class Series
  def initialize(str)
    @digits_str = str
  end

  def slices(length)
    raise ArgumentError unless length <= digits_str.size

    arr = digits_str.chars.map(&:to_i)
    arr.each_cons(length).to_a
  end

  private

  attr_reader :digits_str
end
