# Exercises: Medium 1
# Question 5

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

# Bonus 1
# The number % dividend == 0 checks if the number can be divided by the
# dividend without a remainder.
# Bonus 2
# The second-to-last line returns the divisors array.
