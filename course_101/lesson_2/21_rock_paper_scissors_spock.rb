# Rock Paper Scissors + Bonus Features

VALID_CHOICES = %w(rock paper scissors lizard spock)
WINNING_SCORE = 5

require 'Abbrev'
abbreviations = Abbrev.abbrev(VALID_CHOICES)

WINNING_HANDS = {
  rock: %w(scissors lizard),
  paper: %w(rock spock),
  scissors: %w(paper lizard),
  lizard: %w(spock paper),
  spock: %w(rock scissors)
}

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  WINNING_HANDS[first.to_sym].include?(second)
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("You lost!")
  else
    prompt("It's a tie!")
  end
end

def update_scores(choice, computer_choice, scores)
  if win?(choice, computer_choice)
    scores[:player] += 1
  elsif win?(computer_choice, choice)
    scores[:computer] += 1
  end
end

def display_winner_if_exists(score_one, score_two)
  if score_one == WINNING_SCORE
    prompt("You won, great job!")
  elsif score_two == WINNING_SCORE
    prompt("You lost! Better luck next time.")
  end
end

def another_game?
  loop do
    answer = gets.chomp.downcase
    break true if %w(y yes).include?(answer)
    break false if %w(n no).include?(answer)
    prompt("Please enter either 'y' or 'n'.")
  end
end

choice = ""
loop do
  scores = { player: 0, computer: 0 }

  loop do
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      prompt("(You can just type the first letter(s) of your choice)")
      choice = gets.chomp.downcase

      if abbreviations.keys.include?(choice)
        choice = abbreviations[choice]
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample
    puts("You chose #{choice}; Computer chose #{computer_choice}")
    display_result(choice, computer_choice)

    update_scores(choice, computer_choice, scores)
    prompt("Your score is: #{scores[:player]}. "\
      "The computer's score is: #{scores[:computer]}.\n\n")

    display_winner_if_exists(scores[:player], scores[:computer])
    break if scores[:player] == 5 || scores[:computer] == 5
  end

  prompt("Do you want to play again?")
  break unless another_game?
  puts "\n-------------------------------------------------------------------"
end

prompt("Thank you for playing. Good bye!")
