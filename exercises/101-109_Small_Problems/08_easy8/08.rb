# Write a method that takes a string, and returns a new string in which every
# consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and
# whitespace should not be doubled.

def double_consonants(str)
  str = str.split('').map do |s|
    if s =~ /[a-zA-Z]/
      %w(a e i o u).include?(s) ? s : s * 2
    else
      s
    end
  end
  str.join
  # alternative:
  # ALLOWED_CHARS = %w(b c d f g h j k l m n p q r s t v w x y z)
  # str.chars.map {|chr| ALLOWED_CHARS.include?(chr.downcase) ? chr * 2 : chr}
  # .join()
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
