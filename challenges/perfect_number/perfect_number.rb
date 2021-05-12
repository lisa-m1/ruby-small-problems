class PerfectNumber

  def self.classify(int)
    raise StandardError if int < 1
    aliquot_sum = PerfectNumber.find_aliquot_sum(int)
    if aliquot_sum == int
      'perfect'
    elsif aliquot_sum > int
      'abundant'
    else
      'deficient'
    end
  end

  def self.find_aliquot_sum(int)
    multiples = []
    (1...int).to_a.each do |number|
      multiples << number if int % number == 0
    end
    multiples.sum
  end
end
