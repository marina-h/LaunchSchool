# 1. Create a superclass called Vehicle for your MyCar class to inherit from and
# move the behavior that isn't specific to the MyCar class to the superclass.
# Create a constant in your MyCar class that stores information about the
# vehicle that makes it different from other types of Vehicles. Then create a
# new class called MyTruck that inherits from your superclass that also has a
# constant defined that separates it from the MyCar class in some way.

# 2. Add a class variable to your superclass that can keep track of the number # of objects created that inherit from the superclass. Create a method to print
# out the value of this class variable as well.

# 3. Create a module that you can mix in to ONE of your subclasses that describes a behavior unique to that subclass.

# 4. Print to the screen your method lookup for the classes that you have
# created.

# 5. Move all of the methods from the MyCar class that also pertain to the
# MyTruck class into the Vehicle class. Make sure that all of your previous
# method calls are working when you are finished.

# 6. Write a method called age that calls a private method to calculate the age
# of the vehicle. Make sure the private method is not available from outside of
# the class. You'll need to use Ruby's built-in Time class to help.

module towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :model, :year
  @@number_of_vehicles = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def self.print_out_number_of_vehicles
    puts "There are #{@@number_of_vehicles} vehicles created so far."
  end

  def self.gas_milage(gallons, miles)
    puts "#{miles / gallons} miles per gallons of gas"
  end

  def age
    "Your #{self.model} is #{calculate_age} years old."
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

  private

  def calculate_age
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "A #{color} #{year} #{model} car moving at #{self.current_speed} mph."
  end
end

class MyTruck < Vehicle
  include towable
  NUMBER_OF_DOORS = 2

  def to_s
    "A #{color} #{year} #{model} truck moving at #{self.current_speed} mph."
  end
end

puts Vehicles.ancestors
puts MyCar.ancestors
puts MyTruck.ancestors

# 7. Create a class 'Student' with attributes name and grade. Do NOT make the
# grade getter public, so joe.grade will raise an error. Create a
# better_grade_than? method, that you can call like so... puts "Well done!" if
# joe.better_grade_than?(bob)

class Student
  def initialize(name, grade)
    @name = name
    @grade = grade.to_i
  end

  def better_grade_than?(other_student)
    if grade > other_student.grade # can access other student's grade
      puts "Well done!"
    else
      puts "Nope, sorry!"
    end
  end

  protected

  def grade
    @grade
  end
end

bob = Student.new('Bob', 80)
mary = Student.new('Mary', 90)

bob.better_grade_than?(mary) # "Nope, sorry!"

# 8. Given the following code...

# bob = Person.new
# bob.hi

# And the corresponding error message...

# NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
# from (irb):8
# from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'
# What is the problem and how would you go about fixing it?

# Answer - I could either move the hi method before the private declaration or add a public instance method that can access the private hi method.
