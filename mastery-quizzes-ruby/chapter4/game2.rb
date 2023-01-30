scoreA = 0
scoreB = 0

while true do
    random_numberA = rand(2..12)
    random_numberB = rand(2..12)
    puts "A rolls: #{random_numberA}, B rolls: #{random_numberB}"
        
    if random_numberA > random_numberB
        scoreA += 1
    elsif random_numberB > random_numberA
        scoreB += 1
    else
    end
    
    puts "Score is A:#{scoreA}, B:#{scoreB}"
    
    if scoreA == 3
        puts "Player A wins"
        break
    end
    if scoreB == 3
        puts "Player B wins"
        break
    end
end
