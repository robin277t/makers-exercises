# * Two rooms: hall and study.
# * The player starts in the hall.
# * General commands (can be run at any time).
#   * `quit`: `puts`es `Bye!` and the program stops executing.
#   * (command incorrect for situation): nothing happens, nothing is
#                                        `puts`ed.
# * Room-specific commands
#   * Hall
#     * `look`: `puts`es `You are standing in a hall with a marble
#               floor. You see a door.`
#     * `north`: Move to the study.
#   * Study:
#     * `look`: `puts`es `You are in a warm and cosy study. You see a
#               safe. You see a desk.`
#     * `look at desk`: `puts`es `You see a piece of paper that reads,
#                       The combination is 2451.`
#     * `south`: Move to the hall.
#     * `enter combination 2451`: `puts`es `You see some diamonds in
#                                 the safe, pick them up and make your
#                                 escape` and the program stops
#                                 executing.
room = 0
while true do
  command1 = gets.chomp  
  if command1 == "look" && room == 0
    puts "You are standing in a hall with a marble floor. You see a door."
  elsif command1 == "north" && room == 0
    room += 1
  elsif command1 == "look" && room == 1
    puts "You are in a warm and cosy study. You see a safe. You see a desk."
  elsif command1 == "look at desk" && room == 1
    puts "You see a piece of paper that reads, The combination is 2451."
  elsif command1 == "south" && room == 1
    room -= 1
  elsif command1 == "enter combination 2451"
    puts "You see some diamonds in the safe, pick them up and make your escape"
    break
  elsif command1 == "quit"
    puts "Bye!"
    break
  end
end
