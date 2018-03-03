puts "hello" if 1<2 # A Simpler 'If'
puts "hello" unless 1>2 # The One-Line Unless
puts 3<4? "true" : "false" # ternary conditional expression

print "what is your favorite language ? "
language = gets.chomp.downcase

case language
	when "ruby" then puts "ruby is the best choice"
	when "js" then puts "js is cool"
	else puts "i dont know"
end

puts "Hello there!"
puts "choice your language. Type the following choices :"
puts "English"
puts "French"
puts "German"
puts "Finnish"
greeting = gets.chomp

# Add your case statement below!
case greeting
  when "English" then puts "hello!"
  when "French" then puts "Bonjour!"
  when "German" then puts "Guten Tag!"
  when "Finnish" then puts "Haloo!"
  else puts "I don't know the language!"
end

# Conditional Assignment ||= assign a variable if it hasn't already been assigned

favorite_book = nil
puts favorite_book

favorite_book ||= "Cat's Cradle"
puts favorite_book

favorite_book ||= "Why's (Poignant) Guide to Ruby" # this does not assign favorite_book because favorite_book <> nil
puts favorite_book

favorite_book = "Why's (Poignant) Guide to Ruby"
puts favorite_book	

# Implicit Return : Ruby's methods will return the result of the last evaluated expression.

def multiple_of_three(n)
  n % 3 == 0 ? "True" : "False"
end

def square(num)
  num**2
end

# display only even values (even = pair ; odd = impair)

my_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

my_array.each {|num| puts num if num%2==0}

# We might use .upto to print out a specific range of values:

95.upto(100) { |num| print num, " " }
# Prints 95 96 97 98 99 100

# and we can use .downto to do the same thing with descending values.


# Use .upto to puts the capital letters "L" through "P".
"l".upto("p") {|letter| puts letter.capitalize}

=begin

Call and Response
Remember when we mentioned that symbols are awesome for referencing method names? Well, .respond_to? takes a symbol and returns true if an object can receive that method and false otherwise. For example,

[1, 2, 3].respond_to?(:push)
would return true, since you can call .push on an array object. However,

[1, 2, 3].respond_to?(:to_sym)
would return false, since you can't turn an array into a symbol.


Rather than checking to see if our age variable is an integer, check to see if it will .respond_to? the .next method. (.next will return the integer immediately following the integer it's called on, meaning 4.next will return 5.)
=end

age = 26

puts age.respond_to?(:next) ? "Integer supports :next" : "Integer does not support :next"

=begin

Instead of typing out the .push method name, you can simply use <<, the concatenation operator (also known as "the shovel") to add an element to the end of an array:

[1, 2, 3] << 4
# ==> [1, 2, 3, 4]
Good news: it also works on strings! You can do:

"Yukihiro " << "Matsumoto"
# ==> "Yukihiro Matsumoto"

=end

# string interpollation 
drink = "dolce gusto"
puts "i love #{drink}"






























