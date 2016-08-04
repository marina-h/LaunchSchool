# Write a method that counts the number of occurrences of each element in a
# given array.

def count_occurrences(arr)
  counts = {}
  arr.uniq.each do |element|
    counts[element] = arr.count(element)
  end
  counts.each do |element, count|
    puts "#{element} => #{count}"
  end
end

# alternate way that only iterates through array once
def count_occurrences_improved(arr)
  counts = Hash.new { |h, k| h[k] = 0 }
  arr.each { |element| counts[element] += 1 }
  counts.each { |element, count| puts "#{element} => #{count}" }
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle',
            'motorcycle', 'car', 'truck']

count_occurrences(vehicles)
puts '----------------------'
count_occurrences_improved(vehicles)
