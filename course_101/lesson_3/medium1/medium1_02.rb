# Exercises: Medium 1
# Question 2

statement = "The Flintstones Rock"
#
frequencies = {}

letters_in_statement = statement.split("").uniq
letters_in_statement.delete(" ")
letters_in_statement.each do |letter|
  frequencies[letter] = statement.count(letter)
end
