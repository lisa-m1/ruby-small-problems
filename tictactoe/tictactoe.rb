COMPUTER_MARKER = 'O'
INITAL_MAKER = ' '
PLAYER_MARKER = 'X'

FIRST_TO_PLAY = {
  "player" => false,
  "computer" => false,
  "choose" => true
}

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

WINNING_SCORE = 5

score = {
  player: 0,
  computer: 0
}

def prompt(message)
  puts "=> #{message}"
end

def joinor(arr, sep=', ', word='or')
  if arr.size == 1
    arr[0]
  else
    arr.join(sep).insert(-2, "#{word} ")
  end
end

def display_board(brd)
  system 'clear'
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "      |      |"
  puts "  #{brd[1]}   |  #{brd[2]}   |  #{brd[3]}"
  puts "      |      |"
  puts "------+------+-------"
  puts "      |      |"
  puts "  #{brd[4]}   |  #{brd[5]}   |  #{brd[6]}"
  puts "      |      |"
  puts "------+------+-------"
  puts "      |      |"
  puts "  #{brd[7]}   |  #{brd[8]}   |  #{brd[9]}"
  puts "      |      |"
end

def first_to_play
  answer = ''
  if FIRST_TO_PLAY["choose"] == true
    loop do
      prompt "Who goes first? Please answer 'computer' or 'player'"
      answer = gets.chomp
      break if ['computer', 'player'].include?(answer)
      prompt "That's not a valid answer. Must be 'computer' or 'player'."
    end
  end
  FIRST_TO_PLAY[answer] = true
  FIRST_TO_PLAY["choose"] = false
  answer
end

def reset_first_to_play
  FIRST_TO_PLAY["choose"] = true
  FIRST_TO_PLAY["player"] = false
  FIRST_TO_PLAY["computer"] = false
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITAL_MAKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITAL_MAKER }
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = if at_risk_square?(brd, COMPUTER_MARKER)
             find_next_move(brd, COMPUTER_MARKER)
           elsif at_risk_square?(brd, PLAYER_MARKER)
             find_next_move(brd, PLAYER_MARKER)
           elsif brd[5] == INITAL_MAKER
             5
           else
             empty_squares(brd).sample
           end
  brd[square] = COMPUTER_MARKER
end

def places_piece!(brd, current_player)
  if current_player == "player"
    player_places_piece!(brd)
  elsif current_player == "computer"
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  if current_player == 'player'
    'computer'
  else 'player'
  end
end

def at_risk_square?(brd, player)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(player) == 2 &&
       brd.values_at(*line).count(INITAL_MAKER) == 1
      return true
    end
  end
  false
end

def find_next_move(brd, player)
  square = 0
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(player) == 2 &&
       brd.values_at(*line).count(INITAL_MAKER) == 1
      square = line.select { |num| brd[num] == INITAL_MAKER }
    end
  end
  square[0]
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def update_score(score, brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      score[:player] += 1
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      score[:computer] += 1
    end
  end
end

def display_score(score)
  prompt "Your score: #{score[:player]}. Computer's score: #{score[:computer]}."
end

def reset_score(score)
  score[:player] = 0
  score[:computer] = 0
end

def grand_winner?(score)
  score[:player] == WINNING_SCORE || score[:computer] == WINNING_SCORE
end

def display_grand_winner(score)
  if score[:player] == WINNING_SCORE
    prompt "You are the grand winner"
  elsif score[:computer] == WINNING_SCORE
    prompt "The computer is the grand winner"
  end
end

loop do
  prompt("Welcome to Tic Tac Toe")
  loop do
    reset_first_to_play
    board = initialize_board
    current_player = first_to_play

    loop do
      display_board(board)

      places_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      update_score(score, board)
      display_score(score)
      sleep 2
      if grand_winner?(score)
        display_grand_winner(score)
        reset_score(score)
        break
      end
    else
      prompt "It's a tie!"
      display_score(score)
      sleep 2
    end
  end

  prompt "Do you want to play again? y/n"
  answer = gets.chomp
  break unless answer.downcase == 'y'
end

prompt "Thanks for playing! Goodbye!"
