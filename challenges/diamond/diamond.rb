class Diamond
  ALPHA = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  def self.make_diamond(letter)
    first_half = make_first_half(letter)
    second_half = make_second_half(letter)
    first_half + second_half
  end

  def self.make_first_half(letter)
    answer = ''
    border = ALPHA.index(letter)
    index = ALPHA.index(letter)
    0.upto(index).each do |idx|
      answer << row(ALPHA[idx], border)
      border -= 1
    end
    answer
  end

  def self.make_second_half(letter)
    answer = ''
    index = ALPHA.index(letter) - 1
    border = 1
    index.downto(0).each do |idx|
      answer << row(ALPHA[idx], border)
      border += 1
    end
    answer
  end

  def self.row(letter, border)
    border_space = ' ' * border
    if letter == 'A'
      "#{border_space}#{letter}#{border_space}\n"
    else
      space_marker = ' ' * ((ALPHA.index(letter) * 2) - 1)
      "#{border_space}#{letter}#{space_marker}#{letter}#{border_space}\n"
    end
  end
end
