#Shouting problem
puts "Please enter you name"
name = gets.chomp
name.downcase.chr == "s" ? (puts "bloody hell #{name.upcase}!!!") : (puts "hi #{name}")
