# Exercises: Medium 1
# Question 3

# puts "the value of 40 + 2 is " + (40 + 2)

# This produces a TypeError since the result of (40 + 2) is an integer,
# which cannot be implicitly converted in a string before being concatenated
# with "the value of 40 + 2 is ".

# One way to fix this is to use the .to_s method:
puts "the value of 40 + 2 is " + (40 + 2).to_s

# Another way is to use string interpolation:
puts "the value of 40 + 2 is #{40 + 2}"
