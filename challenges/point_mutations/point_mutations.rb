class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(sequence)
    counter = 0
    strand.chars.each_with_index do |strand_letter, index|
      break if index == sequence.size
      counter += 1 unless strand_letter == sequence[index]
    end
    counter
  end

end
