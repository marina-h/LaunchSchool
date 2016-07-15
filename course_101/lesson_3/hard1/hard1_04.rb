# Exercises: Hard 1
# Question 4

# Write a method that returns one UUID when called with no parameters.

HEX_VALUES = (1..9).to_a.concat(("a".."f").to_a)

def make_hex_string(length)
  HEX_VALUES.sample(length).join("")
end

def make_uuid
  make_hex_string(8) + "-" + make_hex_string(4) + "-" +
    make_hex_string(4) + "-" + make_hex_string(12)
end

puts make_uuid
puts make_uuid
