# frozen_string_literal: true

SUITS = %w(H S C D).freeze
VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze
SUIT_NAMES = { 'H': 'hearts',
               'S': 'spades',
               'C': 'clubs',
               'D': 'diamonds' }.freeze
# set to desired value >= 21
MAX_TOTAL_VALUE = 21
DEALER_MAX_VALUE = 17
WINNING_POINTS = 5

require 'pry'

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def deal_card!(cards, hand)
  hand.push(cards.pop)
end

def correct_value_for_aces(values, sum)
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > MAX_TOTAL_VALUE
  end
  sum
end

def find_card_value(value)
  return 11 if value == "A"
  return 10 if value.to_i.zero? # 'J', 'Q', 'K'
  value.to_i
end

def total_value(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }
  sum = 0

  values.each do |value|
    sum += find_card_value(value)
  end
  correct_value_for_aces(values, sum)
end

def pretty_cards(cards)
  cards.map { |card| "#{card[1]} of #{SUIT_NAMES[card[0].to_sym]}" }
end

def initialize_hands(deck, player_cards, dealer_cards)
  2.times do
    deal_card!(deck, player_cards)
    deal_card!(deck, dealer_cards)
  end
end

def display_round_start(round, player_cards, dealer_cards)
  puts "--------------"
  puts "Round #{round}"
  puts "--------------"
  prompt("The dealer has #{pretty_cards([dealer_cards[0]])} " \
         "and an unknown card.")
  prompt("You have #{pretty_cards([player_cards[0]])} and " \
        "#{pretty_cards([player_cards[1]])} for a total of " \
        "#{total_value(player_cards)}.")
end

def busted?(cards)
  total_value(cards) > MAX_TOTAL_VALUE
end

def ask_hit_or_stay
  player_choice = nil
  loop do
    prompt("Would you like to (h)it or (s)tay?")
    player_choice = gets.chomp.downcase
    break if ['h', 's'].include?(player_choice)
    prompt("Sorry, you must enter 'h' or 's'.")
  end
  player_choice
end

def display_result_of_stay(name, total)
  if name == :player
    prompt("You chose to stay at #{total}.")
    prompt("The dealer's turn...")
  elsif name == :dealer
    prompt("The dealer chose to stay at #{total}.")
  end
end

def run_player_turn(player_cards, deck)
  loop do
    player_choice = ask_hit_or_stay

    if player_choice == 'h'
      deal_card!(deck, player_cards)
      prompt("You chose to hit!")
      sleep 0.6
      prompt("Your current hand is: #{pretty_cards(player_cards)}")
      prompt("Your total is: #{total_value(player_cards)}")
    end
    break if player_choice == 's' || busted?(player_cards)
  end
end

def run_dealer_turn(dealer_cards, deck)
  loop do
    break if busted?(dealer_cards) ||
             total_value(dealer_cards) >= DEALER_MAX_VALUE
    prompt("The dealer hits.")
    sleep 0.6
    deal_card!(deck, dealer_cards)
    prompt("The dealer's cards are now: #{pretty_cards(dealer_cards)}")
    sleep 0.6
  end
end

def play_again?
  prompt("Play again? (Enter 'y' or 'n')")
  loop do
    answer = gets.chomp.downcase
    break true if %w(y ye yes).include?(answer)
    break false if %w(n no).include?(answer)
    prompt("Please enter either 'y' or 'n'.")
  end
end

def find_result(player_score, dealer_score)
  if player_score > 21
    :player_busted
  elsif dealer_score > 21
    :dealer_busted
  elsif dealer_score < player_score
    :player
  elsif dealer_score > player_score
    :dealer
  else
    :tie
  end
end

def display_summary(dealer_cards, dealer_score, player_cards, player_score)
  puts "================================================="
  prompt("The dealer has #{pretty_cards(dealer_cards)} " \
         "for a total of #{dealer_score}.")
  prompt("You have #{pretty_cards(player_cards)} " \
         "for a total of #{player_score}.")
  puts "================================================="
  sleep 1
end

def display_winner_of_round(result)
  case result
  when :player_busted
    prompt "You busted! The dealer wins!"
  when :dealer_busted
    prompt "The dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "The dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def display_round_summary(result, scores)
  display_winner_of_round(result)
  prompt("Current scores: Player - #{scores[:player]}, "\
         "Dealer - #{scores[:dealer]} (Hit return to continue)")
  gets
  clear_screen
end

def find_winner(result)
  case result
  when :player, :dealer_busted
    "Player"
  when :dealer, :player_busted
    "The dealer"
  end
end

def update_scores(result, scores)
  winner = find_winner(result)
  if winner == "Player"
    scores[:player] += 1
  elsif winner == "The dealer"
    scores[:dealer] += 1
  end
end

loop do
  scores = { player: 0, dealer: 0 }
  round = 1
  clear_screen
  prompt("Welcome to Twenty-One!")

  loop do
    deck = initialize_deck
    player_hands = []
    dealer_hands = []
    initialize_hands(deck, player_hands, dealer_hands)

    display_round_start(round, player_hands, dealer_hands)
    run_player_turn(player_hands, deck)
    player_total = total_value(player_hands)

    if busted?(player_hands)
      sleep 1
      dealer_total = total_value(dealer_hands)
    else
      display_result_of_stay(:player, player_total)
      run_dealer_turn(dealer_hands, deck)
      dealer_total = total_value(dealer_hands)

      if !busted?(dealer_hands)
        display_result_of_stay(:dealer, dealer_total)
      end
    end

    display_summary(dealer_hands, dealer_total, player_hands, player_total)
    round_result = find_result(player_total, dealer_total)
    update_scores(round_result, scores)

    if scores.value?(WINNING_POINTS)
      prompt("#{find_winner(round_result)} wins with #{WINNING_POINTS} points!")
      break
    else
      display_round_summary(round_result, scores)
      round += 1
    end
  end

  break unless play_again?
end

puts "Thanks for playing Twenty-One!"
