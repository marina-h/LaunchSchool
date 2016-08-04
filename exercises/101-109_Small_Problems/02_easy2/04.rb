# Build a program that displays when the user will retire and how many years she
# has to work till retirement.

CURRENT_YEAR = Time.now.year

puts 'What is your age?'
age = gets.to_i
puts 'At what age would you like to retire?'
retirement_age = gets.to_i

retirement_year = CURRENT_YEAR + (retirement_age - age)
years_left = retirement_year - CURRENT_YEAR

puts "It's 2016. You will retire in #{retirement_year}."
puts "You have only #{years_left} years of work to go!"

# What is your age? 30
# At what age would you like to retire? 70
#
# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!
