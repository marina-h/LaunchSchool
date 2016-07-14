# Exercises: Medium 1
# Question 9

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Note: a kid is in the age range 0 - 17, an adult is in the
# range 18 - 64 and a senior is aged 65+.

def find_age_group(age)
  case age
  when 0..17
    "kid"
  when 18..64
    "adult"
  else
    "senior"
  end
end

munsters.each do |name, info|
  age = find_age_group(info["age"])
  info["age_group"] = age
end

p munsters
