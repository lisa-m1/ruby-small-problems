class RomanNumeral

  HUNDREDS = {
    0 => '',
    1 => 'C',
    2 => 'CC',
    3 => 'CCC',
    4 => 'CD',
    5 => 'D',
    6 => 'DC',
    7 => 'DCC',
    8 => 'DCCC',
    9 => 'CM'
  }

  TENS = {
    0 => '',
    1 => 'X',
    2 => 'XX',
    3 => 'XXX',
    4 => 'XL',
    5 => 'L',
    6 => 'LX',
    7 => 'LXX',
    8 => 'LXXX',
    9 => 'XC'
  }

  ONES = {
    0 => '',
    1 => 'I',
    2 => 'II',
    3 => 'III',
    4 => 'IV',
    5 => 'V',
    6 => 'VI',
    7 => 'VII',
    8 => 'VIII',
    9 => 'IX'
  }
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def to_roman
    num = number_array
    result = ''
    result << 'M' * num[0]
    result << HUNDREDS[num[1]]
    result << TENS[num[2]]
    result << ONES[num[3]]
    result
  end

  def number_array
    number_array = number.to_s.chars.map(&:to_i)
    while number_array.size < 4
      number_array.unshift(0)
    end
    number_array
  end
end
