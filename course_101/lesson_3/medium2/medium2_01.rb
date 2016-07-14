# Exercises: Medium 2
# Question 1

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

total_age_males = 0
munsters.each do |name, info|
  total_age_males += info["age"] if info["gender"] == "male"
end

puts total_age_males
