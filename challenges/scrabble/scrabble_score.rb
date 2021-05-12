class Scrabble
  attr_reader :word

  SCORES = {
    %w(a e i o u l n r s t) => 1,
    %w(d g) => 2,
    %w(b c m p) => 3,
    %w(f h v w y) => 4,
    %w(k) => 5,
    %w(j x) => 8,
    %w(q z) => 10
  }

  def initialize(word)
    @word = word
  end

  def self.score(str)
    Scrabble.new(str).score
  end

  def score
    return 0 if word.nil?
    points = 0
    word.chars.each do |char|
      SCORES.each do |letters, value|
        points += value if letters.include?(char.downcase)
      end
    end
    points
  end
end
