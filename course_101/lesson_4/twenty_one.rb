SUITS = ['H', 'S', 'C', 'D'].freeze
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10',
          'J', 'Q', 'K', 'A'].freeze

require 'pry'

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def deal_random_card(cards, hand)
  hand.push(cards.pop)
end

def correct_value_for_aces(values, sum)
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end

def total_value(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i.zero? # 'J', 'Q', 'K'
      sum += 10
    else
      sum += value.to_i
    end
  end

  correct_value_for_aces(values, sum)
end

def busted?(cards)
  total_value(cards) > 21
end

def find_result(player_score, dealer_score)
  if player_score > 21
    :player_busted
  elsif dealer_score > 21
    :dealer_busted
  elsif player_score > dealer_score
    :player
  elsif dealer_score > player_score
    :dealer
  else
    :tie
  end
end

def display_winner(player_score, dealer_score)
  result = find_result(player_score, dealer_score)
  
  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins, better luck next time!"
  when :tie
    prompt "It's a tie!"
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

def play_again_if_busted?
  play_again? ? next : break
end

loop do
  deck = initialize_deck
  player_hands = []
  dealer_hands = []
  
  2.times do
    deal_random_card(deck, player_hands)
    deal_random_card(deck, dealer_hands)
  end

  prompt("Welcome to Twenty-One!")
  # explain rules and suit abbreviations ??? 
  prompt("The dealer has #{dealer_hands[0]} and an unknown card.")
  prompt("You have #{player_hands[0]} and #{player_hands[1]} for a total of #{total_value(player_hands)}.")

  # player turn
  loop do
    player_choice = nil
    
    loop do
      prompt("Would you like to (h)it or (s)tay?")
      player_choice = gets.chomp.downcase
      break if ['h', 's'].include?(player_choice)
      prompt("Sorry, you must enter 'h' or 's'.")
    end
    
    if player_choice == 'h'
      deal_random_card(deck, player_hands)
      prompt("You chose to hit!")
      prompt("Your current hand is: #{player_hands}")
      prompt("Your total is: #{total_value(player_hands)}")
    end
    
    break if player_choice == 's' || busted?(player_hands)
  end

  player_total = total_value(player_hands)
  if busted?(player_hands)
    prompt("You busted! Dealer wins!")
    play_again? ? next : break
  else
    prompt("You chose to stay at #{player_total}. (Hit return to continue)")
    gets
  end

  # dealer turn
  prompt("The dealer's turn...")
  
  loop do
    break if busted?(dealer_hands) || total_value(dealer_hands) >= 17
    
    prompt("The dealer hits.")
    deal_random_card(deck, dealer_hands)
    prompt("The dealer's cards are now: #{dealer_hands}")
  end

  dealer_total = total_value(dealer_hands)
  if busted?(dealer_hands)
    prompt("The dealer's total is now: #{total_value(dealer_total)}")
    display_winner(player_hands, dealer_hands)
    play_again? ? next : break
  else
    prompt("The dealer stays at #{dealer_total}. (Hit return to continue)")
    gets
  end
  
  puts "==================================="
  prompt("The dealer has #{dealer_hands} for a total of #{dealer_total}.")
  prompt("You have #{player_hands} for a total of #{player_total}.")
  puts "==================================="
  
  display_winner(player_hands, dealer_hands)
  break unless play_again?
end

puts "Thanks for playing Twenty-One!"
