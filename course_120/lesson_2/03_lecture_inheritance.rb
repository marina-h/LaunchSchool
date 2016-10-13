# 1. Given this class:

# class Dog
#   def speak
#     'bark!'
#   end
#
#   def swim
#     'swimming!'
#   end
# end
#
# teddy = Dog.new
# puts teddy.speak          # => "bark!"
# puts teddy.swim           # => "swimming!"

# One problem is that we need to keep track of different breeds of dogs, since
# they have slightly different behaviors. For example, bulldogs can't swim, but
# all other dogs can.

# Create a sub-class from Dog called Bulldog overriding the swim method to
# return "can't swim!"

# class Bulldog < Dog
#   def swim
#     "can't swim!"
#   end
# end
#
# karl = Bulldog.new
# puts karl.speak           # => "bark!"
# puts karl.swim            # => "can't swim!"

# 2. Let's create a few more methods for our Dog class.

# class Dog
#   def speak
#     'bark!'
#   end
#
#   def swim
#     'swimming!'
#   end
#
#   def run
#     'running!'
#   end
#
#   def jump
#     'jumping!'
#   end
#
#   def fetch
#     'fetching!'
#   end
# end

# Create a new class called Cat, which can do everything a dog can, except swim
# or fetch. Assume the methods do the exact same thing. Hint: don't just copy
# and paste all methods in Dog into Cat; try to come up with some class
# hierarchy.

class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < Pet
  def speak
    'meow!'
  end
end

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

puts pete.run                # => "running!"
# puts pete.speak              # => NoMethodError

puts kitty.run               # => "running!"
puts kitty.speak             # => "meow!"
# puts kitty.fetch             # => NoMethodError

puts dave.speak              # => "bark!"

puts bud.run                 # => "running!"
puts bud.swim                # => "can't swim!"

# 3. Draw a class hierarchy diagram of the classes from step #2

# Pet (run, jump) -> Dog (speak, fetch, swim) -> Bulldog (swim)
#                 -> Cat (speak)

# 4. What is the method lookup path and how is it important?

# The method loopup path is the class hierarchy in which Ruby will look for
# method names to invoke. You can use the .ancestors method to check the path:
p Bulldog.ancestors
# => [Bulldog, Dog, Pet, Object, Kernel, BasicObject]
