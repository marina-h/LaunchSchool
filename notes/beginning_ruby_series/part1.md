# Notes from  Beginning Ruby live sessions + Watch Others Code

## Part 1

- () are optional for methods (eg. `puts("Hello")`) = syntactical sugar
- `puts` comes from the Kernel module
- methods names can be hidden (eg. `Bob.name = "Bob" is Bob.name=("Bob")`)
- local variables:
  - lower blocks can access variables in higher blocks
- variables have higher preference than methods with same name in same block level

## Part 2

- Methods create their own scope (can't access variables in other scopes)
```ruby
# within method:
var += "hi" # is a reassignment
var + "hi" # a method call: var.+('hi')
var << "hi" # a method that mutates the caller

# tricky:
def amethod(param)
  param += " universe"
  param << " world"
end

str = "hello"
amethod(str)
p str # "hello"
```
- variables point to objects (in memory), so
```ruby
a = "hi"
b = a # both a and b point to "hi": 2 variables, one object
a = "not here" # a REASSIGNMENT, so b is still "hi"
b << " world" # a is 'not here', b is 'hi world'
```
- Note: on rubydocs, :: are for class methods and # are for instance methods

## Part 3
- there are no primitive types in Ruby (unlike Java)
- when you use `something.each do ... end`, you are passing in the do/end block to .each like an anonymous function
- `hash.fetch(key)` is better than `hash[key]` since it throws error if key does not exist
- puts returns nil while `arr.each do...end` returns arr

- specific definition of 'arr.select':
  - returns a new array based on the block's *return value*. If it evaluates to true, then the element is selected. (eg. `n+1` is true for all values, puts is nil which is falsey)
  - Note: be precise about return value/side effect/output !!
```ruby
arr << hsh # last element in array is the hash
hsh[:f] = 6 # this will modify both hsh and the arr
```
- .any? and all? are all in Enumerable module of the Array and Hash classes

## Part 4
- try to run small parts of code as you go
```ruby
def balanced?(str)
  counter = 0
  str.chars.each do |char|
    counter += 1 if char == '('
    counter -= 1 if char == ')'
    return false if counter < 0
  end
  counter == 0
end
```

## Part 5

```ruby
def prime?(n)
  (1...n).to_a.each do |num|
    return false if n % num == 0
  end
  true
end

def find_primes(first, last)
  (first..last).select { |n| prime?(n) }.join(', ')
end

p find_primes(3, 10)
```

## Part 6
- Puts vs p:
  - p will print out empty arrays and hashes since it calls `.inspect` (puts will print nothing) with a newline
  - puts calls `to_s` on each array element
- `rand(20)` would give numbers between 0 and 19

## Watch others code
- `.each` returns the caller (such as a range)
```ruby
def substring(str, first, last = first)
  str[first..last]
end

def substrings(str)
  subs = []
  (0...str.length - 1).each do |i|
    (i + 1...str.length).each do |j|
      subs << str[i..j]
    end
  end
  subs
end

def palindromes(str)
  substrings(str).select do |substr|
    substr == substr.reverse
  end
end

def max_palindromes(str)
  palindromes(str).max_by { |substr| substr.length }
end

max_palindromes('ppop')
```

```ruby
WORDS_TO_NUMBERS = %w(zero one two three four five six seven eight nine).freeze

def convert_words_to_int(arr)
  arr.map do |num|
    WORDS_TO_NUMBERS.include?(num) ? WORDS_TO_NUMBERS.index(num) : num
  end
end

def do_operation(operation, num1, num2)
  case operation
  when 'plus' then num1 + num2
  when 'minus' then num1 - num2
  when 'divide' then num1 / num2
  when 'times' then num1 * num2
  end
end

def computer(english)
  english = english.gsub('divided by', 'divide')
  words = convert_words_to_int(english.split)
  current_val = words[0]
  operation = ''


  # words[1..-1].each do |word|
  #   if (0..9).cover?(word)
  #     if %w(times divide).include?(word)
  #       current_val = do_operation(operation, current_val, word)
  #     end
  #   else
  #     operation = word
  #   end
  # end
  #
  # words[1..-1].each do |word|
  #   if (0..9).cover?(word)
  #     current_val = do_operation(operation, current_val, word)
  #   else
  #     operation = word
  #   end
  # end
  # current_val
end

# p computer('two plus two plus three minus one plus three')
p computer('two times three divided by three')
```

```ruby
PHRASES = ['plus', 'minus', 'times', 'divided by'].freeze
NUMBERS = %w(zero one two three four five six seven eight nine).freeze

def mathphrase(num)
  phrase = []
  num.times do
    phrase << NUMBERS.sample
    phrase << PHRASES.sample
  end
  phrase << NUMBERS.sample
  phrase.join(' ')
end

p mathphrase(3)
```
