# Write a program that prompts the user for two positive integers, and then
# prints the results of the following operations on those two numbers: addition,
# subtraction, product, quotient, remainder, and power. Do not worry about
# validating the input.

def prompt(msg)
  puts "==> #{msg}"
end

prompt('Enter the first number:')
first = gets.to_i
prompt('Enter the second number:')
second = gets.to_i

operations = %w(+ - * / % **)

operations.each do |op|
  prompt("#{first} #{op} #{second} = #{first.method(op).call(second)}")
end

# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103
