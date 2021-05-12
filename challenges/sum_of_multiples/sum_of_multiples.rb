class SumOfMultiples
  DEFAULT_NUM = [3, 5]
  attr_reader :multiples

  def initialize(*multiples)
    if multiples.empty?
      @multiples = DEFAULT_NUM
    else
      @multiples = multiples
    end
  end

  def self.to(integer)
    SumOfMultiples.new.to(integer)
  end

  def to(integer)
    result = []
    (1...integer).each do |possible_multiple|
      if multiples.any? { |divisor| possible_multiple % divisor == 0 }
        result << possible_multiple
      end
    end
    result.sum
  end
end
