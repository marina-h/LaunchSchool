# 6. Walk-through: Calculator

# Ask the user for two numbers
puts "Type in two numbers:"
puts "Number 1 is: "
num1 = gets.chomp.to_f
puts "Number 2 is: "
num2 = gets.chomp.to_f

# ask which operation to perform
puts "\nWhich operation should I perform? Please type in the number:"
puts "1. Addition"
puts "2. Subtraction"
puts "3. Multiplication"
puts "4. Division"
user_choice = gets.chomp.to_i
puts ""

# output result of operation
case user_choice
when 1
  puts "The answer is " + (num1 + num2).to_s + "!"
when 2
  puts "The answer is " + (num1 - num2).to_s + "!"
when 3
  puts "The answer is " + (num1 * num2).to_s + "!"
when 4
  # if user attempts to divide by 0, output a warning
  if num2 != 0
    puts "The answer is " + (num1 / num2).to_s + "!"
  else
    puts "You can't divide by 0!"
  end
else
  puts "You didn't choose one of the choices!"
end
