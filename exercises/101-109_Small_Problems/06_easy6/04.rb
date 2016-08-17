# Write a method that takes an Array as an argument, and reverses its elements
# in place; that is, mutate the Array passed in to this method. The return value
# should be the same Array object.
# You may not use Array#reverse or Array#reverse!.

def reverse!(arr)
  arr_copy = arr.slice(0..-1)
  arr.delete_if { |e| e }
  arr.push(arr_copy.pop) until arr_copy.empty?
  arr

  # alternatives:
  # list.each_with_index do |value, index|
  #   list.insert(index, list.pop)
  # end
  # list

  # left_index = 0
  # right_index = -1
  # while left_index < array.size / 2
  #   array[left_index], array[right_index] = array[right_index], array[left_index]
  #   left_index += 1
  #   right_index -= 1
  # end
  # array
end

list = [1, 2, 3, 4]
result = reverse!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
p list == ["abc"]

list = []
reverse!([]) # => []
p list == []
