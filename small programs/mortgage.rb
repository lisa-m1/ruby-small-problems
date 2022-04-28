MONTHS_IN_A_YEAR = 12
INVALID_NUMBER = "This isn't a valid positive number. Please try again."

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i.to_s == num.to_s && num.to_i > 0
end

def valid_float?(num)
  num.to_f.to_s == num.to_s && num.to_f > 0
end

def get_loan
  amount = ''
  loop do
    prompt("Please enter the loan amount rounded to the nearest dollar:")
    amount = gets.chomp
    if valid_number?(amount)
      amount = amount.to_i
      break
    else
      prompt(INVALID_NUMBER)
    end
  end
  amount.to_i
end

def get_apr
  apr = ''
  loop do
    prompt("Please enter the interest rate with one decimal place")
    prompt("(3.5 for 3.5%; 5.0 for 5%)")
    apr = gets.chomp
    if valid_float?(apr)
      apr = apr.to_f
      break
    else
      prompt(INVALID_NUMBER)
    end
  end
  apr /= 100
end

def get_years
  years = ''
  loop do
    prompt("Please enter your loan duration in years:")
    years = gets.chomp
    if valid_number?(years)
      years = years.to_i
      break
    else
      prompt(INVALID_NUMBER)
    end
  end
  years
end

def get_calc_again
  another_calc = ''
  loop do
    prompt("Do you want to perfom another calculation? (y/n)")
    another_calc = gets.chomp
    if %w(y n).include?(another_calc.downcase)
      break
    else
      prompt('Please enter y or n.')
    end
  end
  another_calc.downcase
end

prompt("Welcome to the mortgage calculator!")

loop do
  loan_amount = get_loan

  monthly_rate = get_apr / MONTHS_IN_A_YEAR

  months = get_years * MONTHS_IN_A_YEAR

  monthly_payment = loan_amount *
                    (monthly_rate / (1 - (1 + monthly_rate)**(-months)))

  puts "Yout monthly payment is #{monthly_payment.round(2)}"

  calc_again = get_calc_again
  break unless calc_again == 'y'
end
