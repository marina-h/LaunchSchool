# Write a method that displays a 4-pointed diamond in an n x n grid, where n is
# an odd integer that is supplied as an argument to the method. You may assume
# that the argument will always be an odd integer.

def diamond(n)
  puts ''
  (1..n - 1).step(2) { |i| puts ('*' * i).center(n) }
  (-n..0).step(2) { |i| puts ('*' * -i).center(n) }
end

# example of diamond with only outlines
def diamond_outline(size)
  diamond = []
  # upper part
  1.upto(size - 1) do |index|
    diamond << '*' if index == 1
    diamond << '*' + ' ' * index + '*' if index.odd?
  end
  # lower part
  diamond[0..-2].reverse.each { |line| diamond << line }
  # display array centering lines
  diamond.each { |line| puts line.center(size) }
end

diamond(1)

# *

diamond(3)

#  *
# ***
#  *

diamond(9)
#
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

diamond_outline(9)
