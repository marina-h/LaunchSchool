# A collection of spelling blocks has two letters per block,
# as shown in this list:
# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
# This limits the words you can spell with the blocks to just those words that
# do not use both letters from any given block. Each block can only be used
# once.  Write a method that returns true if the word passed in as an argument
# can be spelled from this set of blocks, false otherwise.

SPELLING_BLOCK = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(word)
  # letters = word.split('')
  # used_letters = []
  # SPELLING_BLOCK.each do |block|
  #   first, second = block.split('')
  #   return false if letters.include?(first) && letters.include?(second)
  #   if letters.include?(first)
  #     used_letters << first
  #   elsif letters.include?(second)
  #     used_letters << second
  #   end
  # end
  # used_letters.sort == letters.sort

  # one-line version:
  SPELLING_BLOCK.none? { |block| word.count(block) >= 2 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
