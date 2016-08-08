# Write a method that computes the sum of all numbers between 1 and some other
# number that are a multiple of 3 or 5. For instance, if the supplied number is
# 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).
# You may assume that the number passed in is an integer greater than 1.

def multisum(num)
  # 1.upto(num).to_a.select { |n| n % 3 == 0 || n % 5 == 0 }.reduce(:+)
  (1..num).select { |n| n % 3 == 0 || n % 5 == 0 }.reduce(:+)
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234_168
