# Exercises: Easy 2
# Question 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if { |_, age| age > 100 }
# or
# ages.keep_if { |_, age| age < 100 }

p ages
