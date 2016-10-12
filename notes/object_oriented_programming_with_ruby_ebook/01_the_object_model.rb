# 1. How do we create an object in Ruby? Give an example of the creation of an
# object.

# We create an instance of an object by using the .new() method on a class,
# such as Hash.new(). We create a class by using the Class keyword with a class
# name written in SnakeCase.

# 2. What is a module? What is its purpose? How do we use them with our classes?
# Create a module for the class you created in exercise 1 and include it
# properly.

# Modules allow us to mixin methods into classes using the `include` keyword.

module Repeat
  def repeat_word(word)
    puts word.to_s
  end
end

class Computer
  include Repeat
end

# They can also be used to create namespaces for classes of the same name:
module Outer
  class Computer
    ### use this class by calling Outer::Computer.new
  end
end

macbook = Computer.new
macbook.repeat_word('hello')
