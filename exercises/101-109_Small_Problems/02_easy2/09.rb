name = 'Bob'
save_name = name
name.upcase!
puts name, save_name
# BOB
# BOB

# This is printed because name and save_name both refer to the same object,
# and name.upcase! mutates the string in place to BOB.
