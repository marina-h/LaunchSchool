# Write a method that takes a positive integer as an argument and returns that
# number with its digits reversed.

def reversed_number(int)
  int.to_s.reverse.to_i
end

p reversed_number(12_345) == 54_321
p reversed_number(12_213) == 31_221
p reversed_number(456) == 654
p reversed_number(12_000) == 21 # Note that zeros get dropped!
p reversed_number(1) == 1
