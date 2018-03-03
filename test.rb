movies = {
  rocky: 1,
  others: 2,
  backToTheFuture: 3,
  familyMan: 4
  }

def movieTitle?
  puts "What is the movie title ? "
  return gets.chomp.to_sym
end

def movieRating?
  puts "What is the rating ? "
  return gets.chomp.to_i
end

puts "what do you want to do ? "
puts "-- Type 'add' to add a movie."
puts "-- Type 'update' to update a movie."
puts "-- Type 'display' to display all movies."
puts "-- Type 'delete' to delete a movie."

choice = gets.chomp

case choice
  when "add"
    title = movieTitle?
    if movies[title] == nil
      rating = movieRating?
      movies[title] = rating
      puts "#{title} (#{rating}) was added."
    else
      puts "this movie already exists."
    end
  when "update"
    title = movieTitle?
    if movies[title] == nil
      puts "the movie is not in the hash"
    else
      rating = movieRating?
      movies[title] = rating
      puts "#{title} (#{rating}) was updated."
    end
  when "display"
    movies.each {|movie,rating| puts "#{movie}: #{rating}" }
  when "delete"
    title = movieTitle?
    if movies[title] == nil
      puts "the movie is not in the hash"
    else
      movies.delete(title)
      puts "movie has been deleted."
    end
  else
    puts "Error!"
end