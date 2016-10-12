# Write a method that takes an Array, and returns an Array of Arrays that
# represent the permutations of the original Array. The order of the
# permutations does not matter. You may not use the Array#permutations method
# nor any other standard method that is meant to generate permutations -- please
# devise your own way of generating the permutations.  For simplicity, you may
# assume that each element of the array has a unique value.

def permutations(arr)
  return [arr] if arr.length == 1
  results = []
  arr.each_with_index do |num, idx|
    rest_of_arr = arr[0...idx] + arr[(idx + 1)..-1]
    permutations(rest_of_arr).each do |permutation|
      results << [num] + permutation
    end
  end
  results
end

# def permutations(arr, idx_start, idx_end)
#   if idx_start == idx_end
#     p arr
#   else
#     (1...idx_end).each do |i|
#       arr[idx_start], arr[i] = arr[i], arr[idx_start]
#       permutations(arr, idx_start + 1, idx_end)
#       arr[idx_end], arr[i] = arr[i], arr[idx_start]
#     end
#   end
# end


# p permutations([2])
# -> [[2]]

# p permutations([1, 2])
# -> [[1, 2], [2, 1]]

p permutations([1, 2, 3])
# -> [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]

# p permutations([1, 2, 3, 4])
# -> [[1, 2, 3, 4], [1, 2, 4, 3], [1, 3, 2, 4],
#     [1, 3, 4, 2], [1, 4, 2, 3], [1, 4, 3, 2],
#     [2, 1, 3, 4], [2, 1, 4, 3], [2, 3, 1, 4],
#     [2, 3, 4, 1], [2, 4, 1, 3], [2, 4, 3, 1],
#     [3, 1, 2, 4], [3, 1, 4, 2], [3, 2, 1, 4],
#     [3, 2, 4, 1], [3, 4, 1, 2], [3, 4, 2, 1],
#     [4, 1, 2, 3], [4, 1, 3, 2], [4, 2, 1, 3],
#     [4, 2, 3, 1], [4, 3, 1, 2], [4, 3, 2, 1]]
