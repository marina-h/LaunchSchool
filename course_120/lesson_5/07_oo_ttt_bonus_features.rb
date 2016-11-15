class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  attr_reader :squares

  def initialize
    @squares = {}
    reset
  end

  def [](num)
    @squares[num]
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.select { |_, sq| sq.unmarked? }.keys
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def find_at_risk_square(brd, mark)
    WINNING_LINES.each do |line|
      squares_in_line = brd.squares.values_at(*line)
      next unless squares_in_line.collect(&:marker).count(mark) == 2 &&
                  squares_in_line.select(&:unmarked?).count == 1
      num_sq = line.select { |num| brd[num].marker == Square::INITIAL_MARKER }
      return num_sq.first
    end
    nil
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.uniq.size == 1
  end
end

class Square
  INITIAL_MARKER = ' '.freeze

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end

class Human < Player
  attr_reader :playing_first

  def initialize(name, marker, playing_first)
    super(name, marker)
    @playing_first = playing_first
  end

  def move(brd)
    puts "Choose a square: #{joinor(brd.unmarked_keys)}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if brd.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    brd[square] = marker
  end

  private

  def joinor(arr, delimiter=', ', word='or')
    arr[-1] = "#{word} #{arr.last}" if arr.size > 1
    arr.size == 2 ? arr.join(' ') : arr.join(delimiter)
  end
end

class Computer < Player
  COMPUTER_MARKER = 'O'.freeze

  def initialize
    super(pick_random_name, COMPUTER_MARKER)
  end

  def move(brd, other_marker)
    square = brd.find_at_risk_square(brd, marker) ||
             brd.find_at_risk_square(brd, other_marker) ||
             take_center_square(brd) ||
             brd.unmarked_keys.sample
    brd[square] = marker
  end

  private

  def pick_random_name
    ['R2D2', 'Chappie', 'Sonny', 'Number 5', 'Hal'].sample
  end

  def take_center_square(brd)
    5 if brd[5].marker == Square::INITIAL_MARKER
  end
end

module PlayerQuestions
  def set_player_settings
    ask_for_name
    ask_for_player_marker
    ask_for_max_score
    ask_if_going_first
    @human = Human.new(@human_name, @human_marker, @playing_first)
    @is_human_turn = @playing_first
  end

  def ask_for_name
    name = nil
    loop do
      puts "What's your name?"
      name = gets.chomp.strip
      break unless name.empty?
      puts "Sorry, you must enter a name."
    end
    puts ""
    @human_name = name
  end

  def ask_for_max_score
    puts "How many points should we play until?"
    points = nil
    loop do
      points = gets.chomp.to_i
      break if points.positive?
      puts "Sorry, please enter an integer greater than 0."
    end
    puts ""
    @winning_score = points
  end

  def ask_for_player_marker
    puts "What would you like your marker to be? (Example: X)"
    puts "The computer will use 'O'."
    answer = nil
    loop do
      answer = gets.chomp
      break if answer.length == 1 && (/[[:graph:]]/ =~ answer)
      puts "Sorry, you can only use 1 character markers."
    end
    @human_marker = answer
  end

  def ask_if_going_first
    puts "Would you like to go first? (y/n)"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, please type y or n."
    end
    @playing_first = answer == 'y'
  end
end

module GameMessages
  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def display_board
    puts "You're a #{human.marker}. #{computer.name} is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
    puts "Your score is: #{scores[:human]}. "\
         "The computer's score is: #{scores[:computer]}."
    puts ""
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end

  def display_round_result
    case board.winning_marker
    when human.marker
      puts "#{human.name} wins!"
    when computer.marker
      puts "#{computer.name} wins!"
    else
      puts "It's a tie!"
    end
    puts "Press any key to continue."
    gets
  end

  def display_result
    winner = case board.winning_marker
             when human.marker then human.name
             when computer.marker then computer.name
             end
    puts "#{winner} wins with #{@winning_score} points!"
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n yes no).include?(answer)
      puts "Sorry, must be y or n."
    end

    answer == 'y'
  end
end

class TTTGame
  include PlayerQuestions
  include GameMessages

  attr_reader :board, :human, :computer, :scores

  def initialize
    @board = Board.new
    @computer = Computer.new
    reset_scores
  end

  def play
    clear_screen
    display_welcome_message
    set_player_settings
    clear_screen

    loop do
      display_board
      play_round
      display_result
      break unless play_again?
      reset_game
      display_play_again_message
    end

    display_goodbye_message
  end

  private

  def play_round
    loop do
      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        clear_screen_and_display_board if @is_human_turn
      end
      update_scores
      clear_screen
      clear_screen_and_display_board
      break if winning_score?

      display_round_result
      reset_round
      display_board
    end
  end

  def current_player_moves
    @is_human_turn ? human.move(board) : computer.move(board, human.marker)
    @is_human_turn = !@is_human_turn
  end

  def update_scores
    case board.winning_marker
    when human.marker
      scores[:human] += 1
    when computer.marker
      scores[:computer] += 1
    end
  end

  def winning_score?
    scores.values.include?(@winning_score)
  end

  def reset_scores
    @scores = { human: 0, computer: 0 }
  end

  def reset_round
    board.reset
    @is_human_turn = human.playing_first
    clear_screen
  end

  def reset_game
    @computer = Computer.new
    reset_round
    reset_scores
  end
end

game = TTTGame.new
game.play
