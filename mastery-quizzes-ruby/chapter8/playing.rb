=begin
thing = gets.chomp
dictionary = {
    "bear" => "a creature that fishes in the river for salmon.",
    "river" => "a body of water that contains salmon, and sometimes bears.",
    "salmon" => "a fish, sometimes in a river, sometimes in a bear, and sometimes in both"}
puts dictionary[thing]
=end


players = [
  { :name => "Sam", :sport => "tennis" },
  { :name => "Mary", :sport => "squash" },
  { :name => "Ed", :sport => "tennis" },
  { :name => "Mark", :sport => "football" }
  ]
  
players_of_sport = {}

players.each do |pla|
    spo = pla[:sport]

    if players_of_sport[spo] == nil
        players_of_sport[spo] = []    
    end
    players_of_sport[spo].push(pla[:name])
   
end

puts players_of_sport

players_of_sport.each do |key, value|
    p key.to_sym
    print value
end

