=begin

What's a Symbol?
You can think of a Ruby symbol as a sort of name. It's important to remember that symbols aren't strings:

Above and beyond the different syntax, there's a key behavior of symbols that makes them different from strings. While there can be multiple different strings that all have the same value, there's only one copy of any particular symbol at a given time.

The .object_id method gets the ID of an object—it's how Ruby knows whether two objects are the exact same object. Run the code in the editor to see that the two "strings" are actually different objects, whereas the :symbol is the same object listed twice.

=end

puts "string".object_id
puts "string".object_id

puts :symbol.object_id
puts :symbol.object_id

=begin=

Symbols make good hash keys for a few reasons:

They're immutable, meaning they can't be changed once they're created;
Only one copy of any symbol exists at a given time, so they save memory;
Symbol-as-keys are faster than strings-as-keys because of the above two reasons.

=end

sounds = {
  :cat => "meow",  # nickname = "the hash rocket style" because the => looks like a tiny rocket!
  :dog => "woof",
  :computer => 10010110,
}

=begin

Converting Between Symbols and Strings
Converting between strings and symbols is a snap.

:sasquatch.to_s
# ==> "sasquatch"

"sasquatch".to_sym
# ==> :sasquatch
The .to_s and .to_sym methods are what you're looking for!

NB : .intern = .to_sym

=end

strings = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]

# Add your code below!

symbols = []
strings.each do |s|
  symbols.push(s.to_sym) # = symbols.push(s.intern)
end
print symbols

=begin
However, the hash syntax changed in Ruby 1.9
new_hash = { 
  one: 1,
  two: 2,
  three: 3
}
The two changes are:

You put the colon at the end of the symbol, not at the beginning;
You don't need the hash rocket anymore.
It's important to note that even though these keys have colons at the end instead of the beginning, they're still symbols!

=end

movies = {
  rocky: "a boxer becames famous",
  others: "they are dead"
  }

=begin
hash keys as symbols are faster than the strings
There is a test to prove it
=end  

require 'benchmark'

string_AZ = Hash[("a".."z").to_a.zip((1..26).to_a)]
symbol_AZ = Hash[(:a..:z).to_a.zip((1..26).to_a)]

string_time = Benchmark.realtime do
  100_000.times { string_AZ["r"] }
end

symbol_time = Benchmark.realtime do
  100_000.times { symbol_AZ[:r] }
end

puts "String time: #{string_time} seconds."
puts "Symbol time: #{symbol_time} seconds."

# select in hash

grades = { alice: 100,
  bob: 92,
  chris: 95,
  dave: 97
}

grades.select { |name, grade| grade <  97 }
# ==> { :bob => 92, :chris => 95 }

grades.select { |k, v| k == :alice }
# ==> { :alice => 100 }

=begin
Create a new variable, good_movies, and set it equal to the result of calling .select on movie_ratings, selecting only movies with a rating strictly greater than 3.
=end
movie_ratings = {
  memento: 3,
  primer: 3.5,
  the_matrix: 5,
  truman_show: 4,
  red_dawn: 1.5,
  skyfall: 4,
  alex_cross: 2,
  uhf: 1,
  lion_king: 3.5
}

good_movies = movie_ratings.select {|k,v| v>3}

=begin
to iterate only on key or value, 
Ruby includes two hash methods, .each_key and .each_value, that do exactly what you'd expect:
=end

movie_ratings = {
  memento: 3,
  primer: 3.5,
  the_matrix: 3,
  truman_show: 4,
  red_dawn: 1.5,
  skyfall: 4,
  alex_cross: 2,
  uhf: 1,
  lion_king: 3.5
}
# Add your code below!

movie_ratings.each_key {|title| puts title}
