# Write a method that returns a list of all substrings of a string. The returned
# list should be ordered by where in the string the substring begins. This means
# that all substrings that start at position 0 should come first, then all
# substrings that start at position 1, and so on. Since multiple substrings will
# occur at each position, the substrings at a given position should be returned
# in order from shortest to longest.  You may (and should) use the
# substrings_at_start method you wrote in the previous exercise.

def substrings_at_start(str)
  substrings = []
  0.upto(str.length - 1) { |i| substrings.push(str[0..i]) }
  substrings
end

def substrings(str)
  all_substrings = []
  0.upto(str.length - 1) do |i|
    all_substrings.concat(substrings_at_start(str[i..-1]))
  end
  all_substrings
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
