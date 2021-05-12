class Robot
  attr_reader :name
  
  LETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  @@used_names = []

  def initialize
    @name = generate_name
  end

  def generate_name
    name = ''
    loop do
      name = ''
      name << random_letter_sequence
      name << random_num_sequence
      break unless @@used_names.include?(name)
    end
    @@used_names << name
    name
  end
  
  def random_num_sequence
    num = ''
    3.times { num << rand(0..9).to_s}
    num
  end
  
  def random_letter_sequence
    letters = ''
    2.times { letters << LETTERS[rand(0..LETTERS.size - 1)]}
    letters
  end
  
  def reset
    @name = generate_name
  end


  def self.used_names
    @@used_names
  end
    
end
