# Write a method that displays an 8-pointed star in an nxn grid where n is an
# odd integer that is supplied as an argument to the method. The smallest such
# star you need to handle is a 7x7 grid.

require 'pry'

def make_line(num_asterisks, num_spaces, width)
  ('*' * num_asterisks).split('').join(' ' * num_spaces).center(width)
end

def star(n)
  picture = []
  half_height = n / 2

  half_height.downto(1).each { |i| picture << make_line(3, i - 1, n) }
  picture << make_line(n, 0, n)
  1.upto(half_height).each { |i| picture << make_line(3, i - 1, n) }

  puts picture
end

star(7)
#
# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *

puts '----------'

star(9)
# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *
