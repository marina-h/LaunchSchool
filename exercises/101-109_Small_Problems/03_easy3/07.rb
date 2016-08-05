# Write a method that returns an Array that contains every other element of an
# Array that is passed in as an argument. The values in the returned list should
# be those values that are in the 1st, 3rd, 5th, and so on elements of the
# argument Array.

def oddities(arr)
  odds = []
  arr.each_index { |i| odds << arr[i] if i.even? }
  odds
end

def oddities2(arr)
  odds = []
  0.step(arr.length - 1, 2) { |i| odds << arr[i] }
  odds
end

p oddities2([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities2(['abc', 'def']) == ['abc']
p oddities2([123]) == [123]
p oddities2([]) == []
