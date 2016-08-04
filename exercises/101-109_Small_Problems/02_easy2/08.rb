# Write a program that asks the user to enter an integer greater than 0, then
# asks if the user wants to determine the sum or product of all numbers between
# 1 and the entered integer.

def ask_for_integer
  int = 0
  loop do
    int = gets.to_i
    break if int > 0
    puts 'Please enter a valid number.'
  end
  int
end

def ask_for_operation
  op = ''
  loop do
    op = gets.chomp.downcase
    break if %w(s p).include?(op)
    puts 'Please enter a valid answer.'
  end
  op
end

puts '>> Please enter an integer greater than 0:'
int = ask_for_integer
puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = ask_for_operation

loop do
  if operation == 's'
    sum = (1..int).reduce(:+)
    puts "The sum of the integers between 1 and #{int} is #{sum}."
    break
  elsif operation == 'p'
    product = (1..int).reduce(:*)
    puts "The product of the integers between 1 and #{int} is #{product}."
    break
  else
    puts "Please enter 's' or 'p'."
  end
end

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.
#
#
# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.
