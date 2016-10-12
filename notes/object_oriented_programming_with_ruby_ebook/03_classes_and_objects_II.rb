# 1. Add a class method to your MyCar class that calculates the gas mileage of
# any car.

class MyCar
  attr_accessor :color, :model, :current_speed
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def self.gas_milage(gallons, miles)
    puts "#{miles / gallons} miles per gallons of gas"
  end

  def speed_up
    self.current_speed += 5
  end

  def brake
    self.current_speed -= 5
  end

  def shut_off
    self.current_speed = 0
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

  def to_s
    "A #{color} #{year} #{model} moving at #{self.current_speed} mph."
  end
end

MyCar.gas_milage(20, 300)

# 2. Override the to_s method to create a user friendly print out of your
# object.

mycar = MyCar.new('2010', 'Ford Focus', 'green')
puts mycar

# 3. When running the following code...
#
# class Person
#   attr_reader :name
#   def initialize(name)
#     @name = name
#   end
# end

# bob = Person.new("Steve")
# bob.name = "Bob"
# We get the following error...
#
# test.rb:9:in `<main>': undefined method `name=' for
#   #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)
# Why do we get this error and how to we fix it?

# We get this error since we used the attr_reader method instead of attr_writer
# or attr_accessor, which would allow the code to use the Person.name=() method.
