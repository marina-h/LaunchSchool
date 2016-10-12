## Notes for Object Oriented Programming with Ruby ebook

- **Encapsulation** hides details of functionality inside objects and exposes interfaces (methods) so the rest of the code can interact with it.
- **Polymorphism** results when you use the same code (classes, modules) for different purposes
- Classes can inherit from **superclasses**. **Subclasses** can inherit from basic classes.
- **Modules** cannot create objects, but make behaviors within the module available to classes (**mixin**) using `include`.
- Instance variables -> keep track of state (scoped at object level)
  - Example `@name` within the constructor (such as the `initialize` method), which lives on as long as object instance exists
- Instance methods -> expose behavior of object
  - has access to instance variables
- Attribute accessor methods are shortcuts for defining *getter* and/or *setter* methods for each instance variable
  - takes symbol, not `@variable`
  - use `attr_reader` for just the getter method or `attr_writer` for just setter method
  - use `self.variable` within instance methods to differentiate between accessing the getter/setter method and creating new local variables

```ruby
class ClassName
  def name  # or "get_name"
    @name
  end

  def name=(n) # or "set_name="
    @name = n  # can be accessed by ClassName.name=('name') or just
               # ClassName.name = 'name'
  end
end

# can be shortened to
class ClassName
  attr_accessor :name
  # remember to not use @name instance variable within class
  # so you always use the getter method
end

```
---
- **class variables** are accessible from within instance methods
- **class methods** can be called without any instances of the class
- `.to_s` is called whenever you use `puts` or use string interpolation, and can be overridden in an instance method
- **self**, inside of an instance method, references the instance (object) that called the method - the calling object. Therefore, `self.weight=` is the same as `sparky.weight=`
- **self**, outside of an instance method, references the class and can be used to define class methods. Therefore, `def self.name=(n)` is the same as `def GoodDog.name=(n)`
----
### **Inheritance**

- `super` lets us look up the inheritance hierarchy
  - if you use `super` from within an instance method, it will look for a method of the same name in the hierarchy and call it
- `super` takes all arguments by default, `super()` specifies that it won't take any arguments
```ruby
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  def speak
    super + " from GoodDog class"
  end
end

sparky = GoodDog.new
sparky.speak        
# => "Hello! from GoodDog class"
```
- a more common way of using `super` is to use it to send parameters to `initialize` method up in the hierarchy
```ruby
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

BadDog.new(2, "bear")
# => #<BadDog:0x007fb40b2beb68 @age=2, @name="bear">
```
### When to use modules vs Inheritance
- you can only subclass from *one* class, but you can mix in as many modules as you want
- choose class inheritance for *is-a* relationships, and modules for *has-a* relationships

### Method lookup path
- initial class -> modules in initial class from last to first -> superclass -> modules in superclass from last to first -> Object -> Kernel -> BasicObject

### Uses for modules
1. **namespacing** - organize similar classes under a module
- can access classes in a modules by using `::` (ex. `Mammal::Dog.new`)
2. **use as container for module methods** - can keep out-of-place methods in a module, ex:
```ruby
module Mammal
  # ...

  def self.some_out_of_place_method(num)
    num ** 2
  end
end

value = Mammal.some_out_of_place_method(4)
```
### Private, protected, and public
- `private` methods are not accessible outside of the class definition AND need to be called without `self.`
- `protected` methods act like `private` methods from outside the class (not accessible) BUT are accessible like `public` methods from inside the class (can use `self.`) - even other instances of the same class (access is kept inside the family)
- both `private` and `protected` methods are inherited by subclasses
```ruby
class Animal
  def a_public_method
    "Will this work? " + self.a_protected_method
  end

  protected

  def a_protected_method
    "Yes, I'm protected!"
  end
end

fido = Animal.new
fido.a_public_method
# => Will this work? Yes, I'm protected!
```

- `extend` is similar to `include` within a class, but allows access to the extended class's methods from the class itself (not just instances)
