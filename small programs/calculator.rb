require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')


def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  unless num == '0' 
    num.to_f != 0.0
  else true
  end
end

def valid_denominator?(num)
  num.to_f != 0.0
end

def operation_to_message(op)
  case op
  when "1"
    "Adding"
  when "2"
    "Subtracting"
  when "3"
    "Multiplying"
  when "4"
    "Dividing"
  end
end

prompt(MESSAGES['welcome'])

name = ''

loop do
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi, #{name.capitalize}!")

loop do
  num1 = ''

  loop do
    prompt(MESSAGES['first_number'])
    num1 = gets.chomp
    if valid_number?(num1)
      num1 = num1.to_f
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  num2 = ''

  loop do
    prompt(MESSAGES['second_number'])
    num2 = gets.chomp

    if valid_number?(num2)
      num2 = num2.to_f
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform? 
    1) add 
    2) subtract 
    3) multiply 
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''

  loop do
    operator = gets.chomp
    if ['1', '2', '3', '4'].include?(operator)
      break
    else
      prompt(MESSAGES['operation_choice'])
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result =  case operator
            when "1"
              num1 + num2
            when "2"
              num1 - num2
            when "3"
              num1 * num2
            when "4"
              loop do
                if num2.to_f == 0.0
                puts MESSAGES['valid_denominator']
                num2 = gets.chomp.to_f
                else 
                  break
                end
              end
            num1 / num2
            end

  prompt("The result is #{result}")

  prompt(MESSAGES['another_calculation'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['thank_you'])