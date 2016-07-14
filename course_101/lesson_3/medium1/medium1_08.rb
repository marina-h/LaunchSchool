# Exercises: Medium 1
# Question 8

def titleize(str)
  str.split.map { |word| word.capitalize }.join(" ")
end

puts titleize("this is a title that should be titleized")
