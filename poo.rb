class Computer
  $manufacturer = "Mango Computer, Inc."
  @@files = {hello: "Hello, world!"}
  
  def initialize(username, password)
    @username = username
    @password = password
  end
  
  def current_user
    @username
  end
  
  def self.display_files
    @@files
  end
end

# Make a new Computer instance:
hal = Computer.new("Dave", 12345)

puts "Current user: #{hal.current_user}"
# @username belongs to the hal instance.

puts "Manufacturer: #{$manufacturer}"
# $manufacturer is global! We can get it directly.

puts "Files: #{Computer.display_files}"
# @@files belongs to the Computer class.

=begin
scope of variables
$ = global (public)
@ = instance (private)
@@ = class

=end

=begin
exercise

Create a class variable, @@people_count, on line 3, and set it equal to 0.
Increment @@people_count on line 8.
Return @@people_count on line 13 so that our puts on line 20 will print out the number of people created so far.

=end

class Person
  # Set your class variable to 0 on line 3
  @@people_count = 0
  
  def initialize(name)
    @name = name
    # Increment your class variable on line 8
    @@people_count += 1
  end
  
  def self.number_of_instances
    # Return your class variable on line 13
    @@people_count
  end
end

matz = Person.new("Yukihiro")
dhh = Person.new("David")

puts "Number of Person instances: #{Person.number_of_instances}"


=begin

Inheritance Syntax
In Ruby, inheritance works like this:

class DerivedClass < BaseClass
  # Some stuff!
end
The derived class is the new class you're making and the base class is the class from which that new class inherits. You can read "<" as "inherits from."

=end

=begin

override : just define the same method in subclass

=end
class Creature
  def initialize(name)
    @name = name
  end
  
  def fight
    return "Punch to the chops!"
  end
end

# Add your code below!
class Dragon < Creature
  def fight
    return "Breathes fire!"
  end
end

=begin

SUPER

class DerivedClass < Base
  def some_method
    super(optional args)
      # Some stuff
    end
  end
end
When you call super from inside a method, that tells Ruby to look in the superclass of the current class and find a method with the same name as the one from which super is called. If it finds it, Ruby will use the superclass' version of the method.

=end

=begin

The demo code we're about to show you includes a fancy trick: if you want to end a Ruby statement without going to a new line, you can just type a semicolon. This means you can write something like

class Monkey
end
on just one line: class Monkey; end. This is a time saver when you're writing something very short, like an empty class or method definition.

=end

class Creature
  def initialize(name)
    @name = name
  end
end

class Person
  def initialize(name)
    @name = name
  end
end

class Dragon < Creature; end
class Dragon < Person; end # bug : superclass mismatch for class Dragon ; because Dragon inherits yer from Creature


#exercise

class Message
  @@messages_sent = 0
  def initialize(from, to)
    @from = from
    @to = to
    @@messages_sent += 1
  end
end

class Email < Message
  def initialize(from, to)
    super(from, to)
  end
end

my_message = Message.new("dany","catalina")









