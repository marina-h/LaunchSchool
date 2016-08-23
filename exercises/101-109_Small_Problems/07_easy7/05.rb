# Write a method that takes a String as an argument, and returns a new String
# that contains the original value using a staggered capitalization scheme in
# which every other character is capitalized, and the remaining characters are
# lowercase. Characters that are not letters should not be changed, but count as
# characters when switching between upper and lowercase.

def staggered_case(str, upcase_first = true)
  downcased = str.downcase.chars
  if upcase_first
    downcased.each_with_index { |char, i| char.upcase! if i.even? }.join
  else
    downcased.each_with_index { |char, i| char.upcase! if i.odd? }.join
  end
  # or:
  # str.chars.map
  # .with_index { |char, i| i.even? ? char.upcase : char.downcase }.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
p staggered_case('I Love Launch School!', false) == 'i lOvE LaUnCh sChOoL!'
