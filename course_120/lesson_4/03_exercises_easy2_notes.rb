# 1. You are given the following code:
# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end
#
#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end
# What is the result of calling
#
# oracle = Oracle.new
# oracle.predict_the_future # returns sentence, but doesn't print it out

# 2. We have an Oracle class and a RoadTrip class that inherits from the Oracle
# class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end
What is the result of the following:

trip = RoadTrip.new
trip.predict_the_future # uses the choices instance method from RoadTrip

# 3. How do you find where Ruby will look for a method when that method is
# called? How can you find an object's ancestors?
#
# module Taste
#   def flavor(flavor)
#     puts "#{flavor}"
#   end
# end
#
# class Orange
#   include Taste
# end
#
# class HotSauce
#   include Taste
# end
# What is the lookup chain for Orange and HotSauce?

# >> HotSauce.ancestors
# => [HotSauce, Taste, Object, Kernel, BasicObject]

# 4. What could you add to this class to simplify it and remove two methods from
# the class definition while still maintaining the same functionality?

# class BeesWax
#   # attr_accessor :type
#   def initialize(type)
#     @type = type
#   end
#
#   def type
#     @type
#   end
#
#   def type=(t)
#     @type = t
#   end
#
#   def describe_type
#     puts "I am a #{@type} of Bees Wax" # also, this doesn't need the @ since
#                                        # is an instance variable in the class
#   end
# end

# 5. There are a number of variables listed below. What are the different types
# and how do you know which is which?

# excited_dog = "excited dog" - local
# @excited_dog = "excited dog" - instance
# @@excited_dog = "excited dog" - class

# 6. If I have the following class:
#
# class Television
#   def self.manufacturer <<<
#     # method logic
#   end
#
#   def model
#     # method logic
#   end
# end
# Which one of these is a class method (if any) and how do you know? How would
# you call a class method?

# 7. If we have a class such as the one below:
#
# class Cat
#   @@cats_count = 0
#
#   def initialize(type)
#     @type = type
#     @age  = 0
#     @@cats_count += 1
#   end
#
#   def self.cats_count
#     @@cats_count
#   end
# end
# Explain what the @@cats_count variable does and how it works. What code would
# you need to write to test your theory?

# 10. What are the benefits of using Object Oriented Programming in Ruby? Think
# of as many as you can.

# Namespacing - can group together methods and variables for related topics
# Black box - don't have to know the implementation details
# Easier to understand if methods / classes are named clearly (abstractly)
# Can re-use code easily
