def alphabetize(arr, rev=false)
  if rev
    arr.sort { |item1, item2| item2 <=> item1 }
  else
    arr.sort { |item1, item2| item1 <=> item2 }
  end
end

books = ["Heart of Darkness", "Code Complete", "The Lorax", "The Prophet", "Absalom, Absalom!"]

puts "A-Z: #{alphabetize(books)}"
puts "Z-A: #{alphabetize(books, true)}"

=begin

ce qui suit est aussi correct ! 

def alphabetize(arr, rev=true)
  if rev
    arr.sort {|item1,item2| item2 <=> item1} # tri dans le sens décroissant
  else
    arr.sort {|item1,item2| item1 <=> item2} # tri dans le sens croissant
  end
end

=end

def alphabetize(arr, rev=false)
  arr.sort!
  if rev
    return arr.reverse!
  else
    return arr
  end
end

numbers = [4, 3, 8, 12, 2]
alphabetize(numbers, true)
puts numbers