# Write a method that takes a string as an argument and returns a new string in
# which every uppercase letter is replaced by its lowercase version, and every
# lowercase letter by its uppercase version. All other characters should be
# unchanged.

def swap(char)
  if char.include?(char.upcase)
    # or char =~ /[A-Z]/
    char.downcase
  elsif char.include?(char.downcase)
    char.upcase
  else
    char
  end
end

def swapcase(str)
  str.chars.map { |char| swap(char) }.join('')
  # alternative:
  # string.chars.map { |l| l == l.downcase ? l.upcase : l.downcase}.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
