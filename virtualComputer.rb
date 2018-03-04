class Machine
  @@users = {}
  
  def initialize(username, password)
    @username = username
    @password = password
    @@users[username] = password
    @files = {}
  end
  
  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "#{filename} was created by #{@username} at #{time}."
  end
  
  def Machine.get_users
    @@users
  end
end

my_machine = Machine.new("eric", 01234)
your_machine = Machine.new("you", 56789)

my_machine.create("groceries.txt")
your_machine.create("todo.txt")

puts "Users: #{Machine.get_users}"

=begin

to create a class method (in order to reach a class variable)

class Machine
  def Machine.hello
    puts "Hello from the machine!"
  end
end

=end


=begin

my code 



class Computer
  @@users = Hash.new
  def initialize(username, password)
    @username = username
    @password = password
    @files = Hash.new
    @@users[username] = password
  end
  
  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "A new file : '#{filename}' was created at #{time}"
  end
  
  def Computer.get_users
    @@users
  end
  
end

my_computer = Computer.new("dany","12345")




=end