=begin
	
replace 's' by 'th'
	
=end

print "Thtring, pleathe!: "
user_input = gets.chomp
user_input.downcase!

if user_input.include? "s"
  user_input.gsub!(/s/, "th")
else
  puts "Nothing to do here!"
end
  
puts "Your string is: #{user_input}"

#--------------------------------

print "print a string with 's' include : "
user_input = gets.chomp.downcase!
if user_input.include? "s"
  user_input.gsub!(/s/, "th")
  puts "daffy duck would say : #{user_input}"
else
  puts "my string does not contain an s"
end