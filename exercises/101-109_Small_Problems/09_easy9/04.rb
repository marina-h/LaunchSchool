# Write a method that takes an integer argument, and returns an Array of all
# integers, in sequence, between 1 and the argument.  You may assume that the
# argument will always be a valid integer that is greater than 0.

def sequence(int)
  int > 0 ? 1.upto(int).to_a : int.upto(1).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-2) == [-2, -1, 0, 1]
