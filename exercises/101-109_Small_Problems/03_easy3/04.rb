# Create a method that takes two arguments, multiplies them together, and
# returns the result.

def multiply(num1, num2)
  num1 * num2
end

puts multiply(5, 3) == 15
puts multiply('hi', 2) == 'hihi'
puts multiply([1, 2], 3) == [1, 2, 1, 2, 1, 2]
