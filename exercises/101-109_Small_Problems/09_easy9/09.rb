# Write a method that determines the mean (average) of the three scores passed
# to it, and returns the letter value associated with that grade.  Numerical
# Score Letter Grade 90 <= score <= 100 'A' 80 <= score < 90 'B' 70 <= score <
# 80 'C' 60 <= score < 70 'D' 0 <= score < 60 'F'  Tested values are all between
# 0 and 100. There is no need to check for negative values or values greater
# than 100.

def get_grade(score1, score2, score3)
  avg = (score1 + score2 + score3) / 3
  case avg
  when 90..100 then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  when 0...60 then 'F'
  else 'A+'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
