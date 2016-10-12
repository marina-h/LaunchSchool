## Study guide for Part 1 of 109 Assessment

#### local variable scope, especially how local variables interact with blocks and methods
- Note: look at Beginning Ruby Notes
- variables point to objects in physical locations in memory
  - variables that point to array points to the 'array' object, not the contents
```ruby
a=[1,2]
=> [1, 2]
a.object_id
=> 70195964291520
a << 3
=> [1, 2, 3]
a.object_id
=> 70195964291520
```
- methods like `!` and `<<` mutates the caller (value in memory)
```ruby
def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a) # returns array with new strings, but doesn't print anything
        # a is still ['a', 'b', 'c']
```
- Inner scope can access variables initialized in an outer scope, but not vice versa
  - scopes are usually created in `{}` or `do/end` immediately after a method invocation (eg. not after `for i in arr do/end`)
- methods create their **own scope** outside of execution flow (so variables created or reassigned within one is not accessible outside of the method)


#### how passing an object into a method can or cannot permanently change the object
-
#### working with collections (Array, Hash, String), and popular collection methods (each, map, select, etc). Study these methods carefully.
- `.map`: Returns a new array with the return value from running the block once for every element in enum
- `.select`: Returns an array containing all elements of enum for which the return value of the given block evaluates to  a truthy value (not necessarily `true`, but anything that's not `nil` or `false`).
- When used with a Hash instance select returns another Hash object
  - `{:a => 1, :b => 2}.select{ |k,v| v == 1 } #=> {:a => 1 }`
- `.each` **Returns the original object** (such as an array or hash) and also applies the block to each element.
```ruby
>> s = 'Hello'
=> "Hello"

>> s.object_id
=> 70101471465440

>> s += ' World'
=> "Hello World"

>> s
=> "Hello World"

>> s.object_id
=> 70101474966820
```
- Though it looks as if we are modifying s when we write s += ' World', we are actually creating a brand-new String with a new object id, and then binding s to that new object. We can see by looking at the object ids that a new object is created.
- index assignment (`arr[1] = 'one'`) mutates the caller (so object_id doesn't change)!
#### variables as pointers
#### puts vs return
- `puts` prints out string with newline `\n` and returns `nil`
- Ruby methods `return` result of last line
- `print` is like `puts` (returns nil) but without the newline
- `p` returns the object.inspect value, not `nil` (eg. `"joe"` if `p name = 'joe'`)
```ruby
1. x = 2    # => 2
2. puts x = 2    # nil
3. p name = "Joe"    # => "Joe"
4. four = "four"    # => "four"
5. print something = "nothing"    # => nil
```
#### false vs nil
- `false` and `nil` are the only falsey values in Ruby
- `nil` and `""` won't output anything when using `puts` (but `.inspect` works)
#### implicit return value of methods and blocks

#### other notes:
- Ruby uses short-circuit evaluation, so the first value that determines whether the `&&`, `||`, or `if` statement is true or false is returned
```ruby
hash = {1 => 'foo', 2 => 'bar'}
puts "hash[1] is #{hash[1].inspect}"
puts "hash[2] is #{hash[2].inspect}"
puts "hash[1 && 2] is #{hash[1 && 2].inspect} because 1 && 2 evaluates to 2 and hash[2] is #{hash[2].inspect}"
# => hash[1 && 2] is "bar" because 1 && 2 evaluates to 2 and hash[2] is "bar"

# using case statements
case num
when 0..50
  puts "Between 0 and 50"
when 51..100
  puts "Between 51 and 100"
end

# hashes
x = "hi there"
my_hash = {x: "some value"}    # key is :x
my_hash2 = {x => "some value"} # key is 'hi there'

# order is preserved, but doesn't matter for equality
hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}

hash1 == hash2 # true
```
