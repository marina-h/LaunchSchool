# Write a method that takes a sentence string as input, and returns a new string
# that contains the original string with any sequence of the words 'zero',
# 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'
# converted to a string of digits.

WORDS_TO_DIGITS = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}.freeze

def word_to_digit(sentence)
  # sentence.gsub(/zero|one|two|three|four|five|six|seven|eight|nine/,
  #               WORDS_TO_DIGITS)
  WORDS_TO_DIGITS.each do |word, num|
    sentence.gsub!(/\b#{word}\b/, num)
    # alternative:
    # sentence.gsub(/#{WORDS_TO_DIGITS.keys.join("|")}/, WORDS_TO_DIGITS)
  end
  sentence
end

puts word_to_digit(
        'Please call me at five five five one two three four. Thanks.'
     ) == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
