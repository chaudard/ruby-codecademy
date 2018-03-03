puts "Text please: " # "the rain in Spain falls mainly on the plain,"
text = gets.chomp

words = text.split(" ")
frequencies = Hash.new(0) # 0 is the default value . If you have a hash with a default value, and you try to access a non-existent key, you get that default value.
words.each { |word| frequencies[word] += 1 }
frequencies = frequencies.sort_by {|a, b| b }
frequencies.reverse!
frequencies.each { |word, frequency| puts word + " " + frequency.to_s }


#---------------------------------#

puts "enter your text : " # "the rain in Spain falls mainly on the plain,"
text = gets.chomp
words = text.split(" ")
puts words.size
puts words

frequencies = Hash.new(0)# 0 is the default value . If you have a hash with a default value, and you try to access a non-existent key, you get that default value.
words.each do |word|
  frequencies[word] += 1
end

frequencies = frequencies.sort_by do |word,number| 
	number
end
frequencies.reverse!

frequencies.each do |word,number|
  puts word +" "+number.to_s
end