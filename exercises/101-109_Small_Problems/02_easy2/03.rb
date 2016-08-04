# Create a simple tip calculator. The program should prompt for a bill amount
# and a tip rate. The program must compute the tip and then display both the tip
# and the total amount of the bill.

puts 'What is the bill?'
bill = gets.to_f
puts 'What is the tip percentage?'
tip_rate = gets.to_f / 100

tip_amount = bill * tip_rate
total_bill = bill + tip_amount

puts format('The tip is $%.2f', tip_amount)
puts format('The total is $%.2f', total_bill)

# What is the bill? 200
# What is the tip percentage? 15
#
# The tip is $30.00
# The total is $230.00
