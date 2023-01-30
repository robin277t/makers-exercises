# Write a program that calculates the score for a word in Scrabble.
# It should:
# * Ask the user for a word e.g. `apple`.
# * `puts` the score for the word in Scrabble by totalling the points
#   for each letter in the word.
#   * Points for each letter:
#     * 0 points: blank tile
#     * 1 point: E,  A,  I,  O,  N,  R,  T,  L,  S,  U
#     * 2 points: D,  G
#     * 3 points: B,  C,  M,  P
#     * 4 points: F,  H,  V,  W,  Y
#     * 5 points: K
#     * 8 points: J,  X
#     * 10 points: Q,  Z
# * Note: You can assume that the user will enter a word that only
#   contains letters and blanks.  You can assume the word will be in
#   uppercase.
=begin
1- create a hash with points as keys,  and an array of letters as the elements
2- ask user for input,  and take it as .upcase
3- loop through letters of the given string,  lookup in the hash and add key as integer to an adder
4- puts out adder
=end

scores = {
    "0" => [" "],  
    "1" => ["E", "A", "I", "O", "N", "R", "T", "L", "S", "U"], 
    "2" => ["D", "G"], 
    "3" => ["B", "C", "M", "P"], 
    "4" => ["F", "H", "V", "W", "Y"], 
    "5" => ["K"], 
    "8" => ["J", "X"], 
    "10" => ["Q", "Z"]
    }
puts "Please enter a word"
word = gets.chomp.upcase
total = 0
ticker = 0
while ticker < word.length do
  x = word[ticker]
  scores.each do |number, letters|
    if letters.include? x
      y = number.to_i
      total = total + y
    end
  end    
  ticker += 1
end
puts total