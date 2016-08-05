# Write a method that returns true if the string passed as an argument is a
# palindrome, false otherwise. (A palindrome reads the same forwards and
# backwards.) Case matters, and all characters should be considered.

# recursive
def palindrome1?(str)
  if str.size <= 1
    true
  else
    str[0] == str[-1] ? palindrome1?(str[1..-2]) : false
  end
end

# iterative
def palindrome2?(str)
  half_length = (str.length / 2.0).ceil
  half_length.times do |i|
    return false if str[i] != str[-i - 1]
  end
  true
end

# simple
def palindrome3(str)
  str == str.reverse
end

puts palindrome1?('madam') == true
puts palindrome1?('Madam') == false          # (case matters)
puts palindrome1?("madam i'm adam") == false # (all characters matter)
puts palindrome1?('356653') == true
puts palindrome2?('madam') == true
puts palindrome2?('Madam') == false          # (case matters)
puts palindrome2?("madam i'm adam") == false # (all characters matter)
puts palindrome2?('356653') == true
