# 1.
class BankAccount
  attr_reader :balance
  # this lets positive_balance? access the balance variable
  # through the getter method `balance`

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0 # @ is unnessecary since there is a reader method for balance
  end
end

# 2.
class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
    # this needs to refer to the instance variable @quantity or you need to
    # use attr_accessor and self.quantity
  end
end

# 3. Alan noticed that this will fail when update_quantity is called. Since
# quantity is an instance variable, it must be accessed with the @quantity
# notation when setting it. One way to fix this is to change attr_reader to
# attr_accessor and change quantity to self.quantity.
# Is there anything wrong with fixing it this way?

# Then the quantity variable would be accessible outside of the class
# without going through the protections in update_quantity.

# 4. Create a class called Greeting with a single method called greet that takes
# a string argument and prints that argument to the terminal.  Now create two
# other classes that are derived from Greeting: one called Hello and one called
# Goodbye. The Hello class should have a hi method that takes no arguments and
# prints "Hello". The Goodbye class should have a bye method to say "Goodbye".
# Make use of the Greeting class greet method when implementing the Hello and
# Goodbye classes - do not use any puts in the Hello or Goodbye classes.

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# 5. You are given the following class that has been implemented:

class KrispyKreme
  attr_reader :glazing, :filling_type

  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    # puts "glazing is #{@glazing}"
    filling_str = filling_type.nil? ? "Plain" : filling_type
    if glazing.nil?
      filling_str
    else
      "#{filling_str} with #{glazing}"
    end
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
# => "Plain"
puts donut2
# => "Vanilla"
puts donut3
# => "Plain with sugar"
puts donut4
# => "Plain with chocolate sprinkles"
puts donut5
# => "Custard with icing"

# 6. If we have these two methods:

# class Computer
#   attr_accessor :template
#
#   def create_template
#     @template = "template 14231"
#   end
#
#   def show_template
#     template
#   end
# end
# and
#
# class Computer
#   attr_accessor :template
#
#   def create_template
#     self.template = "template 14231"
#   end
#
#   def show_template
#     self.template
#   end
# end
# What is the difference in the way the code works?

# Results are identical, since the self is not necessary

# 7. How could you change the method name below so that the method name is more
# clear and less repetitive.

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.light_information
    # Change to `information` so you can call it with Light.information()
    "I want to turn on the light with a brightness level of super high and a " \
    "colour of green"
  end

end
