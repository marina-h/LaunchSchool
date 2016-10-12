# Merge sort is a recursive sorting algorithm that works by breaking down the
# array elements into nested sub-arrays, then recombining those nested
# sub-arrays in sorted order.

def merge(arr1, arr2)
  merged = []
  num1_idx = num2_idx = 0
  final_length = arr1.length + arr2.length
  loop do
    if arr1[num1_idx].nil?
      merged << arr2[num2_idx]
      num2_idx += 1
    elsif arr2[num2_idx].nil?
      merged << arr1[num1_idx]
      num1_idx += 1
    elsif arr1[num1_idx] < arr2[num2_idx]
      merged << arr1[num1_idx]
      num1_idx += 1
    else
      merged << arr2[num2_idx]
      num2_idx += 1
    end
    break if merged.length == final_length
  end
  merged
end

def sort_two(arr)
  return arr if arr.length == 1
  if arr[0] <= (arr[1] || [])
    [arr[0], arr[1]]
  else
    [arr[1], arr[0]]
  end
end

def merge_sort(arr)
  sub_arrays = []
  arr.each_slice(2) { |sub_array| sub_arrays << sort_two(sub_array) }
  merged = []
  loop do
    until sub_arrays.empty?
      arr1 = sub_arrays.shift
      arr2 = sub_arrays.shift || []
      merged << merge(arr1, arr2)
    end
    break if merged.length == 1
    sub_arrays = merged[0..-1]
    merged = []
  end
  merged[0]
end

# recursive:
# def merge_sort(array)
#   return array if array.size == 1
#
#   sub_array_1 = array[0...array.size / 2]
#   sub_array_2 = array[array.size / 2...array.size]
#
#   sub_array_1 = merge_sort(sub_array_1)
#   sub_array_2 = merge_sort(sub_array_2)
#
#   merge(sub_array_1, sub_array_2)
# end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) ==
  %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) ==
  [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
