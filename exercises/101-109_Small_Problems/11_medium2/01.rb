# Write a program that reads the content of a text file and then prints the
# longest sentence in the file based on number of words. Sentences may end with
# periods (.), exclamation points (!), or question marks (?). Any sequence of
# characters that are not spaces or sentence-ending characters should be treated
# as a word. You should also print the number of words in the longest sentence.

# split text by spaces
# for each word in arr, add to sentence-length counter until you find .?!
#   also add word to sentence
# set highest count to count if it is higher
#   also make longest-sentence the sentence-length
# reset counter
# return sentence.join and highest count

require 'pry'

def find_longest_sentence(text)
  longest_sentence = []
  current_sentence = []

  text.split.each do |word|
    current_sentence << word
    # binding.pry
    next unless word[-1] == '.' || word[-1] == '!' || word[-1] == '?'
    longest_sentence = current_sentence if
      current_sentence.length > longest_sentence.length
    current_sentence = []
  end
  puts "The longest sentence is:"
  puts longest_sentence.join(' ')
  puts "It is #{longest_sentence.length} words long."

  # shorter:

  # text = File.read('sample_text.txt')
  # sentences = text.split(/\.|\?|!/)
  # largest_sentence = sentences.max_by { |sentence| sentence.split.size }
  # largest_sentence = largest_sentence.strip
  # number_of_words = largest_sentence.split.size
end

find_longest_sentence(
  'Four score and seven years ago our fathers brought forth
  on this continent a new nation, conceived in liberty, and
  dedicated to the proposition that all men are created
  equal.

  Now we are engaged in a great civil war, testing whether
  that nation, or any nation so conceived and so dedicated,
  can long endure. We are met on a great battlefield of that
  war. We have come to dedicate a portion of that field, as
  a final resting place for those who here gave their lives
  that that nation might live. It is altogether fitting and
  proper that we should do this.

  But, in a larger sense, we can not dedicate, we can not
  consecrate, we can not hallow this ground. The brave
  men, living and dead, who struggled here, have
  consecrated it, far above our poor power to add or
  detract. The world will little note, nor long remember
  what we say here, but it can never forget what they
  did here. It is for us the living, rather, to be dedicated
  here to the unfinished work which they who fought
  here have thus far so nobly advanced. It is rather for
  us to be here dedicated to the great task remaining
  before us -- that from these honored dead we take
  increased devotion to that cause for which they gave
  the last full measure of devotion -- that we here highly
  resolve that these dead shall not have died in vain
  -- that this nation, under God, shall have a new birth
  of freedom -- and that government of the people, by
  the people, for the people, shall not perish from the
  earth.')
