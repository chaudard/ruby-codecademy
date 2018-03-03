=begin

Collect 'Em All
Good! There are a bunch of really useful Ruby methods that take blocks. One we haven't covered yet is collect.

The collect method takes a block and applies the expression in the block to every element in an array. Check it out:

my_nums = [1, 2, 3]
my_nums.collect { |num| num ** 2 }
# ==> [1, 4, 9]
If we look at the value of my_nums, though, we'll see it hasn't changed:

my_nums
# ==> [1, 2, 3]
This is because .collect returns a copy of my_nums, but doesn't change (or mutate) the original my_nums array. If we want to do that, we can use .collect! with an exclamation point:

my_nums.collect! { |num| num ** 2 }
# ==> [1, 4, 9]
my_nums
# ==> [1, 4, 9]
Recall that the ! in Ruby means "this method could do something dangerous or unexpected!" In this case, it mutates the original array instead of creating a new one.

=end

fibs = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

doubled_fibs = fibs.collect {|fib| fib*2}

puts doubled_fibs


=begin

Learning to Yield
Why do some methods accept a block and others don't? It's because methods that accept blocks have a way of transferring control from the calling method to the block and back again. We can build this into the methods we define by using the yield keyword.

=end

def block_test
  puts "We're in the method!"
  puts "Yielding to the block..."
  yield
  puts "We're back in the method!"
end

block_test { puts ">>> We're in the block!" }

=begin

Yielding With Parameters
You can also pass parameters to yield! Check out the example in the editor.

The yield_name method is defined with one parameter, name.
On line 9, we call the yield_name method and supply the argument "Eric" for the name parameter. Since yield_name has a yield statement, we will also need to supply a block.
Inside the method, on line 2, we first puts an introductory statement.
Then we yield to the block and pass in "Kim".
In the block, n is now equal to "Kim" and we puts out "My name is Kim."
Back in the method, we puts out that we are in between the yields.
Then we yield to the block again. This time, we pass in "Eric" which we stored in the name parameter.
In the block, n is now equal to "Eric" and we puts out "My name is Eric."
Finally, we puts out a closing statement.

=end

def yield_name(name)
  puts "In the method! Let's yield."
  yield("Kim")
  puts "In between the yields!"
  yield(name)
  puts "Block complete! Back in the method."
end

yield_name("Eric") { |n| puts "My name is #{n}." }

yield_name("dany") {|a| puts "The best is #{a}"}

# Now call the method with your name!


def double(num)
  yield(num)  
end

double(5) {|num| puts num*2}

=begin 

Blocks are not objects, and this is one of the very few exceptions to the "everything is an object" rule in Ruby.
Because of this, blocks can't be saved to variables and don't have all the powers and abilities of a real object. For that, we'll need... procs!

=end

multiples_of_3 = Proc.new do |n|
  n % 3 == 0
end

print (1..100).to_a.select(&multiples_of_3)

=begin

Proc Syntax
Procs are easy to define! You just call Proc.new and pass in the block you want to save. Here's how we'd create a proc called cube that cubes a number (raises it to the third power):

cube = Proc.new { |x| x ** 3 }
We can then pass the proc to a method that would otherwise take a block, and we don't have to rewrite the block over and over!

[1, 2, 3].collect!(&cube)
# ==> [1, 8, 27]
[4, 5, 6].map!(&cube)
# ==> [64, 125, 216]
(The .collect! and .map! methods do the exact same thing.)

The & is used to convert the cube proc into a block (since .collect! and .map! normally take a block). We'll do this any time we pass a proc to a method that expects a block.

NB : The .floor method rounds a float (a number with a decimal) down to the nearest integer.

=end

floats = [1.2, 3.45, 0.91, 7.727, 11.42, 482.911]
# Write your code below this line!

round_down = Proc.new {|float| float.floor}


# Write your code above this line!
ints = floats.collect(&round_down)
print ints

=begin

Create a method, greeter, that takes no arguments and yields to a block.

