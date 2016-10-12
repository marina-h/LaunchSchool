# 1. Given the below usage of the Person class, code the class definition.
#
# bob = Person.new('bob')
# bob.name                  # => 'bob'
# bob.name = 'Robert'
# bob.name                  # => 'Robert'

# class Person
#   attr_accessor :name
#
#   def initialize(name)
#     @name = name
#   end
# end

# 2. Modify the class definition from above to facilitate the following methods. Note that there is no name= setter method now.
#
# bob = Person.new('Robert')
# bob.name                  # => 'Robert'
# bob.first_name            # => 'Robert'
# bob.last_name             # => ''
# bob.last_name = 'Smith'
# bob.name                  # => 'Robert Smith'

# class Person
#   attr_accessor :first_name, :last_name
#
#   def initialize(first_name, last_name = '')
#     @first_name = first_name
#     @last_name = last_name
#   end
#
#   def name
#     "#{@first_name} #{@last_name}".strip
#   end
# end

# 3. Now create a smart name= method that can take just a first name or a full name, and knows how to set the first_name and last_name appropriately.
#
# bob = Person.new('Robert')
# bob.name                  # => 'Robert'
# bob.first_name            # => 'Robert'
# bob.last_name             # => ''
# bob.last_name = 'Smith'
# bob.name                  # => 'Robert Smith'
#
# bob.name = "John Adams"
# bob.first_name            # => 'John'
# bob.last_name             # => 'Adams'

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  private

  def parse_full_name(full_name)
    name_parts = full_name.split
    self.first_name = name_parts.first
    self.last_name = name_parts.size > 1 ? name_parts.last : ''
  end
end

# 4. Using the class definition from step #3, let's create a few more people -- that is, Person objects.
#
# bob = Person.new('Robert Smith')
# rob = Person.new('Robert Smith')
# If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
puts bob.name == rob.name
# or add instance method for == operator

# 5. Continuing with our Person class definition, what does the below print out?
#
bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
# => The person's name is: #<Person:0x007f9c170359c0>
# You would have to use string concatenation such as:
# "The person's name is: " + bob.name

# Let's add a to_s method to the class:
#
# class Person
#   # ... rest of class omitted for brevity
#
#   def to_s
#     name
#   end
# end
# Now, what does the below output?

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def to_s
    name
  end

  private

  def parse_full_name(full_name)
    name_parts = full_name.split
    self.first_name = name_parts.first
    self.last_name = name_parts.size > 1 ? name_parts.last : ''
  end
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
# => The person's name is: Robert Smith
