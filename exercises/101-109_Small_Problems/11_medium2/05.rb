# A triangle is classified as follows:
# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length

# To be a valid triangle, the sum of the lengths of the two shortest sides must
# be greater than the length of the longest side, and all sides must have
# lengths greater than 0: if either of these conditions is not satisfied, the
# triangle is invalid.  Write a method that takes the lengths of the 3 sides of
# a triangle as arguments, and returns a symbol :equilateral, :isosceles,
# :scalene, or :invalid depending on whether the triangle is equilateral,
# isosceles, scalene, or invalid.

def num_same_sides(sides_arr)
  sides_arr.map { |side| sides_arr.count(side) }.max
end

def triangle(s1, s2, s3)
  sorted_sides = [s1, s2, s3].sort
  if sorted_sides.any? { |side| side <= 0 } ||
     sorted_sides[0] + sorted_sides[1] < sorted_sides[2]
    return :invalid
  elsif num_same_sides(sorted_sides) == 3
    return :equilateral
  elsif num_same_sides(sorted_sides) == 2
    return :isosceles
  else
    return :scalene
  end

  # alternative:
  # case
  # when 2 * largest_side > sides.reduce(:+), sides.include?(0)
  #   :invalid
  # when side1 == side2 && side2 == side3
  #   :equilateral
  # when side1 == side2 || side1 == side3 || side2 == side3
  #   :isosceles
  # else
  #   :scalene
  # end
end

# sorted_sides.any? { |side| side <= 0 } ||

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