Create a Proc, phrase, that puts "Hello there!". Pass this to greeter instead of a block. (Don't forget to pass &phrase instead of just phrase!)

=end

phrase = Proc.new { puts "Hello there!"}

def greeter
  yield
end

greeter(&phrase)

=begin

Unlike blocks, we can call procs directly by using Ruby's .call method. Check it out!

test = Proc.new { # does something }
test.call
# does that something!

=end

hi = Proc.new {puts "Hello!"}
hi.call

=begin

Symbols, Meet Procs
Now that you're learning some of the more complex parts of the Ruby language, you can combine them to work some truly arcane magicks. For instance, remember when we told you that you could pass a Ruby method name around with a symbol? Well, you can also convert symbols to procs using that handy little &.

Check it out:

strings = ["1", "2", "3"]
nums = strings.map(&:to_i)
# ==> [1, 2, 3]
By mapping &:to_i over every element of strings, we turned each string into an integer!



exercise
Using the example in the instructions as a guide, use collect or map to create the strings_array from the numbers_array. Each element of strings_array should be the string version of the corresponding element from the numbers_array (that is, it should go ["1", "2", "3"... "10"]).

=end

numbers_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

strings_array = numbers_array.map(&:to_s)

puts strings_array

=begin


The Ruby Lambda
Like procs, lambdas are objects. The similarities don't stop there: with the exception of a bit of syntax and a few behavioral quirks, lambdas are identical to procs.

Check out the code in the editor. See the lambda bit? Typing

lambda { puts "Hello!" }
Is just about the same as

Proc.new { puts "Hello!" }
In the example to the right, when we pass the lambda to lambda_demo, the method calls the lambda and executes its code.

=end

ef lambda_demo(a_lambda)
  puts "I'm the method!"
  a_lambda.call
end

lambda_demo(lambda { puts "I'm the lambda!" })


=begin

exercice

We have an array of strings in the editor, but we want an array of symbols.

On line 4, create a new variable called symbolize. In symbolize, store a lambda that takes one parameter and calls .to_sym on that parameter.

We then use symbolize with the .collect method to convert the items in strings to symbols!

=end

strings = ["leonardo", "donatello", "raphael", "michaelangelo"]
# Write your code below this line!

symbolize = lambda {|param| param.to_sym}

# Write your code above this line!
symbols = strings.collect(&symbolize)
print symbols


=begin

Lambdas vs. Procs
If you're thinking that procs and lambdas look super similar, that's because they are! There are only two main differences.

First, a lambda checks the number of arguments passed to it, while a proc does not. This means that a lambda will throw an error if you pass it the wrong number of arguments, whereas a proc will ignore unexpected arguments and assign nil to any that are missing.

Second, when a lambda returns, it passes control back to the calling method; when a proc returns, it does so immediately, without going back to the calling method.

To see how this works, take a look at the code in the editor. Our first method calls a proc; the second calls a lambda.

=end

def batman_ironman_proc
  victor = Proc.new { return "Batman will win!" } # proc ne rend pas la main
  victor.call
  "Iron Man will win!"
end

puts batman_ironman_proc

def batman_ironman_lambda
  victor = lambda { return "Batman will win!" } # lambda rend la main
  victor.call
  "Iron Man will win!"
end

puts batman_ironman_lambda

=begin 

exercise

Create a lambda, symbol_filter, that takes one parameter and checks to see if that parameter .is_a? Symbol.

Create a new variable called symbols, and store the result of calling my_array.select and passing it your lambda.

puts symbols at the end of the file in order to see the final contents of the array.

=end

my_array = ["raindrops", :kettles, "whiskers", :mittens, :packages]

symbol_filter = lambda {|param| param.is_a? Symbol}

symbols = my_array.select(&symbol_filter)

puts symbols

=begin

Quick Review
All this talk of blocks, procs, and lambdas might have your head spinning. Let's take a minute to clarify exactly what each one is:

A block is just a bit of code between do..end or {}. It's not an object on its own, but it can be passed to methods like .each or .select.
A proc is a saved block we can use over and over.
A lambda is just like a proc, only it cares about the number of arguments it gets and it returns to its calling method rather than returning immediately.
There are obviously lots of cases in which blocks, procs, and lambdas can do similar work, but the exact circumstances of your program will help you decide which one you want to use.

=end


=begin

exercise

The odds_n_ends array is full of all sorts of objects, but we only want the integers (numbers without decimal bits).

Create a new variable, ints, and store the result of calling odds_n_ends.select method with a block that checks if the element .is_a? Integer.

puts ints at the end of the file in order to see the final contents of the array.

=end

odds_n_ends = [:weezard, 42, "Trady Blix", 3, true, 19, 12.345]

ints = odds_n_ends.select {|item| item.is_a? Integer}

puts ints

=begin

exercise

Create a proc called under_100 that checks if a number it's passed is less than 100. (We'll handle passing this proc the .select method in the next exercise—we won't need to do anything with the ages array just yet.)

=end

ages = [23, 101, 7, 104, 11, 94, 100, 121, 101, 70, 44]

under_100 = Proc.new {|number| number<100}

=begin

Now we'll be using the ages array. Create a variable called youngsters and set it equal to calling .select on ages, and pass in your under_100 proc to filter for the ages that are less than one hundred. Remember to pass &under_100 to convert your proc to a block!

puts youngsters at the end of the file in order to see the final contents of the array.

=end
ages = [23, 101, 7, 104, 11, 94, 100, 121, 101, 70, 44]

under_100 = Proc.new {|number| number<100}

youngsters = ages.select(&under_100)

puts youngsters


=begin

exercise

Create a lambda called first_half that checks if a hash value is less than (that is, earlier in the alphabet than) "M". (No need to do anything with the crew hash yet.) Make sure to use a capital "M," since we'll be checking capitalized names! Because it will be checking a hash, your lambda should include |key, value| instead of just |value|.

To finish up, let's go ahead and create a variable called a_to_m and set it equal to calling .select on crew, and pass in your first_half lambda to filter for the names that are before "M" in the alphabet. Remember to pass &first_half to convert your lambda to a block!

puts a_to_m at the end of the file in order to see the final contents of the array.

=end

crew = {
  captain: "Picard",
  first_officer: "Riker",
  lt_cdr: "Data",
  lt: "Worf",
  ensign: "Ro",
  counselor: "Troi",
  chief_engineer: "LaForge",
  doctor: "Crusher"
}
first_half = lambda {|key,value| value.capitalize<"M"}

a_to_m = crew.select(&first_half)

puts a_to_m	






