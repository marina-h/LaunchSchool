# Write a program that solicits 6 numbers from the user, then prints a message
# that describes whether or not the 6th number appears amongs the first 5
# numbers.

def number_to_string(num)
  case num
  when 1 then '1st'
  when 2 then '2nd'
  when 3 then '3rd'
  when 4, 5 then num.to_s + 'th'
  when 6 then 'last'
  end
end

numbers = []

6.times do |n|
  puts "Enter the #{number_to_string(n + 1)} number:"
  answer = gets.to_i
  numbers.push(answer)
end

last_num = numbers.pop

if numbers.include?(last_num)
  puts "The number #{last_num} appears in #{numbers}."
else
  puts "The number #{last_num} does not appear in #{numbers}."
end

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].
#
# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].
