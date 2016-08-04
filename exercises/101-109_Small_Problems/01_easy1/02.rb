# Write a method that takes one argument in the form of an integer or a float;
# this argument may be either positive or negative. This method should check if
# a number is odd, returning true if its absolute value is odd. Floats should
# only return true if the number is equal to its integer part and the integer is
# odd.

def is_odd?(n)
  n % 2 == 1
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(7.1)  # => false
puts is_odd?(-5.0) # => true
