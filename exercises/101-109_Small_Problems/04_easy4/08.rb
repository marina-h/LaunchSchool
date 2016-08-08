# In the previous exercise, you developed a method that converts simple numeric
# strings to Integers. In this exercise, you're going to extend that method to
# work with signed numbers.  Write a method that takes a String of digits, and
# returns the appropriate number as an integer. The String may have a leading +
# or - sign; if the first character is a +, your method should return a positive
# number; if it is a -, your method should return a negative number. If no sign
# is given, you should return a positive number.  You may assume the string will
# always contain a valid number.  You may not use any of the standard conversion
# methods available in Ruby, such as String#to_i, Integer(), etc. You may,
# however, use the string_to_integer method from the previous lesson.

def string_to_integer(str)
  str.chars.map { |chr| chr.ord - 48 }.reduce { |a, e| (a * 10) + e }
end

# def string_to_signed_integer(str)
#   sign = ''
#   if %w(- +).include?(str[0])
#     sign = str[0]
#     str = str[1..-1]
#   end
#   integer = string_to_integer(str)
#   return integer * -1 if sign == '-'
#   integer
# end

def string_to_signed_integer(str)
  if %w(- +).include?(str[0])
    sign = str[0]
    str = str[1..-1]
  end

  return -string_to_integer(str) if sign == '-'
  string_to_integer(str)
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
