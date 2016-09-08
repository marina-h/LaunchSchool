# Write a method that takes a string as argument, and returns true if all
# parentheses in the string are properly balanced, false otherwise. To be
# properly balanced, parentheses must occur in matching '(' and ')' pairs.

def balanced?(str)
  parens_only = str.delete('^()')
  while parens_only =~ /\(\)/
    index = parens_only =~ /\(\)/
    parens_only = parens_only[0...index] + parens_only[index + 2..-1]
  end
  parens_only.empty?
end

  # check by using +1 and -1
  # def balanced?(string)
  #   parens = 0
  #   string.each_char do |char|
  #     parens += 1 if char == '('
  #     parens -= 1 if char == ')'
  #     break if parens < 0
  #   end
  #
  #   parens.zero?
  # end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
