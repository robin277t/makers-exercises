puts "player 1 enter your move"
play1 = gets.chomp
puts "player 2 enter your move"
play2 = gets.chomp
if (play1 == "rock" && play2 == "scissors") || (play1 == "paper" && play2 == "rock") || 
  (play1 == "scissors" && play2 == "paper")
  puts "Player 1 wins"
elsif play1 == play2
  puts "It's a draw"
else
  puts "Player 2 wins"
end