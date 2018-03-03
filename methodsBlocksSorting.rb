# .to_a affiche un tableau sans l'instancier
def array_of_10
  puts (1..10).to_a
end

array_of_10

# splat est un paramètre qui peut être composé de plusieurs arguments mais on ne sait pas combien
	
def what_up(greeting, *friends)
  friends.each { |friend| puts "#{greeting}, #{friend}!" }
end

what_up("What up", "Ian", "Zoe", "Zenas", "Eleanor")

=begin
blocks : méthode anonymes ; on définit un block juste avec un do end ; pour rappel , le 'do end' peut aussi être fait avec {}
un block ne nécessite pas de nom ; on utilise un block souvent pour faire une opération sur chaque itération; si le traitement ne se fait que là, c'est inutile de définit une méthode en dehors.
On utilise alors le concept de block (équivalent de la méthode anonyme en js)
=end

# method that capitalizes a word
def capitalize(string) 
  puts "#{string[0].upcase}#{string[1..-1]}"
end

capitalize("ryan") # prints "Ryan"
capitalize("jane") # prints "Jane"

# block that capitalizes each string in the array

["ryan", "jane"].each {|string| puts "#{string[0].upcase}#{string[1..-1]}"} # prints "Ryan", then "Jane"
# est équivalent à :
# ["ryan", "jane"].each do |string| puts "#{string[0].upcase}#{string[1..-1]}" end

# SORT

my_array = [3, 4, 8, 7, 1, 6, 5, 9, 2]

# Call the sort! method on my_array below.
# my_array should then equal [1, 2, 3, 4, 5, 6, 7, 8, 9].

my_array.sort! # ne pas oublier le ! pour que le tri se fasse direcrement sur my_array
puts my_array

#----------
# library sorting code
books = ["Charlie and the Chocolate Factory", "War and Peace", "Utopia", "A Brief History of Time", "A Wrinkle in Time"]

# How might we sort! the books in alphabetical order? (Hint, hint)

books.sort!
puts books # waouwwww what a powerful language !!!!

=begin

The Combined Comparison Operator
We can also use a new operator called the combined comparison operator to compare two Ruby objects. The combined comparison operator looks like this: <=>. It returns 0 if the first operand (item to be compared) equals the second, 1 if the first operand is greater than the second, and -1 if the first operand is less than the second.

A block that is passed into the sort method must return either1, 0, or -1. It should return -1 if the first block parameter should come before the second, 1 if vice versa, and 0 if they are of equal weight, meaning one does not come before the other (i.e. if two values are equal)

=end

book_1 = "A Wrinkle in Time"

book_2 = "A Brief History of Time"

puts book_1 <=> book_2

=begin

Getting Technical
What if we wanted to sort the books by title, but from Z – A, or descending order? It appears that Ruby's sort method only works for A – Z, or ascending order.

The sort method assumes by default that you want to sort in ascending order, but it accepts a block as an optional argument that allows you, the programmer, to specify how two items should be compared.
=end

books = ["Charlie and the Chocolate Factory", "War and Peace", "Utopia", "A Brief History of Time", "A Wrinkle in Time"]

# To sort our books in ascending order, in-place
books.sort! { |firstBook, secondBook| firstBook <=> secondBook }

# Sort your books in descending order, in-place below

books.sort! { |firstBook, secondBook| secondBook <=> firstBook }

puts books

#--------------------

=begin

Use .sort! to sort the fruits array in descending (that is, reverse) alphabetical order.

=end

fruits = ["orange", "apple", "banana", "pear", "grapes"]

fruits.sort! {|first,second| second <=> first}

puts fruits