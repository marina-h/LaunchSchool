# Write a method that can rotate the last n digits of a number. Note that
# rotating just 1 digit results in the original number being returned.  You may
# use the rotate_array method from the previous exercise if you want.
# (Recommended!)

def rotate_array(arr)
  arr[1..-1].concat([arr[0]])
end

def rotate_rightmost_digits(n, digits)
  n_as_arr = n.to_s.split('')
  combined_arr = (n_as_arr[0...-digits] + rotate_array(n_as_arr[-digits..-1]))
  # alternative:
  # n_as_arr[-n..-1] = rotate_array(n_as_arr[-n..-1])
  combined_arr.join('').to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
p rotate_rightmost_digits(105, 3)
