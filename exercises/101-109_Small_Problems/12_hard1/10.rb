# Write two methods: one that takes a Rational number as an argument, and
# returns an Array of the denominators that are part of an Egyptian Fraction
# representation of the number, and another that takes an Array of numbers in
# the same format, and calculates the resulting Rational number. You will need
# to use the Rational class provided by Ruby.

def egyptian(rational_n)
  denominators = []
  next_denom = 1
  loop do
    denominators << next_denom
    sum = denominators.reduce(Rational(0)) do |accum, denom|
            accum + Rational(1, denom)
          end
    break if sum == rational_n
    denominators.pop if sum > rational_n
    next_denom += 1
  end
  denominators
end

def unegyptian(denominators)
  denominators.map! { |d| Rational(1, d) }.reduce(:+)
  # or use reduce/inject
  # denominators.inject(Rational(0)) do |accum, denominator|
  #  accum + Rational(1, denominator)
  # end
end

p egyptian(Rational(2, 1)) # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
# p egyptian(Rational(3, 1))
# -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
