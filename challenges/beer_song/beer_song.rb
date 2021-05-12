class BeerSong
  def self.verse(number)
    if number == 2
      "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
      "Take one down and pass it around, #{number - 1} bottle of beer on the wall.\n"
    elsif number == 1
      "#{number} bottle of beer on the wall, #{number} bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    elsif number.zero?
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
      "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
    end
  end

  def self.verses(number1, number2)
    result = ''
    number1.downto(number2) do |number|
      result << verse(number)
      result << "\n" unless number == number2
    end
    result
  end

  def self.lyrics
    verses(99, 0)
  end
end
