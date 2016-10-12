# Write a method that takes an Array, and returns a new Array with the elements
# of the original list in reverse order. Do not modify the original list.  You
# may not use Array#reverse or Array#reverse!, nor may you use the method you
# wrote in the previous exercise.

def reverse(arr)
  # reversed_arr = []
  # arr.each { |element| reversed_arr.unshift(element) }
  # reversed_arr
  # arr.inject([]) { |new_array, elem| new_array.unshift(elem) }
  # alternative:
  1.upto(arr.length).map { |i| arr[-i] }
end

p reverse([1, 2, 3, 4]) == [4, 3, 2, 1]    # => true
p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1]                 # => true
