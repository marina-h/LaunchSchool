# Write a method named include? that takes an Array and a search value as
# arguments. This method should return true if the search value is in the array,
# false if it is not. You may not use the Array#include? method in your
# solution.

def include?(arr, search_val)
  # arr.each { |e| return true if e == search_val }
  # false
  arr.count(search_val) > 0
  # or:
  # arr.any? { |i| i == val }
end

p include?([1, 2, 3, 4, 5], 3) == true
p include?([1, 2, 3, 4, 5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
