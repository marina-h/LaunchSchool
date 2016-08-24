# Write a method that takes two arguments: the first is the starting number, and
# the second is the ending number. Print out all numbers between the two
# numbers, except if a number is divisible by 3, print "Fizz", if a number is
# divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5,
# print "FizzBuzz".

def fizzbuzz(start, last)
  result = []
  start.upto(last) do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(', ')
end

def fizzbuzz_value(n)
  case
  when n % 3 == 0 && n % 5 == 0
    'FizzBuzz'
  when n % 5 == 0
    'Buzz'
  when n % 3 == 0
    'Fizz'
  else
    n
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8,
                # Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
