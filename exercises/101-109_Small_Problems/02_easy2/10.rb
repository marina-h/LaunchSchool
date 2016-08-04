array1 = %w(Moe Larry Curly Chemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C') }
puts array2

# array2 contains the modified strings because the contents of the array are
# references to the contents of array1.
