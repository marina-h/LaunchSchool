# Exercises: Medium 2
# Question 5

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# This returns 34, since the variable answer is still 42.
