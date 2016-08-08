# Write a method that takes a year as input and returns the century. The return
# value should be a string that begins with the century number, and ends with
# st, nd, rd, or th as appropriate for that number.  New centuries begin in
# years that end with 01. So, the years 1901-2000 comprise the 20th century.

def century_name_ending(number)
  if number[-2] == '1' # 10-19 are last two digits
    'th'
  else
    case number[-1]
    when '0', '4', '5', '6', '7', '8', '9' then 'th'
    when '1' then 'st'
    when '2' then 'nd'
    when '3' then 'rd'
    end
  end
end

def century(year)
  number = (((year - 1) / 100) + 1).to_s
  "#{number}#{century_name_ending(number)}"
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10_103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11_201) == '113th'
