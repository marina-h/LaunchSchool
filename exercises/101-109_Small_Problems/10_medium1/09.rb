# Rewrite your recursive fibonacci method so that it computes its results
# without recursion.

def fibonacci(nth)
  return 1 if nth <= 2
  first, last = [1, 1]
  (3..nth).each do
    # third = first + second
    # first = second
    # second = third
    # shorter:
    first, last = [last, first + last]
  end
  last
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501
