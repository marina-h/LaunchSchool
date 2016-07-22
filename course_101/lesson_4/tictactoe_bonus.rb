INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
WINNING_SCORE = 5
ENABLE_CHOOSE_PLAYER = true

# possible options if ENABLE_CHOOSE_PLAYER == false: 'player', 'computer'
FIRST_MOVE = 'player'.freeze

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

# rubocop:disable Metrics/AbcSize,Metrics/MethodLength
def display_board(brd, scores)
  clear_screen
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts "Your score is: #{scores[:player]}. "\
    "The computer's score is: #{scores[:computer]}.\n\n"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/Abcsize,Metrics/MethodLength

def ask_for_first_player
  prompt("Who should go first? ([1] Player, [2] Computer)")
  loop do
    answer = gets.chomp.downcase
    break 'player' if %w(1 player p).include?(answer)
    break 'computer' if %w(2 computer c).include?(answer)
    prompt("Please enter either '1' or '2'.")
  end
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter=', ', word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.size == 2 ? arr.join(' ') : arr.join(delimiter)
end

def find_at_risk_square(brd, marker)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) == 1
      return line.select { |num| brd[num] == INITIAL_MARKER }.first
    end
  end
  nil
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square (#{joinor(empty_squares(brd))}):")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice.")
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square ||= find_at_risk_square(brd, COMPUTER_MARKER)
  square ||= find_at_risk_square(brd, PLAYER_MARKER)
  square ||= 5 if brd[5] == INITIAL_MARKER
  square ||= empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, player)
  player_places_piece!(brd) if player == 'player'
  computer_places_piece!(brd) if player == 'computer'
end

def alternate_player(player)
  if player == 'player'
    'computer'
  else
    'player'
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
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

def update_scores(brd, scores)
  if detect_winner(brd) == 'Player'
    scores[:player] += 1
  elsif detect_winner(brd) == 'Computer'
    scores[:computer] += 1
  end
end

def display_winner_of_round(brd)
  if detect_winner(brd) == 'Player'
    prompt("You won this round! Hit return to continue.")
  elsif detect_winner(brd) == 'Computer'
    prompt("Sorry, you lost this round! Hit return to continue.")
  else
    prompt("It's a tie! Hit return to continue.")
  end
  gets
end

def play_again?
  prompt("Play again? (Enter 'y' or 'n')")
  loop do
    answer = gets.chomp.downcase
    break true if %w(y yes).include?(answer)
    break false if %w(n no).include?(answer)
    prompt("Please enter either 'y' or 'n'.")
  end
end

loop do
  scores = { player: 0, computer: 0 }

  if ENABLE_CHOOSE_PLAYER
    clear_screen
    FIRST_MOVE = ask_for_first_player
    current_player = FIRST_MOVE
  end

  loop do
    board = initialize_board

    loop do
      display_board(board, scores)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, scores)
    update_scores(board, scores)
    current_player = FIRST_MOVE

    if scores.value?(WINNING_SCORE)
      prompt("#{detect_winner(board)} wins with #{WINNING_SCORE} points!")
      break
    else
      display_winner_of_round(board)
    end
  end
  break unless play_again?
end

prompt("Thanks for playing!")
