class Anagram
  attr_reader :word

  def initialize(str)
    @word = str
  end

  def match(arr)
    result = []
    arr_downcase = arr.map(&:downcase)
    arr_downcase.each_with_index do |item, index|
      if word.downcase.chars.sort == item.chars.sort && word.downcase != item
        result << arr[index]
      end
    end
    result
  end
end
