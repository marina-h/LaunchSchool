# Using the multiply method from the "Multiplying Two Numbers" problem, write a
# method that computes the square of its argument (the square is the result of
# multiplying a number by itself).

# Further Exploration
# What if we wanted generalize this method to a "power to the n" type method:
# cubed, to the 4th power, to the 5th, etc. How would we go about doing so while
# still using the multiply method?

def multiply(num1, num2)
  num1 * num2
end

def square(num, exponent = 2)
  product = multiply(num, num)
  if exponent > 2
    (exponent - 2).times do
      product = multiply(product, num)
    end
  end
  product
end

puts square(5) == 25
puts square(-8) == 64
puts square(5, 3) == 125
puts square(7, 5) == 16_807
