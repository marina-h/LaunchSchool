# Write a method that combines two Arrays passed in as arguments, and returns a
# new Array that contains all elements from both Array arguments, with the
# elements taken in alternation.  You may assume that both input Arrays are
# non-empty, and that they have the same number of elements.

def interleave(arr1, arr2)
  # new_arr = []
  # (0...arr1.length).each do |i|
  #   new_arr << arr1[i]
  #   new_arr << arr2[i]
  # end
  # alternative:
  # array1.each_with_index do |element, index|
  #   new_arr << element << array2[index]
  # end
  # new_arr
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], %w(a b c)) == [1, 'a', 2, 'b', 3, 'c']
