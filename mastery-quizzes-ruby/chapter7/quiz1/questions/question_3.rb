# Write a game where the player swims down a river infested with
# crocodiles.  The game should:
# * Use the `river` variable that defines the river (see code below).
#   * `-`: clear water.
#   * `C`: crocodile.
#   * The first five characters represent the first part of the river.
#     The second five characters represent the second part of the
#     river.  And so on.
# * Define the player as one character wide.
# * Start the player at the central position of the first part of the
#   river.
#   * e.g. `C-P--`.
# * Each turn:
#   * Check to see if the player is in the same position as a
#     crocodile.  If they are, `puts` `You were eaten.' and stop the
#     program.
#   * `puts` the whole river.  Include a `P` where the player is.
#   * Ask the player if they want to go to left, right or neither.
#     The player enters `left`, `right` or `neither`.
#   * Make the player float down the river by one river part (one line
#     of digits).  Move them to the left, the right, or keep them
#     where they are.
# Print `You survived!` if the player makes it past all parts of the
# river without hitting a crocodile.
#
# * Note: To stop the game when the user is eaten or survives the
#   whole river, don't use `exit` to quit the program because this
#   will break the automated tests.  To exit a while loop early, use
#   the `break` keyword.
#
# * Note: You can assume the player will never move outside the
#   boundary of the river when they choose left and right.  You can
#   also assume the player will always enter either `left`, `right` or
#   `neither`.
#
# * Example output:
#   ```
#   --P--
#   --C--
#   CC-CC
#   CC-CC
#   Type left, right or neither
#   left
#   -----
#   -PC--
#   CC-CC
#   CC-CC
#   Type left, right or neither
#   right
#   -----
#   --C--
#   CCPCC
#   CC-CC
#   Type left, right or neither
#   neither
#   -----
#   --C--
#   CC-CC
#   CCPCC
#   Type left, right or neither
#   neither
#   You survived!
#   ```

river = ["-----", "--C--", "CC-CC", "CC-CC"]
turn = 0
position = 2
river[turn][position] = "P"
puts river
river[turn][position] = "-"
while true do
  puts "Type left, right or neither"
  move = gets.chomp
  if move == "left"
    position -= 1
  elsif move == "right"
    position += 1
  end
  turn += 1
  if turn == 4
    puts "You survived!"
    break
  end
  str1 = river[turn]
  if str1[position] == "C"
    puts river
    puts "You were eaten"
    break
  else
    river[turn][position] = "P"
    puts river
    river[turn][position] = "-"
  end
end

=begin
1 - turn river into array
2 - make player array.sub_array, and start character P in a string at position[2] of array 0,0
3 - if P[] = C[] then put message of death and break, else ask for next move
4 - ask for input of left, right, neither
5 - make accumulator, and iterate after each word input (start at 0 to match indexing)
6 - make position tracker (starts at 2), make sure this is locked to range 0-4
7 - add new Player string of 5 to array with P at position tracker position
8 - add new player string to array
9 - check new array against river array using index number
10 -victory message if accumulator reaches 4
=end

