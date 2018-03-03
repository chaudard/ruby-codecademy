# if you dont know how many times
counter = 1
while counter < 11
  puts counter
  counter = counter + 1
end

=begin
	
The complement to the while loop is the until loop. It's sort of like a backward while
	
=end

counter = 1
until counter > 10
  puts counter
  # Add code to update 'counter' here!
  counter += 1
end


# if you know how many times

for num in 1...10 # ... excludes 10 ; .. includes 10
	puts num
end