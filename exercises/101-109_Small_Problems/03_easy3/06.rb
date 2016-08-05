# In this exercise, you will write a method named xor that takes two arguments,
# and returns true if exactly one of its arguments is true, false otherwise.

def xor?(arg1, arg2)
  (arg1 && !arg2) || (!arg1 && arg2)
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false
