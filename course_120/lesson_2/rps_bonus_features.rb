module GameConstants
  MOVE_VALUES = { 1 => 'rock', 2 => 'paper', 3 => 'scissors',
                  4 => 'spock', 5 => 'lizard' }.freeze

  WINNING_MOVES = {
    rock: %w(scissors lizard),
    paper: %w(rock spock),
    scissors: %w(paper lizard),
    lizard: %w(spock paper),
    spock: %w(rock scissors)
  }.freeze
end

class Move
  include GameConstants
  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def to_s
    @value
  end

  def >(other_move)
    WINNING_MOVES[@value.to_sym].include?(other_move.value)
  end

  def <(other_move)
    other_move > self
  end
end

class Player
  include GameConstants
  attr_accessor :move, :name, :score, :history

  def initialize
    @score = 0
    @history = []
  end
end

class Human < Player
  def initialize
    super
    set_name
  end

  def set_name
    n = ''
    RPSGame.clear_screen
    loop do
      puts "What's your name?"
      n = gets.chomp.strip
      break unless n.empty?
      puts "Sorry, you must enter a name."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose (1) rock, (2) paper, (3) scissors, " \
           "(4) spock, or (5) lizard:"
      choice = gets.chomp.to_i
      break if MOVE_VALUES.keys.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(MOVE_VALUES[choice])
    history << move
  end
end

class Computer < Player
  # may change to any value between 0.0 and 1.0
  MAX_TOLERATED_LOSE_RATE = 0.4

  def initialize
    super
    @name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
    @percent_lost_by_hand = Hash.new { |k, v| k[v] = 0 }
    set_possible_moves
    reset_move_probabilities
  end

  def set_possible_moves
    @possible_moves_computer =
      case name
      when 'R2D2'     then %w(rock)
      when 'Hal'      then %w(rock scissors lizard spock)
      when 'Chappie'  then %w(rock paper scissors lizard spock)
      when 'Sonny'    then %w(rock paper scissors lizard spock)
      when 'Number 5' then %w(rock paper scissors lizard)
      end
  end

  def reset_move_probabilities
    @move_probabilities =
      case name
      when 'R2D2'     then { 'rock' => 1.0 }
      when 'Hal'      then { 'rock' => 0.1, 'scissors' => 0.6, 'lizard' => 0.15,
                             'spock' => 0.15 }
      when 'Chappie'  then { 'rock' => 0.2, 'scissors' => 0.2, 'paper' => 0.2,
                             'lizard' => 0.2, 'spock' => 0.2 }
      when 'Sonny'    then { 'rock' => 0.1, 'paper' => 0.1, 'scissors' => 0.1,
                             'lizard' => 0.35, 'spock' => 0.35 }
      when 'Number 5' then { 'rock' => 0.25, 'paper' => 0.25,
                             'scissors' => 0.25, 'lizard' => 0.25 }
      end
  end

  def calculate_lose_rates(human_history)
    games = history.zip(human_history)

    @possible_moves_computer.each do |move_type|
      losses = 0
      games_with_move = games.select { |comp, _| comp.value == move_type }

      if games_with_move.length.positive?
        games_with_move.each { |comp, hum| losses += 1 if comp < hum }
        @percent_lost_by_hand[move_type] = losses.to_f / games_with_move.length
      end
    end
  end

  def find_preferred_moves
    preferred_moves = []
    @possible_moves_computer.each do |move_type|
      if @percent_lost_by_hand[move_type] < MAX_TOLERATED_LOSE_RATE
        preferred_moves << move_type
      end
    end
    preferred_moves
  end

  def choose_move_using_probabilities
    cumulative_value = 0.0
    ranges = @move_probabilities.map do |move, prob|
      [cumulative_value += prob, move]
    end
    ranges = Hash[ranges]
    rand_value = rand
    self.move = Move.new(ranges.find { |prob, _| prob > rand_value }.last)
  end

  def adjust_probabilities
    preferred_moves = find_preferred_moves
    preferred_moves.each do |preferred_move|
      @move_probabilities.keys.each do |move|
        if move == preferred_move
          @move_probabilities[move] += 0.1
        else
          val_to_subtract = 0.1 / (@possible_moves_computer.length - 1)
          @move_probabilities[move] -= val_to_subtract
        end
        @move_probabilities[move] = @move_probabilities[move].round(3)
      end
    end
  end

  def choose
    adjust_probabilities
    choose_move_using_probabilities
    @history << @move
    reset_move_probabilities
  end
end

class RPSGame
  include GameConstants
  attr_accessor :human, :computer, :max_points

  def initialize
    @human = Human.new
    @computer = Computer.new
    @max_points = nil
  end

  def self.clear_screen
    system('clear') || system('cls')
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, #{human.name}!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def ask_for_points_needed_to_win
    puts "How many points should we play until?"
    points = nil
    loop do
      points = gets.chomp.to_i
      break if points.positive?
      puts "Sorry, please enter an integer greater than 0."
    end
    @max_points = points
    puts ''
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_round_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def update_scores
    if human.move > computer.move
      human.score += 1
    elsif human.move < computer.move
      computer.score += 1
    end
  end

  def display_scores
    puts "#{human.name} currently has #{human.score} points."
    puts "#{computer.name} currently has #{computer.score} points."
    puts ''
  end

  def display_winner
    if human.score == max_points
      puts "#{human.name} won this round with #{max_points} points!"
    else
      puts "#{computer.name} won this round with #{max_points} points!"
    end
  end

  def winning_score?
    human.score == max_points || computer.score == max_points
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "Sorry, must type y or n."
    end

    answer == 'y'
  end

  def reset_scores
    human.score = 0
    computer.score = 0
  end

  def reset_history
    human.history = []
    computer.history = []
  end

  def play_round
    loop do
      human.choose
      computer.choose
      display_moves
      display_round_winner
      computer.calculate_lose_rates(human.history)
      update_scores
      break if winning_score?
      display_scores
    end
  end

  def play
    display_welcome_message
    loop do
      ask_for_points_needed_to_win
      play_round
      display_winner
      break unless play_again?
      reset_scores
      reset_history
      @computer = Computer.new
      RPSGame.clear_screen
    end
    display_goodbye_message
  end
end

RPSGame.new.play
