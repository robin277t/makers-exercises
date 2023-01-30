#moving forward game
=begin
puts "Please input your player name"
name = gets.chomp
puts "Hi #{name}, you are now starting the game. You are facing forward, and for your first move
can go forward, left or right, by entering those words. Please make your choice"

while true do
move1 = gets.chomp
    if move1 == "left"
        puts "Alas you have died, by Goblin. Game Over. Goodbye!"
        break
    elsif move1 == "right"
        puts "Alas you have died, by Werewolf. Game Over. Goodbye!"
        break
    elsif move1 == "forward"
        puts "Great move, you have survived. Please enter your second move (the options are the same as the last move)"
    else 
        puts "Invalid move, please enter forward, left or right"
    end
end
=end


move_number = 1

while true do
  puts "You're facing forward. You can type forward, left, or right."

  user_input = gets.chomp

  if user_input == "right"
    puts "You were killed by a goblin!"
    break
  elsif user_input == "left"
    puts "You were killed by a werewolf!"
    break
  elsif user_input == "forward"
        if move_number == 2
          puts "You win!"
          break
        end
        move_number += 1
  end
end
