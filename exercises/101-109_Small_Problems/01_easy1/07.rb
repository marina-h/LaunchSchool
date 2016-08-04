# Write a method that takes one argument, a positive integer, and returns a
# string of alternating 1s and 0s, always starting with 1. The length of the
# string should match the given integer.

def stringy(int, starts_with=1)
  string = ''
  if starts_with == 1
    int.times do |i|
      i.odd? ? string += '0' : string += '1'
    end
  else
    int.times do |i|
      i.even? ? string += '0' : string += '1'
    end
  end
  string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
