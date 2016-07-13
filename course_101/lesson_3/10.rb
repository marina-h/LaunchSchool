# Exercises: Easy 1
# Question 10

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_with_index = {}

flintstones.each_with_index do |name, index|
  flintstones_with_index[name] = index
end

p flintstones_with_index
